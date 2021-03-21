# Custom R script operator

##### Description

The `custom_script_operator` allows one to run a custom script from the project files.

##### Usage

Input parameters|.
---|---
`file_name`        | File name (script must be uploaded to the project)

##### Details

By default, the custom_script_operator environment includes the R librairies `tercen`, `dplyr`, `reshape2` and `tidyr`, that are commonly used in Tercen operators. If other libraries are needed to run the custom script, one can add them to this operator, reinitialise renv and add a new tag. Tag name should be explicit and tag prefix should refer to its usage (for example, for an environment dedicated to flow cytometry, tags could look like this: `flowcyto-0.0.1`).
