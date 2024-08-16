total.a <- sum(tabout2[which(tabout2$year==date1),]$clients_served_all, na.rm=TRUE)
tabout2.wgt <- tabout2 |>
  filter(year==date1) |>
  mutate(recid_rate_all_w = clients_served_all*recid_rate_all)
w.a <- round(sum(tabout2.wgt$recid_rate_all_w)/total.a,2)

#total clients served (year 1)
total.d1 <- sum(tabout2[which(tabout2$year==date1),]$clients_served_year,na.rm=TRUE)
tabout2.wgt <- tabout2 |>
  filter(year==date1) |>
  mutate(recid_rate_year_w = clients_served_year*recid_rate_year)
w.d1 <- round(sum(tabout2.wgt$recid_rate_year_w,na.rm=TRUE)/total.d1,2)

#total clients served (year2)
total.d2 <- sum(tabout2[which(tabout2$year==date2),]$clients_served_year,na.rm=TRUE)
tabout2.wgt <- tabout2 |>
  filter(year==date2) |>
  mutate(recid_rate_year_w = clients_served_year*recid_rate_year)
w.d2 <- round(sum(tabout2.wgt$recid_rate_year_w,na.rm=TRUE)/total.d2,2)

#JUST 5 PROGRAMS!!!
#total clients served (all years)
total.a5 <- sum(tabout2[which(tabout2$year==date1 & !tabout2$programs_clean %in% rm.pgms),]$clients_served_all, na.rm=TRUE)
tabout2.wgt5 <- tabout2 |>
  filter(!(programs_clean %in% rm.pgms) & year==date1) |>
  mutate(recid_rate_all_w = clients_served_all*recid_rate_all)
w.a5 <- round(sum(tabout2.wgt5$recid_rate_all_w)/total.a5,2)

#total clients served (year 1)
total.d15 <- sum(tabout2[which(tabout2$year==date1 & !tabout2$programs_clean %in% rm.pgms),]$clients_served_year,na.rm=TRUE)
tabout2.wgt5 <- tabout2 |>
  filter(!(programs_clean %in% rm.pgms) & year==date1) |>
  mutate(recid_rate_year_w = clients_served_year*recid_rate_year)
w.d15 <- round(sum(tabout2.wgt5$recid_rate_year_w,na.rm=TRUE)/total.d15,2)

#total clients served (year2)
total.d25 <- sum(tabout2[which(tabout2$year==date2 & !tabout2$programs_clean %in% rm.pgms),]$clients_served_year,na.rm=TRUE)
tabout2.wgt5 <- tabout2 |>
  filter(!(programs_clean %in% rm.pgms) & year==date2) |>
  mutate(recid_rate_year_w = clients_served_year*recid_rate_year)
w.d25 <- round(sum(tabout2.wgt5$recid_rate_year_w,na.rm=TRUE)/total.d25,2)