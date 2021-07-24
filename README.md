# pOrg
R package pOrg for project organization.

The pOrg is a very little weight R package for data science project organization in the speficied directory. It is intended to use at the starting of a new project to quickly generate a prefered project structure. 

The main function is `pOrg()` with the working directory as the default root folder.

Project organization can be controled through character variables specifying the first and second level structure, as well as text template for three files: README.txt, functions.R and Rmd_template.Rmd.

The default project organization is the one I use:
```
..
  |_README.txt: a README file with this information
  |_/code
    |_/exploratory: code that is exploratory in nature
    |_/final_code: final code that reproduced the final analysis
    |_/working_code: temporary code during work in progress
    |_functions.R: the custom functions used in the project
  |_/data
    |_/derived: data generated as a product of the analysis
    |_/original: original data
  |_/output
    |_/figures: composited figures
    |_/plots: individual plots
    |_/tabels: tables
  |_/project_documents
  |_/report
```

# Install

```r
remotes::install_github("ATEspin/pOrg")
```
