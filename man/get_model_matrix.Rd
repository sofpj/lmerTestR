% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/terms_utils.R
\name{get_model_matrix}
\alias{get_model_matrix}
\title{Extract or remake model matrix from model}
\usage{
get_model_matrix(model, type = c("extract", "remake"),
  contrasts = "restore")
}
\arguments{
\item{model}{an \code{lm} or \code{lmerMod} model object.}

\item{type}{extract or remake model matrix?}

\item{contrasts}{contrasts settings. These may be restored to those in the
model or they may be changed. If a length one character vector (e.g.
\code{"contr.SAS"}) this is applied to all factors in the model, but it can
also be a list naming factors for which the contrasts should be set as specified.}
}
\value{
the model (or 'design') matrix.
}
\description{
Extract or remake model matrix from model and potentially change the
contrast coding
}
\author{
Rune Haubo B Christensen
}
\keyword{internal}
