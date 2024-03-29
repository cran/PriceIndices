% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/f_data_processing.R
\name{products_fig}
\alias{products_fig}
\title{Function for graphical comparison of available, matched, new as well as disappearing products.}
\usage{
products_fig(
  data,
  start,
  end,
  show = c("available", "matched", "new", "disappearing"),
  fixed_base = TRUE,
  contributions = TRUE,
  date_breaks = "1 month"
)
}
\arguments{
\item{data}{The user's data frame with information about sold products. It must contain columns: \code{time} (as Date in format: year-month-day,e.g. '2020-12-01') and \code{prodID} (as numeric, factor or character).}

\item{start}{The base period (as character) limited to the year and month, e.g. "2020-03".}

\item{end}{The research period (as character) limited to the year and month, e.g. "2020-04".}

\item{show}{A character vector indicating which groups of products are to be taken into consideration. Available options are \code{available}, \code{matched}, \code{new} and \code{disappearing}.}

\item{fixed_base}{A logical parameter indicating whether each month is to be compared to the base period (TRUE) or to the previous month (then it is set to FALSE).}

\item{contributions}{A logical parameter indicating whether contributions or volumes counted for available, matched, new and disappearing products are to be displayed.}

\item{date_breaks}{A string giving the distance between breaks on the X axis like "1 month" (default value) or "4 months".}
}
\value{
This function returns a figure with plots of volume (or contributions) of available, matched, new as well as disappearing products. The User may control which groups of products are to be taken into consideration (see the \code{show} parameter). Available options are \code{available}, \code{matched}, \code{new} and \code{disappearing}.
}
\description{
This function returns a figure with plots of volume (or contributions) of available, matched, new as well as disappearing products.
}
\examples{
\donttest{products_fig(milk, "2018-12","2019-04", 
fixed_base=TRUE, contributions=FALSE,
show=c("new","disappearing","matched","available"))}
}
