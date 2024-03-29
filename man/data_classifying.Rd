% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/f_Machine_Learning.R
\name{data_classifying}
\alias{data_classifying}
\title{Predicting product classes via the machine learning model}
\usage{
data_classifying(model = list(), data)
}
\arguments{
\item{model}{A list of 8 elements which identify the previously built machine learning model (the list is obtained via the \code{model_classification} function).}

\item{data}{A data set for the model (products with their characteristics). This data set must contain all the columns which were used in the built model.}
}
\value{
This function provides the indicated data set with an additional column, i.e. \code{class_predicted}, which is obtained by using the selected machine learning model.
}
\description{
This function predicts product class levels via the selected machine learning model.
}
\examples{
#Building the model
\donttest{my.grid=list(eta=c(0.01,0.02,0.05),subsample=c(0.5,0.8))}
\donttest{data_train<-dplyr::filter(dataCOICOP,dataCOICOP$time<=as.Date("2021-10-01"))}
\donttest{data_test<-dplyr::filter(dataCOICOP,dataCOICOP$time==as.Date("2021-11-01"))}
\donttest{ML<-model_classification(data_train,data_test,class="coicop6",grid=my.grid,
indicators=c("description","codeIN", "grammage"),key_words=c("uht"),rounds=60)}
#Data classification
\donttest{data_classifying(ML, data_test)}
}
