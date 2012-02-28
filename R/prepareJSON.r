#' Returns a JSON object from a data frame.
#'
#' @param df input dataframe
#' @param cols numeric vector of columns to use
#' @param cnames string vector of column names
#' @export
#' @examples
#' library(rjson)
#' three_cluster <- data.frame(fromJSON(file = system.file("data2", "three_cluster.json", package="filterviewR")))
#' prepareJSON(three_cluster)
prepareJSON <- function(df, cols, cnames){
  if(missing(cols)) cols <- 1:ncol(df)
  if(missing(cnames)) cnames <- names(df)
  df <- df[, cols, drop = FALSE]
  names(df) <- cnames
  toJSON(as.list(df))
}
