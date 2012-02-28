\name{prepareJSON}
\alias{prepareJSON}
\title{Returns a JSON object from a data frame.}
\usage{
  prepareJSON(df, cols, cnames)
}
\arguments{
  \item{df}{input dataframe}

  \item{cols}{numeric vector of columns to use}

  \item{cnames}{string vector of column names}
}
\description{
  Returns a JSON object from a data frame.
}
\examples{
library(rjson)
three_cluster <- data.frame(fromJSON(file = system.file("data2", "three_cluster.json", package="filterviewR")))
prepareJSON(three_cluster)
}

