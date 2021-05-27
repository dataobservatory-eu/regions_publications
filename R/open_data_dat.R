library(retroharmonize)
library(dplyr)

gesis_dir <- file.path("C:/Users/Daniel Antal/OneDrive - Visegrad Investments",
                       "_data", "gesis")

dir ( gesis_dir )

extreme_weather_files <- c( 
                     "ZA7488_v1-0-0.sav")

extreme_weather_files %in% dir (gesis_dir)

eb_waves <- read_surveys(file.path(gesis_dir, extreme_weather_files), .f='read_spss')

documented_eb_waves <- document_waves (eb_waves) 

eb_climate_metadata <- lapply ( X = eb_waves, FUN = metadata_create )
eb_climate_metadata <- do.call(rbind, eb_climate_metadata)

eb_demography_metadata  <- eb_climate_metadata %>%
  filter ( grepl( "rowid|isocntry|^d8$|^d7$|^wex|^w1$|d25|^d15a", .data$var_name_orig) ) %>%
  mutate ( var_name_suggested = var_label_normalize(.data$label_orig) ) %>%
  mutate ( var_name_suggested = ifelse ( .data$var_name_orig == "rowid", 
                                         "rowid", .data$var_name_suggested))
  

eb_regional_metadata <- eb_climate_metadata %>%
  mutate ( var_name_suggested = var_label_normalize(.data$label_orig) ) %>%
  filter ( grepl( "rowid|isocntry|p7", .data$var_name_orig)) %>%
  mutate ( var_name_suggested = ifelse ( .data$var_name_orig == "rowid", 
                                         "rowid", .data$var_name_suggested))
  

extreme_weather_metadata <- eb_climate_metadata %>%
  mutate ( var_name_suggested = var_label_normalize(.data$label_orig) ) %>%
  mutate ( var_name_suggested = snakecase::to_snake_case(.data$var_name_suggested)) %>%
  mutate ( var_name_suggested = ifelse ( .data$var_name_orig == "rowid", 
                                         "rowid", .data$var_name_suggested)) %>%
  filter ( grepl( "^extreme", .data$label_orig) |
             .data$var_name_orig == "rowid"
           ) 

label_0 <- collect_val_labels(extreme_weather_metadata)

label_0 

harmonized_ew_waves <- harmonize_var_names ( waves = eb_waves, 
                                             metadata = extreme_weather_metadata  )

extreme_weather_data <- harmonized_ew_waves[[1]] %>%
  mutate ( across(contains("extreme")), harmonize_extreme_weather(.))

hew <- harmonize_waves ( 
  waves = harmonized_ew_waves, 
  .f = harmonize_extreme_weather )

hew <- hew %>% filter ( !is.na(.data$extreme_weather_due_to_climate_change_floods))

harmonize_extreme_weather <- function(x) {
  label_list <- list(
    from = c("Yes, definitely", "Yes, to some extent","No, not really", "No, not at all", "DK"), 
    to = c( "yes", "yes_some", "not_really", "no",
            "do_not_know"), 
    numeric_values = c(3,2,1,0,
                       99997)
  )
  
  harmonize_values(x, 
                   harmonize_labels = label_list, 
                   na_values = c("do_not_know"=99997,
                                 "declined"=99998,
                                 "inap"=99999), 
                   remove = "\\(|\\)|\\[|\\]|\\%"
  )
}
