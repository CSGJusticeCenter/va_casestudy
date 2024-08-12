#ANALYSIS TOGGLE
######################################
roster  <- if(valset==0) {roster} else {roster.update} #options: roster; roster.update
date1   <- if(valset==0) {date1}  else {date3}         #options: date1 (within roster); date3 (within roster.update)
date2   <- if(valset==0) {date2}  else {date4}         #options: date2 (within roster); date4 (within roster.update)
staff   <- if(valset==0) {staff}  else {staff.update}  #options: staff; staff.update
######################################