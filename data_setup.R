#programs
#https://www.bop.gov/inmates/fsa/docs/fsa_program_guide_2107.pdf
#https://www.bop.gov/inmates/fsa/docs/evidence_based_recidivism_reduction_programs.pdf

#for participants
prgnm = c("am,0",        "am,0",        "am,0",        "am,0",        "am,0",                      "am,1",        "am,1",        "am,1",        #CWC
          
          "brave,0",     "brave,0",     "brave,0",     "brave,0",     "brave,0",                   "brave,1",                                        #spelling error below
          
          "bcs,0",       "bcs,0",                                                                  "bcs,1",       "bcs,1",                           #spelling error below
          
          "resolve,0",   "resolve,0",                                                              "resolve,1",   "resolve,1",
          
          "rdap,1",      "rdap,1",      "rdap,1",      #CWC #spelling error below 
          
          "dbt,1",       "dbt,1",                      #CWC #spelling error below
          
          "sotrt,0",                                                                               "sotrt,1",     "sotrt,1",
          
          "challenge,0", "challenge,0", "challenge,0", "challenge,0", "challenge,0", "challenge,0","challenge,1", "challenge,1",                #CWC
          
          "mhsd,0",      "mhsd,0",                                                                 "mhsd,1",
          
          "stages,0",    "stages,0",    "stages,0",    "stages,0",    "stages,0",    "stages,0",   "stages,1",    "stages,1",    "stages,1",    #CWC
          
          #spelling errors
          "bgs,0", "bgs,0",
          "fbt,0", "fbt,0",
          "brv,0", "brv,0",
          "rdp,0", "rdp,0")

#for staff
prgnm2 = c("am",
           "brave",
           "bcs",
           "resolve",
           "rdap",
           "dbt",
           "sotrt",
           "challenge",
           "mhsd",
           "stages",
           #spelling errors
           "brv",
           "stg",
           "resol")

#dataframe sizes: sizen - roster, sizen2 - program staff, sizen3 - 2nd roster
sizen  = 50 #DO NOT CHANGE - THIS IS SIZE OF DATA BEING SAMPLED ABOVE
date1  = 2017
date2  = 2018

##staff
sizen2 = 80 #2017-2018 staff
sizen4 = 84 #2021-2022 staff

############################################
#####set up roster/recidivism dataframe#####
############################################
#create person-level dataframe
set.seed(80)
roster.prep <- data.frame(
  #create names
  client_names  = ch_name(sizen),
  #create age
  age           = round(rnorm(sizen,29,5)),
  #create programs/returns to prison
  #data being sampled is exactly 50
  programs.temp = sample(prgnm, size=50, replace = FALSE),
  #create dates in programs
  dt            = as.Date("2018-01-01") + round(rnorm(sizen, mean = 0, sd = 120))
) |>
  #split programs/returns
  mutate(programs  = substr(programs.temp,1,nchar(programs.temp)-2),
         ret       = as.numeric(substr(programs.temp,nchar(programs.temp),nchar(programs.temp))),
         #put in a random date to throw things off
         dt        = case_when(row_number() == sizen-3  ~ as.Date(paste0('2007/06/05')), 
                               row_number() == sizen-20 ~ as.Date(paste0('1997/08/22')),
                               TRUE ~ dt),
         #put in a random return values
         ret       = case_when(row_number() == sizen-10  ~ -1, 
                               row_number() == sizen-30  ~ 11,
                               row_number() == sizen-17  ~ 2,
                               TRUE ~ ret)
  ) |>
  select(-c(programs.temp)) 

#create duplicates
roster <- roster.prep |> 
  filter(row_number() %in% c(1:5)) |> 
  bind_rows(roster.prep)

###############################################################
#####set up roster/recidivism dataframe for updated roster#####
###############################################################
#create 1000 person dataframe
sizen3 = 1000
date3  = 2021
date4  = 2022

set.seed(20012)
roster.update <- data.frame(
  client_names    = ch_name(sizen3),
  age             = round(rnorm(sizen3,29,5)),
  programs.temp   = sample(prgnm, size=sizen3, replace = TRUE),
  dt       = as.Date("2022-01-01") + round(rnorm(sizen, mean = 0, sd = 120))
) |>
  mutate(programs = substr(programs.temp,1,nchar(programs.temp)-2),
         ret  = as.numeric(substr(programs.temp,nchar(programs.temp),nchar(programs.temp)))
  ) |>
  select(-c(programs.temp))

########################################
#####set up program staff dataframe#####
########################################
#create 80 person dataframe
set.seed(160)
staff <- data.frame(
  staff = ch_name(sizen2,messy=TRUE),
  prg   = sample(prgnm2, size=sizen2, replace = TRUE)
)
set.seed(160)
staff.update <- data.frame(
  staff = ch_name(sizen4,messy=TRUE),
  prg   = sample(prgnm2, size=sizen4, replace = TRUE)
)