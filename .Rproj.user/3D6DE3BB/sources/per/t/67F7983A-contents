#'@title README file text
#'@description This function contains the text that is used for creating the README.txt file
#'
#'@returns Text that will be used to for the template
#'@export
readme_txt <- function(){
"The project organization in this folder has been created automatically using the
pOrg R package. Check the package at github URL

[Project folder organization]

Initial organization of the project folder as created by pOrg. As the project
evolve, more folders and files are likely to be added.
  ..
  |_README.txt: this file
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
  |_/report"
}

#'@title function.R
#'@description This function contains the text that is used for the R file function.R.
#' This file is used to hold custom functions used in the project.
#'
#'@returns Text that will be used to for the template
#'@export
function.R_txt<-function(){
"#' Script containing the custom functions used in the project. These functions
#' can be loaded into any script using the source() function.
#'
#' Documentation structure based of regOx2
#'
#' === Function name =======================================================
#'
#' Function description:
#'
#' Arguments:
#' @param
#'
#' Values
#' @returns "
}

#'@title RMarkdown template text
#'@description This function contains the text that is used as a template for the Rmd files.
#'
#'@returns Text that will be used to for the template
#'@export
Rmd_template <- function(){
'---
title: "Title"
author: "Author"
date: "`r Sys.Date()`"
output:
  html_document:
    toc: yes
    toc_float: yes
    toc_depth: 5
    # code_folding: hide
  word_document:
    toc: yes
    toc_depth: "5"
editor_options:
  chunk_output_type: console
---

<!-- Some CSS style -->
<style type="text/css">
  body, td {
    font-size: 14px;
  }
  code.r{
    font-size: 12px;
  }
  pre {
    font-size: 12px
  }
</style>

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE, warning = F, error=T, message = F, cache = FALSE)
```
***
***

#Project summary

#Setup

## Libraries

```{r}

```

## Global settings


**Relative path variabels**
```{r}
#Relative paths when knitting============================================================================
    #When knitting the relative path change as the working directory of the knitting enviorment changes to the
    #working directory of the file instead of the project.

    # DATA
    data_derived_path <- "../../data/derived/"
    data_original_path <- "../../data/original/"

    #CODE
    code_exp_path <- "../exploratory/"
    code_working_path <- getwd() #Woeking code is the current path
    code_final_path <- "../final_code/"

    #OUTPUT
    output_figures_path <- "../../output/figures/"
    output_plots_path <- "../../output/plots/"
    output_figures_path <- "../../output/tables/"

    #REPORT
    report_path <- "../../report/"

    #PROJECT DOCUMENTS PATH
    project_documents_path <- "../../project_documents/"

    ```

    ```{r include=FALSE, echo=FALSE}
    #Relative paths when console output
    #(This is not included in the knitted document)

    # DATA
    data_derived_path <- "data/derived/"
    data_original_path <- "data/original/"

    #CODE
    code_exp_path <- "code/exploratory/"
    code_working_path <- "code/working_code/"
    code_final_path <- "code/final_code/"

    #OUTPUT
    output_figures_path <- "output/figures/"
    output_plots_path <- "output/plots/"
    output_figures_path <- "output/tables/"

    #REPORT
    report_path <- "report/"

    #PROJECT DOCUMENTS PATH
    project_documents_path <- "project_documents/"
    ```

    ## Read data

    ```{r}

    ```
    '
}

#'@title Project organizer
#'@description This function creates the folder structure given the specified path.
#'
#'@param path character containing the path to use for the project folder structure.
#'By default uses the working directory returned by getwd().
#'@param folder_lv1 character vector with the names of the upper level folders
#'@param folder_lv2 character vector with the names of the lower level folders
#'@param include_readme boolean whether to include README file
#'@param readme_txt character containing the text for the README file
#'@param include_function boolean whether to include the function.R file
#'@param function_txt character containing the text for building the function.R file
#'@param include_rmd_template boolean whether to include the Rmd template file
#'@param rmd_template_txt character containing the text for building the rmd template file
#'@param folder_files character with the name of the folder from folder_lv1 or folder_lv2
#'for placing the function.R and Rmd template files.
#'
#'@details The project structure by default is as follow:
#'
#'\enumerate{
#'   \item{\strong{README.txt}}
#'   \item{\strong{code}}
#'   \enumerate{
#'    \item{\strong{exploratory: }}{code that is exploratory in nature}
#'    \item{\strong{final_code: }}{final code that reproduced the final analysis}
#'    \item{\strong{working_code: }}{temporary code during work in progress}
#'    \item{\strong{functions.R: }}{the custom functions used in the project}
#'    }
#'   \item{\strong{data}}
#'   \enumerate{
#'    \item{\strong{derived: }}{data generated as a product of the analysis}
#'    \item{\strong{original: }}{original data}
#'    }
#'   \item{\strong{output}}
#'   \enumerate{
#'    \item{\strong{figures: }}{composited figures}
#'    \item{\strong{plots: }}{individual plots}
#'    \item{\strong{tabels: }}{individual tabels}
#'    }
#'   \item{\strong{project_documents}}
#'   \item{\strong{report}}
#'}
#'@export
pOrg <-function(path=getwd(),
                folder_lv1 = c("project_documents","data", "code", "output", "report"),
                folder_lv2 = c("data/original", "data/derived", "output/plots", "output/figures",
                               "output/tables", "code/exploratory", "code/final_code", "code/working_code"),
                include_readme = T, readme.txt = "default",
                include_function = T, function.txt = "default",
                include_rmd_template = T, rmd.template.txt = "default",
                folder_files = "code"){

  #Set working directory path
  setwd(path)

  #Create folders
  for (i in folder_lv1) if (dir.exists(i)==FALSE) dir.create(i)
  for (i in folder_lv2) if (dir.exists(i)==FALSE) dir.create(i)

  ## Create README File
  if (include_readme & file.exists("README.txt")==FALSE){
    if (readme.txt=="default"){
      readme.txt = readme_txt()
    }
    write(readme.txt, file = "README.txt")
  }

  ## Create functions.R File
  if (include_function & file.exists(paste0(folder_files,"/functions.R"))==FALSE){
    if (function.txt=="default"){
      function.txt = function.R_txt()
    }
    write(function.txt, file = paste0(folder_files,"/functions.R"))
  }

  ## Create rmd_template.Rmd file
  if(include_rmd_template & file.exists(paste0(folder_files,"/rmd_template.Rmd"))==FALSE){
    if (rmd.template.txt=="default"){
      rmd.template.txt = Rmd_template()
    }
    write(rmd.template.txt, file =paste0(folder_files,"/rmd_template.Rmd"))
  }

  ## Done
  cat("pOrg created at", path,"\n")
}

