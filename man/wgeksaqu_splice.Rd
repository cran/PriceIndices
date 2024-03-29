% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/f_extensions_multilateral_indices.R
\name{wgeksaqu_splice}
\alias{wgeksaqu_splice}
\title{Extending the multilateral weighted GEKS-AQU price index by using window splicing methods.}
\usage{
wgeksaqu_splice(
  data,
  start,
  end,
  window = 13,
  splice = "movement",
  interval = FALSE
)
}
\arguments{
\item{data}{The user's data frame with information about sold products. It must contain columns: \code{time} (as Date in format: year-month-day,e.g. '2020-12-01'), \code{prices} (as positive numeric), \code{quantities}  (as positive numeric) and \code{prodID} (as numeric, factor or character).}

\item{start}{The base period (as character) limited to the year and month, e.g. "2019-12".}

\item{end}{The research period (as character) limited to the year and month, e.g. "2020-04".}

\item{window}{The length of the time window (as positive integer: typically multilateral methods are based on the 13-month time window).}

\item{splice}{A character string indicating the splicing method. Available options are: "movement", "window","half","mean", "window_published","half_published","mean_published".}

\item{interval}{A logical value indicating whether the function is to provide the price index comparing the research period defined by \code{end} to the base period defined by \code{start} (then \code{interval} is set to FALSE) or all fixed base multilateral indices are to be presented (the fixed base month is defined by \code{start}).}
}
\value{
This function returns a value or values (depending on \code{interval} parameter) of the multilateral weighted GEKS-AQU price index (the weighted GEKS index based on the asynchronous quality adjusted unit value formula) extended by using window splicing methods. Available splicing methods are: movement splice, window splice, half splice, mean splice and their additional variants: window splice on published indices (WISP), half splice on published indices (HASP) and mean splice on published indices (see \code{References}). The time window starts in \code{start} and should consist of at least two months. To get information about both price index values and corresponding dates, please see functions: \code{\link{price_indices}} or \code{\link{final_index}}. The function does not take into account aggregating over outlets or product subgroups (to consider these types of aggregating, please use the \code{\link{final_index}} function).
}
\description{
This function returns a value (or values) of the multilateral weighted GEKS-AQU price index extended by using window splicing methods. Available splicing methods are: movement splice, window splice, half splice, mean splice and their additional variants: window splice on published indices (WISP), half splice on published indices (HASP) and mean splice on published indices (see \code{References}).
}
\examples{
\donttest{wgeksaqu_splice(milk, start="2018-12", end="2020-02",splice="half")}
}
\references{
{Chessa, A. G. (2019). \emph{A Comparison of Index Extension Methods for Multilateral Methods.} Paper presented at the 16th Meeting of the Ottawa Group on Price Indices, 8-10 May 2019, Rio de Janeiro, Brazil.}

{de Haan, J., van der Grient, H.A. (2011). \emph{Eliminating chain drift in price indexes based on scanner data.} Journal of Econometrics, 161, 36-46.}

{Krsinich, F. (2014). \emph{The FEWS Index: Fixed Effects with a Window Splice? Non-Revisable Quality-Adjusted Price Indices with No Characteristic Information.} Paper presented at the UNECE-ILO Meeting of the Group of Experts on Consumer Price Indices, 2-4 May 2016, Geneva, Switzerland.}

{de Haan, J.(2015). \emph{A Framework for Large Scale Use of Scanner Data in the Dutch CPI.} Paper presented at the 14th Ottawa Group meeting, Tokyo, Japan.}

{Diewert, W.E., and Fox, K.J. (2017). \emph{Substitution Bias in Multilateral Methods for CPI Construction using Scanner Data.} Discussion paper 17-02, Vancouver School of Economics, The University of British Columbia, Vancouver, Canada.}

{Białek, J. (2022). \emph{The general class of multilateral indices and its two special cases.} Paper presented at the 17th Meeting of the Ottawa Group on Price Indices, Rome, Italy.}

{Białek, J. (2023). \emph{Quality adjusted GEKS-type indices for price comparisons based on scanner data.} Statistics in Transition – new series, 24(3), 151-169.}
}
