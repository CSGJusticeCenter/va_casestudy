# Virtual Academy Case Study
This GitHub repository contains materials for the Advancing Data in Corrections (ADC) Virtual Academy conference (08/16/2024 - 08/17/2024). Specifically, code and guidance for the Case Study.

## Project overview  
The Virtual Academy for Corrections Analysts program, or VA, will set standards for and improve corrections departments’ analytical capacity in order to enable more informed planning and decision-making at the agency and state levels.

OBJECTIVES:
  - Establish standards for DOC data analyst positions (Identify the core competencies for corrections data analysis and how to use the analysis results.)
  - Train agency analysts and their leadership to meet core competencies.
  - Develop trainings, resources, and communities of practice (CoPs) to implement standards.

## Staff
Joshua Mallett - Deputy Division Director, Research  
Ruth Coffman - Deputy Program Director, State 

### Branches  
- __main__: for deploying to Netlify
- __develop__: for making changes

### Folder structure  
\<Information about folders and files in repo\>   

```
|-- va_casestudy 
  |-- _book                    # rendered html
  |-- img                      # img files for web
  |-- _extensions              # contains webr extension for quarto
  |-- va_cs_webr_files         # files created from va_cs_webr.qmd
  |-- _quarto.yml
  |-- index.qmd                # welcome page
  |-- oldreport.qmd            # case study old fake GDOC report
  |-- va_cs.qmd                # case study analysis to be rendered creating final HTML
  |-- cwc_report.qmd           # case study fake report
  |-- libraries.R              # libraries for running va_cs.qmd
  |-- data_setup.R             # create simulated data
  |-- re_report.R              # function for toggling report output with different data and formatting
  |-- execute.R                # function from re_report.R to toggle final HTML with parameters
  |-- toggle.R                 # toggle logic
  |-- rm_pgms.R                # list of programs removed by CWC in case study
  |-- dedup.R                  # deduplication logic for roster data
  |-- roster_clean.R           # cleaning the roster data
  |-- rates.R                  # calculating recidivism rates
  |-- staff_clean.R            # cleaning staff data
  |-- tabledata.R              # create data for results
  |-- finaltable_report.R      # create data for outputting table (overall) and for PDF
  |-- cwc_unw.R                # calculate unweighted rates
  |-- cwc_w.R                  # calculate weighted rates
  |-- va_cs_webr.qmd           # interactive coding
  |-- finaltable.Rmd           # output for rendering report in PDF/DOCX format
  |-- styles.css               # css for buttons and code font
  |-- README.md
  |-- va_casestudy.Rproj
  |-- roster_summer_final.xlsx # excel format case study solutions
  
```  

## Data  
All data are simulated and created using various statistical sampling packages in R. 

## QMD rendering Guidance

A final Quarto HTML can be rendered (or output) by running the `va_cs.qmd` program in your R statistical software. This may be successfully done by either running `quarto_render("va_cs.qmd")` in your console with the `quarto` library actively loaded in R, or by simply using the `Render` button in R Studio.  

In order to utilize this report with new data in the same format, open the `execute.R` program and follow the parameter guidance. Once changed and saved, `va_cs.qmd` can be rendered again with new output.  
  
The following are important to note:  

1. The datasets required for this case study, `roster.csv`, `rosterupdate.csv`, `staff.csv`, and `staffupdate.csv` are available in this repo. However, they are not necessary to render the final output here as `va_cs.qmd` creates these simulated data.
2. All included .R, .Rmd, and .qmd scripts in this top-level repo are necessary to successfully render output. This is due to various .R programs that are included across .qmd and .Rmd programs developed for quality assurance and efficiency purposes.
3. Rendering `va_cs.qmd` will also create a PDF and DOCX documents called `finaltable.pdf` and `finaltable.docx` respectively containing output for the case study.

## Netlify site
Visit the [Virtual Academy - Case Study Netlify Site](https://csg-va-casestudy.netlify.app/) to follow along with the case study, engage with the results, and utilize code for your own future analyses.

