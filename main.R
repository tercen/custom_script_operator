library(tercen)
library(dplyr)
library(reshape2)
library(tidyr)

ctx <- tercenCtx()

script_name <- ifelse(
  is.null(ctx$op.value("file_name")),
  "script.R",
  ctx$op.value("file_name")
)

file_list <- ctx$client$projectDocumentService$findFileByLastModifiedDate()
names_list <- unlist(lapply(file_list, function(x) x$name))
script_id <- which(names_list == script_name)
if(!length(script_id)) stop("Script not found, check file name.")

bytes <- ctx$client$fileService$download(file_list[[script_id[1]]]$id)
script <- rawToChar(bytes)
eval(parse(text = script))
