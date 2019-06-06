Background:
-----------

Included on the list of the Center for Disease Control’s (CDC) ‘Ten
Great Public Health Achievements - United States’ list, vaccines are a
singular force in public health in the 20th century. They are credited
with the elimination of measles in the United States in 2000, thanks to
the measles, mumps, and rubella (MMR) and measles, mumps, rubella, and
varicella (MMRV) vaccines. Prior to the introduction of MMR in 1963,
three to four million individuals contracted the disease annually,
resulting in an average of 48,000 hospitalizations and 400-500 deaths
per year.

This vaccine is 97% effective in preventing measles contraction in
children who received both doses prior to the age of six. In spite of
this, parents in the United States have recently begun to refuse to
vaccinations, including MMR/MMRV, for their children due to perceived
long-term health related fears. Forty-seven states now have nonmedical
exemptions (NMEs) from childhood vaccines for religious beliefs and 18
states have exemptions for personal, philosophical, or moral beliefs.

*Our project examines the following questions:*

1.  What are the geographic patterns to measles outbreaks in the United
    States?

2.  Is there a correlation between states with high rates of nonmedical
    vaccine exemptions and measles outbreaks?

3.  Finally, what are the temporal trends and demographic similarities
    between states with high NME rates and contemporary outbreaks?

To accomplish this we will utilize ggplot2, spatial data techniques, and
time series analysis.

Data Description:
-----------------

We have identified 4 datasets of interest and intend to incorporate more
as needed:

1.  CDC Incidences of measles from earliest available time period (See
    below)

2.  Non-Medical Vaccine Exemption claims at the county-level Aggregated
    by team of researchers and available for public use

3.  Google search data of measles symptoms by county from
    trends.google.com (Identify locations at risk for measles outbreaks)

4.  WHO Statistics on Measles
    (<https://www.who.int/immunization/monitoring_surveillance/burden/vpd/surveillance_type/active/measles/en/>)

The CDC measles incidence dataset records measles cases reported to the
CDC through the National Notifiable Diseases Surveillance System
(NNDSS).

General county and state-level data on population demographics available
from the US Census Bureau’s American Fact Finder
<https://factfinder.census.gov/faces/nav/jsf/pages/searchresults.xhtml>

State-level data on measles infection counts, by week, available from
the U.S. Department of Health and Human Services and Center for Disease
Control’s National Notifiable Diseases Surveillance System (NNDSS)
(Infrequently Reported Notifiable Diseases tables) and retrieved from
data.gov
<https://catalog.data.gov/dataset?q=NNDSS+-+Table+I.+infrequently+reported+notifiable+diseases+measles&sort=score+desc%2C+name+asc&as_sfid=AAAAAAUU_T1BCVapPIvlxJKREQinf-1RQSxCzThEAxQ3CrFwepXr1J8a5KQ2vc8KZD4xUkRp-hjVNh9tyEc9yjwUsV_kdWjiCo4a8n9pBA5OveRTO93wyAl1_5iqpLH0cAiofzk%3D&as_fid=1fb6a8f12265bca8021ece4fd01663a0983c7a71&ext_location>=&ext\_bbox=&ext\_prev\_extent=-142.03125%2C2.4601811810210052%2C-59.0625%2C58.63121664342478

Brainstorming:
--------------

1.  Incidences of measles at the county level
2.  Google measles symptoms search density
3.  NME rates

Preliminary Plot:

    library(choroplethr)
    county_choropleth(df, title = "NME rates at the county-level", num_colors =9, state_zoom = NULL, county_zoom = NULL, reference_map = FALSE)

![](Proposal_files/figure-markdown_strict/unnamed-chunk-2-1.png)

References:
-----------

1.  CDC (Centers for Disease Control and Prevention). 2011. “Ten Great
    Public Health Achievements.” Mobidity and Mortality Weekly Report,
    no 60 (19): 619 - 623.
    <https://www.cdc.gov/mmwr/preview/mmwrhtml/mm6019a5.htm>

2.  Devitt, Michael. “Study Finds Disturbing Trends in Vaccination
    Exemptions.” American Academy of Family Physicians, 20 June 2018,
    www.aafp.org/news/health-of-the-public/20180620vaccineexempts.html.

3.  U.S. Congress. House. Committee on Energy and Commerce. Confronting
    a Growing Public Health Threat: Measles Outbreaks in the U.S. 116th
    Cong., 1st sess., February 28, 2019 (statement of Anothy S, Fauci,
    Director, National Institute of Allergy and Infectious Diseases).
    <https://energycommerce.house.gov/sites/democrats.energycommerce.house.gov/files/documents/NIH%20Testimony_House%20EC_Measles_for%20022719_0.pdf>

4.  U.S. Congress. House. Committee on Energy and Commerce. Confronting
    a Growing Public Health Threat: Measles Outbreaks in the U.S. 116th
    Cong., 1st sess., February 28, 2019 (statement of Nancy Messionnier,
    Director, National Center for Immunization and Respiratory
    Diseases).
    <https://energycommerce.house.gov/sites/democrats.energycommerce.house.gov/files/documents/CDC%20Testimony%20%28Messonnier%29_House%20EC_Measles%20Final_0.pdf>
