

waves <- eb_waves
metadata <- eb_climate_metadata

class (  waves[[1]] )

attributes ( waves[[1]] )

View (metadata)

harmonize_var_names <- function ( waves, metadata, rowids = TRUE ) {
  
  if ( rowids == TRUE) {
    metadata <- metadata %>% 
      mutate ( var_name = ifelse ( .data$var_name_orig == "rowid", "uniqid", .data$var_name ) )
  }
  
  rename_wave <- function (this_survey) {
    
    this_metadata <- metadata[attr(this_survey, "filename") == metadata$filename, ]
    assertthat::assert_that(nrow(this_metadata)>2, 
                            msg = glue::glue("The metadata of {attr(this_survey, 'filename')} cannot be found")
    )
    
    renaming <- data.frame ( var_name_orig = names(this_survey) ) %>%
      left_join ( this_metadata %>% 
                    select ( all_of (c("var_name_orig", "var_name"))), 
                  by = "var_name_orig")
    
    purrr::set_names(this_survey, nm = renaming$var_name)
    
  }
  
  lapply ( waves, rename_wave )
}

hw <- harmonize_var_names ( eb_waves, eb_climate_metadata )

metadata %>% filter ( 
  .data$var_name %in% )

subset_waves <- function ( waves, 
                           subset_names = c("uniqid", "serious_world_problems_first", "serious_world_problems_climate_change") ) {
  
  subset_survey <- function(this_survey) {
    
    this_survey %>% select ( any_of ( subset_names ) )
  }
  
  hw2 <- lapply ( hw, subset_survey)
  
  
}


hw2[[1]] 
