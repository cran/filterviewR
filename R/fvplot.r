#' Writes JSON to file and opens web browser, rendering with FilterView.
#'
#' @param plotcmd string of FilterView plot command
#' @param JSON JSON object containing the data
#' @param ... extra parameters to pass to browseURL(), e.g., "browser=chromium"
#' @export
#' @examples
#' library(rjson)
#' three_cluster <- data.frame(fromJSON(file = system.file("data2", "three_cluster.json", package="filterviewR")))
#' fvplot(c("plot(foo.xx)","plot(foo.xx, foo.yy)", "plot(foo.xx, foo.yy, {col:foo.col})", "plot(foo.xx, foo.yy, {col:foo.col, bar:foo.tt, ui:{slider:'bar'}})", "plot(foo.xx, foo.yy, {col:foo.col, tt:foo.tt, ui:{checkbox:'tt', autocomplete:'col'}})", "plot(foo.xx, foo.yy, {col:foo.col, tt:foo.tt, ui:{slider:['xx', 'yy']}})", "plot(foo.xx, foo.yy, {col:foo.col, rescale:true, ui:{regexp:'col'}})", "plot(foo.xx, foo.yy, {col:foo.col, ui:{slider:'xx'}, cui:{checkbox:'col'}})", "hist(foo.xx, {tt:foo.tt, yy:foo.yy, rescale:true, ui:{checkbox:'tt', slider:'yy'}})"), prepareJSON(three_cluster))

fvplot <- function(plotcmd, JSON, ...){
  plotvalue <- gsub(".*\\(", "[", plotcmd)
  plotvalue <- gsub(")\\s*$", "]", plotvalue)
  plotcmd <- paste("\"", plotcmd, "\"", sep = "")
  lines <- readLines(system.file("js", "skeleton.js", package="filterviewR"))
  lines[4] <- JSON
  lines[7] <- paste(paste(plotcmd, plotvalue, sep = ": "), collapse=", \n")
  writeLines(lines, system.file("js", "filterviewR.js", package="filterviewR"))
  browseURL(url=system.file("filterviewR.html", package="filterviewR"), ...)
}
