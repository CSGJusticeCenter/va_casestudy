roster.clean <- roster.nodup |>
  #fix programs, dates, and returns
  mutate(programs_clean = case_when(programs == "bgs" ~ "bcs",
                                    programs == "fbt" ~ "dbt",
                                    programs == "brv" ~ "brave",
                                    programs == "rdp" ~ "rdap",
                                    TRUE ~ programs),
         
         #dates - assume that wrong dates occurred in 2017
         dt      = case_when(year(dt) < 2017 ~ `year<-`(dt, 2017),
                             TRUE ~ dt),
         
         #returns - assume that wrong returns should all be =1
         ret            = case_when(ret == -1 ~ 1,
                                    ret == 2  ~ 1,
                                    ret == 11 ~ 1,
                                    TRUE ~ ret)
  )