## Strategic aims

1.  A new release for regions with improved usability.

2.  A conversion tool to Eurobarometer and NUTS and new datasets.

3.  A ‘software paper’ in the [Journal of Open Research](#jors). We can
    be publication ready in 1-2 months.

4.  Acknowledgment from a national statistical authority. For example,
    an EU statistical authority publishes our NUTS tables for
    information purposes. Acknowledgements from scientific users (our
    data passed peer-review in various disciplines.)

5.  [Journal of Statistical Software](#jss). This will require a longer
    time, and several validation points for our data.

6.  Acknowledgement from Eurostat

## Next Contributions

-   Create an `R-regions-literature.bib` for the references we want to
    use in the publications.

-   Create a reproducible workflow to import LAU/NUTS correspondence
    tables.

-   Review and test the `validate_geo_code()` function - the manual
    checks will have to be published in vignette or some other form, and
    be available for future publication reviewers.

-   The conversion function must be reviewed for all exceptions,
    particularly regarding small countries with no or few NUTS divisions
    like Luxembourg, Malta, Cyprus, etc. This description should be part
    of the package description.

-   Review and test the `impute_down()` function and *clearly describe*
    when it can be used, and when it cannot be used.

-   Clearly define the relationship between country boundaries (NUTS0),
    NUTS, LAU and ISO 3166-2. What are these, what are the similarities,
    differences, and how we work with them. Also include a clear
    definition what sort of further topologies can be added by
    contributors.

-   Create an API connection or a reader to the ISO website for all
    Eurobarometer, Arabbarometer and Afrobarometer countries, to have a
    real-time validation to all ISO 3166-2 countries.

-   Create a sound description of the problem of sub-national
    boundaries, topologies, nomenclatures, including their brief
    history. &lt;this can be reused in shorter details in the package
    vignette, and both planned publications.&gt;

-   Finalize the Arabbarometer tutorial.

-   Create a fully harmonized European / African dataset on climate
    change.

## Eurobarometer metaadata vocabulary

-   Create a conversion table for Eurobarometer and regions/NUTS.
    Publish this data table as a separate data publication, as it will
    be large, and not core to the regions or the retroharmonize project,
    but relevant to both. Contact GESIS and Kantar with this document
    (which will be a description of our work, plus a table, for example,
    made available on Zenodo.)

## Journal of Open Research

We are aiming at a `software paper` in JORS. This is a short,
informative, peer-reviewed publication highlighting the re-use potential
of our work.

## Journal of Statistical Software

This is our final aim, to make our software a generally accepted tool,
hopefully even by Eurostat.
