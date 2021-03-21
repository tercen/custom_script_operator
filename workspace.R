library(tercen)
library(dplyr)

options("tercen.workflowId" = "686a2e2bba117e0c118bcb715300b5d3")
options("tercen.stepId"     = "52110340-a9c9-49fd-ba1e-a9b0cc4639b4")

getOption("tercen.workflowId")
getOption("tercen.stepId")

ctx <- tercenCtx()

script_name <- ifelse(
  is.null(ctx$op.value("file_name")),
  "script.R",
  ctx$op.value("file_name")
)

file_list <- ctx$client$projectDocumentService$findFileByLastModifiedDate()
script_id <- which(unlist(lapply(file_list, function(x) x$name)) == script_name)[[1]]
if(!length(script_id)) stop("Script not found, check file name.")

bytes <- ctx$client$fileService$download(file_list[[script_id[1]]]$id)
script <- rawToChar(bytes)
eval(parse(text = script))
