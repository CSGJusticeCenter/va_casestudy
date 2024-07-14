<!--- It is mandatory to fill complete the Quality Assurance Checklist (QAC) for all GitHub projects -->

## Quality Assurance Checklist (QAC):

<!--- Put an `x` in the box when a task has been completed or reviewed with the project research staff. -->
<!--- For any questions or concerns about the QAC, contact Research Deputy Directors Joshua Mallett or Sofia Nystrom -->

### Key for Comments
:hammer: fix/edits\
:toolbox: constructive criticism/suggestions for future code\
:star: highlights or things I (reviewer) learned

### Project Organization
- [ ] Project has a GitHub repository
- [ ] Project folder named according to QA Policy
- [ ] Project folder structured according to QA Policy
- [ ] All data stored in Research Division SharePoint
- [ ] raw, analysis, deliverable folders within project folder structure
- [ ] All programming code stored in a separate folder within project folder structure
- [ ] All programming code stored on local machine and GitHub only
- [ ] Data-related project materials stored in Research Division SharePoint folders

### Data security
- [ ] Raw data received from project partners stored as received, unchanged, in raw folder
- [ ] Raw data received from project partners logged in Research Division data inventory
- [ ] If raw data contains PII, an interim data file has been created with PII removed and a key file with random identifiers created for linking to the interim data file has been created

### Data documentation
- [ ] README
    - [ ] Includes description of project
    - [ ] Includes links to relevant SharePoint folders
    - [ ] Describes programming code structure with brief description of each file’s purpose
    - [ ] Version control described as applicable
- [ ] Codebooks/Data dictionaries from project partners stored in Research Division SharePoint folders, or codebook created internally of raw data received from project partners

### Version control
- [ ] GitHub processes are being followed according to QA Policy
- [ ] Datasets are version-controlled clearly
- [ ] Programs and code are version-controlled clearly

### Model code
- [ ] File header/metadata included
- [ ] Code is well-commented
- [ ] Code is formatted consistently
- [ ] Programming processes are divided into parts by purpose
- [ ] Logs, R Markdown, or Quarto are used across all programs
- [ ] All programs can be run successfully on an independent machine
    - [ ] Package dependencies recorded (e.g., using .Renv)
    - [ ] Paths to SharePoint are used for accessing all data
    - [ ] Internal GitHub repository paths are created relative to the root directory
    - [ ] .Rproj exists in root directory of code folder
    - [ ] No errors or warnings exist
        - [ ] If warnings do exist, code comments should indicated reason
- [ ] No extraneous code included
- [ ] Data is not hard-coded into programs
- [ ] Package dependencies loaded at the beginning of the program code
- [ ] Functions, loops, or macros are used in place of repeated operations
- [ ] Output is never created manually

### Data duplicates
- [ ] Code checks for duplicates in all data received
- [ ] Code checks for duplicates after data merges or reshaping

### Data match rates
- [ ] After all data merges, code checks for match rates

### Overall code review
- [ ] All code has been reviewed and appears free of error
- [ ] All associated output has been reviewed and appears free of error

### Statistical methodology review (as applicable)
- [ ] All analyses have been reviewed per, at a minimum, the Research Division 2021 Strategic Plan – Appendix D: Methods and Statistics Cheat Sheets

### Data destruction (as applicable)
- [ ] Data has been destroyed according to the instructions provided by the DUA
- [ ] Proof of destruction submitted to the Human Protections Administrator (HPA)

### Parallel Coding (Parallel coding review ONLY)
- [ ] Create frequency/summary table output of all interim/analysis datasets and variable contents
- [ ] Produce identical analysis results per project research plan
