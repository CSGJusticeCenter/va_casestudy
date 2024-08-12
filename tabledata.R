tabout <- inner_join(roster2, staff2, by = ("programs_clean")) |>
  select(-c(clients_served_all, clients_served_year)) |>
  ungroup() |>
  #if any years are missing, fill in
  complete(year, nesting(programs_clean,num_staff),
           fill = list(recid_rate_all = NA, recid_rate_year = NA)
  ) |>
  #correct missing values for recid_rate_all since this is the overall recidivism rate across multiple years
  group_by(programs_clean) |>
  fill(recid_rate_all, .direction = "updown") |>
  ungroup() |>
  #create final program names for table
  mutate(program_official = case_when(programs_clean == "am"        ~ "Anger Management",
                                      programs_clean == "bcs"       ~ "Basic Cognitive Skills",
                                      programs_clean == "brave"     ~ "The Bureau Rehabilitation and Values Enhancement Program",
                                      programs_clean == "challenge" ~ "Challenge Program",
                                      programs_clean == "dbt"       ~ "Dialectical Behavior Therapy",
                                      programs_clean == "mhsd"      ~ "Mental Health Step Down Program",
                                      programs_clean == "rdap"      ~ "Residential Drug Abuse Program",
                                      programs_clean == "resolve"   ~ "The Resolve Program",
                                      programs_clean == "sotrt"     ~ "Sex Offender Treatment Program",
                                      programs_clean == "stages"    ~ "Steps Toward Awareness, Growth, and Emotional Strength Program",
                                      TRUE ~ programs_clean))

#for positioning in plotting
last <- tail(tabout$programs_clean,n=1)