staff.clean <- staff |>
  mutate(programs_clean = case_when(prg == "resol" ~ "resolve",
                                    prg == "brv" ~ "brave",
                                    prg == "stg" ~ "stages",
                                    TRUE ~ prg))

#create dataset of staff counts
staff2 <- staff.clean |>
  select(-c(staff,prg)) |>
  count(programs_clean) |>
  rename(num_staff = n)