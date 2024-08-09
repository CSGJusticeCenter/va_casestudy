reportit <- tabout |> 
  filter(year==date1) |>
  select(c(program_official, recid_rate_all, num_staff))