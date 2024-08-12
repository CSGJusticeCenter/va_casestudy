tabout2 <- inner_join(roster2, staff2, by = ("programs_clean")) |>
  ungroup() |>
  #if any years are missing, fill in
  complete(year, nesting(programs_clean,num_staff),
           fill = list(recid_rate_all = NA, recid_rate_year = NA)
  ) |>
  #correct missing values for recid_rate_all since this is the overall recidivism rate across multiple years
  group_by(programs_clean) |>
  fill(c(recid_rate_all,clients_served_all), .direction = "updown")

#calculate average recidivism rate across programs from all years
unw.a <- round(mean(tabout2$recid_rate_all,na.rm=TRUE),2)

#calculate average recidivism rate across programs from year 1
unw.d1 <- round(mean(tabout2[which(tabout2$year==date1),]$recid_rate_year,na.rm=TRUE),2)

#calculate average recidivism rate across programs from year 2
unw.d2 <- round(mean(tabout2[which(tabout2$year==date2),]$recid_rate_year,na.rm=TRUE),2)