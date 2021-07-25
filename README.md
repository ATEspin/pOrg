# pOrg
R package pOrg for project organization.

The pOrg is a very lightweight R package for data science project organization in the speficied directory. It is intended to use at the starting of a new project to quickly generate a prefered project structure.

The are two functions:

`pOrg()` builds the project folder structure with the working directory as the default root folder. The project folder organization can be controled through character variables specifying the first and second level structure.

`set_pOrg_txt()` allows for setting the text used as template for the following three files as well as returning to the default. By setting them, the user can specify preferences that will be stored for future use, allowing for customization of the templates.

* **README.txt**: a readme file placed at the top of the folder structure
* **functions.R**: an R file template containing the custom functions for the project. By default is placed in the */code* folder 
* **Rmd_template.Rmd**: Rmd template containing the YAML heading and other options for personal project.

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
