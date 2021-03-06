% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/permutation.R
\name{permute_df}
\alias{permute_df}
\title{Permute a data set}
\usage{
permute_df(.data)
}
\arguments{
\item{.data}{a \code{data.frame}}
}
\value{
a permuted \code{data.frame}
}
\description{
\code{permute_df()} permutes a data set: it randomizes the order within each
variable, which breaks any association between them. Permutation is useful
for testing against null statistics.
}
\examples{
permute_df(iris)
}
