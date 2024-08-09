roster2.1 <- roster.clean |>
  mutate(year = factor(year(dt))) |>
  select(-c(client_names,age,programs)) |>
  group_by(programs_clean) |>
  count(ret) |>
  mutate(clients_served = sum(n),
         recid_rate_all = case_when(ret == 1 ~ round(n/clients_served,2),
                                    ret == 0 ~ 0)
  ) |>
  group_by(programs_clean) |>
  slice(n()) |>
  select(-c(ret, n)) |>
  rename(clients_served_all = clients_served)

#recidivism rates by year
roster2.2 <- roster.clean |>
  mutate(year = factor(year(dt))) |>
  select(-c(client_names,age,programs)) |>
  group_by(programs_clean,year) |>
  count(ret,year) |>
  mutate(clients_served = sum(n),
         recid_rate_year= case_when(ret == 1 ~ round(n/clients_served,2),
                                    ret == 0 ~ 0)
  ) |>
  group_by(programs_clean,year) |>
  slice(n()) |>
  select(-c(ret, n)) |>
  rename(clients_served_year = clients_served)

#combine data by programs to capture recidivism rates overall and by year
roster2 <- inner_join(roster2.1, roster2.2, by = "programs_clean")