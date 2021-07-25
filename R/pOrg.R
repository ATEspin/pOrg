#'@title set project files template
#'@description This function sets the text that is used for creating the README.txt,
#'function.R and Rmd template files
#'
#'@param txt character with the text that will be used as a template for the specified file_template
#'@param file_template name of the file for which to set the template. The options are "README_txt", "
#'function.R_txt","Rmd_template_txt"
#'@param set_default whether to set the files to the original installed with the package.
#'If set to true, txt will be ignored
#'
#'@export
set_pOrg_txt <- function(txt, file_template, set_defualt=F){

  # file_template<-"function.R_txt"
  # file_template<-"README_txt"
  # file_template<-"Rmd_template_txt"

  file_template<-match.arg(file_template, c("README_txt", "function.R_txt","Rmd_template_txt"))
  path<-system.file("templates", package = "pOrg")

  if (set_defualt){
    txt <- suppressWarnings(read.table(paste0(path,"/",file_template,"_default.txt")))[1,1]
  }

  write(shQuote(txt), paste0(path,"/",file_template,".txt"))
}


#'@title Project organizer
#'@description This function creates the folder structure given the specified path.
#'
#'@param path character containing the path to use for the project folder structure.
#'By default uses the working directory returned by getwd().
#'@param folder_lv1 character vector with the names of the upper level folders
#'@param folder_lv2 character vector with the names of the lower level folders
#'@param include_readme boolean whether to include README file
#'@param include_function boolean whether to include the function.R file
#'@param include_rmd_template boolean whether to include the Rmd template file
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
                include_readme = T, include_function = T, include_rmd_template = T,
                folder_files = "code"){

  #Set working directory path
  setwd(path)

  #Create folders
  for (i in folder_lv1) if (dir.exists(i)==FALSE) dir.create(i)
  for (i in folder_lv2) if (dir.exists(i)==FALSE) dir.create(i)

  #path to templates
  path<-system.file("templates", package = "pOrg")

  ## Create README File
  if (include_readme & file.exists("README.txt")==FALSE){
    readme.txt = suppressWarnings(read.table(paste0(path,"/README_txt.txt")))[1,1]
    write(readme.txt, file = "README.txt")
  }

  ## Create functions.R File
  if (include_function & file.exists(paste0(folder_files,"/functions.R"))==FALSE){
    function.txt = suppressWarnings(read.table(paste0(path,"/function.R_txt.txt")))[1,1]
    write(function.txt, file = paste0(folder_files,"/functions.R"))
  }

  ## Create rmd_template.Rmd file
  if(include_rmd_template & file.exists(paste0(folder_files,"/rmd_template.Rmd"))==FALSE){
    rmd.template.txt = suppressWarnings(read.table(paste0(path,"/Rmd_template_txt.txt")))[1,1]
    write(rmd.template.txt, file =paste0(folder_files,"/rmd_template.Rmd"))
  }

  ## Done
  cat("pOrg created at", path,"\n")
}

