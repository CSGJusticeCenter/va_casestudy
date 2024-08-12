casestudydata <- function(csdata = "roster.csv", staffdata = "staff.csv", byyear = F) {
  if (csdata == "roster.csv" & staffdata == "staff.csv") {valset <<- 0} else if (csdata == "rosterupdate.csv" & staffdata == "staffupdate.csv") {valset <<- 1}
  ALL.BY    <<- byyear
  dataname1 <<- noquote(substr(csdata,1,nchar(csdata)-4))
  dataname2 <<- noquote(substr(staffdata,1,nchar(staffdata)-4))
}
