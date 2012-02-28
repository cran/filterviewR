\name{fvplot}
\alias{fvplot}
\title{Writes JSON to file and opens web browser, rendering with FilterView.}
\usage{
  fvplot(plotcmd, JSON, ...)
}
\arguments{
  \item{plotcmd}{string of FilterView plot command}

  \item{JSON}{JSON object containing the data}

  \item{...}{extra parameters to pass to browseURL(), e.g.,
  "browser=chromium"}
}
\description{
  Writes JSON to file and opens web browser, rendering with
  FilterView.
}
\examples{
library(rjson)
three_cluster <- data.frame(fromJSON(file = system.file("data2", "three_cluster.json", package="filterviewR")))
fvplot(c("plot(foo.xx)","plot(foo.xx, foo.yy)", "plot(foo.xx, foo.yy, {col:foo.col})", "plot(foo.xx, foo.yy, {col:foo.col, bar:foo.tt, ui:{slider:'bar'}})", "plot(foo.xx, foo.yy, {col:foo.col, tt:foo.tt, ui:{checkbox:'tt', autocomplete:'col'}})", "plot(foo.xx, foo.yy, {col:foo.col, tt:foo.tt, ui:{slider:['xx', 'yy']}})", "plot(foo.xx, foo.yy, {col:foo.col, rescale:true, ui:{regexp:'col'}})", "plot(foo.xx, foo.yy, {col:foo.col, ui:{slider:'xx'}, cui:{checkbox:'col'}})", "hist(foo.xx, {tt:foo.tt, yy:foo.yy, rescale:true, ui:{checkbox:'tt', slider:'yy'}})"), prepareJSON(three_cluster))
}

