## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7, 
  fig.height = 5,
  warning = FALSE,
  message = FALSE,
  eval=FALSE
)

## -----------------------------------------------------------------------------
#  library(PriceIndices)
#  head(milk)

## -----------------------------------------------------------------------------
#  unique(milk$description)

## -----------------------------------------------------------------------------
#  dataset<-generate(pmi=c(1.02,1.03,1.04),psigma=c(0.05,0.09,0.02),
#                    qmi=c(3,4,4),qsigma=c(0.1,0.1,0.15),
#                    start="2020-01")
#  head(dataset)

## -----------------------------------------------------------------------------
#  tindex(pmi=c(1.02,1.03,1.04),psigma=c(0.05,0.09,0.02),start="2020-01",ratio=FALSE)

## -----------------------------------------------------------------------------
#  head(data_preparing(milk, time="time",prices="prices",quantities="quantities"))

## -----------------------------------------------------------------------------
#  dataAGGR

## -----------------------------------------------------------------------------
#  data_aggregating(dataAGGR)

## -----------------------------------------------------------------------------
#  data_unit(dataU,units=c("g","ml","kg","l"),multiplication="x")

## -----------------------------------------------------------------------------
#  # Preparing a data set
#  data<-data_unit(dataU,units=c("g","ml","kg","l"),multiplication="x")
#  # Normalization of grammage units
#  data_norm(data, rules=list(c("ml","l",1000),c("g","kg",1000)))

## -----------------------------------------------------------------------------
#  subgroup1<-data_selecting(milk, include=c("milk"), must=c("UHT"))
#  head(subgroup1)

## -----------------------------------------------------------------------------
#  unique(subgroup1$description)

## -----------------------------------------------------------------------------
#  subgroup2<-data_selecting(milk, must=c("milk"), exclude=c("past","goat"))
#  head(subgroup2)

## -----------------------------------------------------------------------------
#  unique(subgroup2$description)

## ---- results=FALSE-----------------------------------------------------------
#  my.grid=list(eta=c(0.01,0.02,0.05),subsample=c(0.5,0.8))
#  data_train<-dplyr::filter(dataCOICOP,dataCOICOP$time<=as.Date("2021-10-01"))
#  data_test<-dplyr::filter(dataCOICOP,dataCOICOP$time==as.Date("2021-11-01"))
#  ML<-model_classification(data_train,
#                           data_test,
#                           coicop="coicop6",
#                           grid=my.grid,
#                           indicators=c("description","codeIN"),
#                           key_words=c("uht"),
#                           rounds=60)

## -----------------------------------------------------------------------------
#  ML$figure_training

## -----------------------------------------------------------------------------
#  ML$figure_importance

## -----------------------------------------------------------------------------
#  data_predicted<-data_classifying(ML, data_test)
#  head(data_predicted)

## -----------------------------------------------------------------------------
#  head(dataMATCH)

## -----------------------------------------------------------------------------
#  data1<-data_matching(dataMATCH, start="2018-12",end="2019-02", codeIN=TRUE, codeOUT=TRUE, precision=.98, interval=TRUE)
#  head(data1)

## -----------------------------------------------------------------------------
#  data2<-data_matching(dataMATCH, start="2018-12",end="2019-02",
#                       codeIN=FALSE, onlydescription=TRUE, interval=TRUE)
#  head(data2)

## -----------------------------------------------------------------------------
#  fisher(data1, start="2018-12", end="2019-02")
#  jevons(data2, start="2018-12", end="2019-02")

## -----------------------------------------------------------------------------
#  filter1<-data_filtering(milk,start="2018-12",end="2019-03",
#                          filters=c("extremeprices"),pquantiles=c(0.01,0.99))
#  filter2<-data_filtering(milk,start="2018-12",end="2019-03",
#                          filters=c("extremeprices"),plimits=c(0.5,2))
#  filter3<-data_filtering(milk,start="2018-12",end="2019-03",
#                          filters=c("extremeprices","lowsales"),plimits=c(0.5,2))
#  filter4<-data_filtering(milk,start="2018-12",end="2019-03",
#                          filters=c("dumpprices"),dplimits=c(0.9,0.8))

## -----------------------------------------------------------------------------
#  data_without_filters<-data_filtering(milk,start="2018-12",end="2019-03",filters=c())
#  nrow(data_without_filters)
#  nrow(filter1)
#  nrow(filter2)
#  nrow(filter3)
#  nrow(filter4)

## -----------------------------------------------------------------------------
#  filter1B<-data_filtering(milk,start="2018-12",end="2019-03",
#                           filters=c("extremeprices"),pquantiles=c(0.01,0.99),
#                           interval=TRUE, retailers=TRUE)
#  nrow(filter1B)

## -----------------------------------------------------------------------------
#  available(milk, period1="2018-12", period2="2019-12", type="retID",interval=TRUE)

## -----------------------------------------------------------------------------
#  matched(milk, period1="2018-12", period2="2019-12", type="prodID",interval=TRUE)

## -----------------------------------------------------------------------------
#  matched_index(milk, period1="2018-12", period2="2019-12", type="prodID",interval=TRUE)

## -----------------------------------------------------------------------------
#  matched_fig(milk, start="2018-12", end="2019-12", type="prodID")

## -----------------------------------------------------------------------------
#  matched_fig(milk, start="2018-12", end="2019-04", type="prodID", figure=FALSE)

## -----------------------------------------------------------------------------
#  prices(milk, period="2019-06")

## -----------------------------------------------------------------------------
#  quantities(milk, period="2019-06", set=c(400032, 71772, 82919))

## -----------------------------------------------------------------------------
#  sales(milk, period="2019-06", set=c(400032, 71772, 82919))

## -----------------------------------------------------------------------------
#  ctg<-unique(milk$description)
#  categories<-c(ctg[1],ctg[2],ctg[3])
#  milk1<-dplyr::filter(milk, milk$description==categories[1])
#  milk2<-dplyr::filter(milk, milk$description==categories[2])
#  milk3<-dplyr::filter(milk, milk$description==categories[3])
#  sales_groups(datasets=list(milk1,milk2,milk3),start="2019-04", end="2019-07")
#  sales_groups(datasets=list(milk1,milk2,milk3),start="2019-04", end="2019-07", shares=TRUE)

## -----------------------------------------------------------------------------
#  sales_groups(datasets=list(milk1,milk2,milk3),start="2019-04", end="2019-07",
#               barplot=TRUE, shares=TRUE, names=categories)

## -----------------------------------------------------------------------------
#  pqcor(milk, period="2019-05")
#  pqcor(milk, period="2019-05",figure=TRUE)

## -----------------------------------------------------------------------------
#  pqcor_fig(milk, start="2018-12", end="2019-06", figure=FALSE)
#  pqcor_fig(milk, start="2018-12", end="2019-06")

## -----------------------------------------------------------------------------
#  dissimilarity(milk, period1="2018-12",period2="2019-12",type="pq")

## -----------------------------------------------------------------------------
#  dissimilarity_fig(milk, start="2018-12",end="2019-12",type="pq",benchmark="start")

## -----------------------------------------------------------------------------
#  elasticity(coffee, start = "2018-12", end = "2019-01")

## -----------------------------------------------------------------------------
#  elasticity_fig (milk, start = "2018-12", end = "2019-12", fixedbase = FALSE)

## -----------------------------------------------------------------------------
#  jevons(milk, start="2018-12", end="2020-01")
#  jevons(milk, start="2018-12", end="2020-01", interval=TRUE)

## -----------------------------------------------------------------------------
#  fisher(milk, start="2018-12", end="2020-01")
#  lloyd_moulton(milk, start="2018-12", end="2020-01", sigma=0.9)
#  lowe(milk, start="2019-12", end="2020-02", base="2018-12", interval=TRUE)

## -----------------------------------------------------------------------------
#  chfisher(milk, start="2018-12", end="2020-01")
#  chfisher(milk, start="2018-12", end="2020-01", interval=TRUE)

## -----------------------------------------------------------------------------
#  geks(milk, start="2019-01", end="2019-04",window=10)
#  geksl(milk, wstart="2018-12", start="2019-03", end="2019-05")

## -----------------------------------------------------------------------------
#  prodID<-base::unique(milk$prodID)
#  values<-stats::runif(length(prodID),1,2)
#  v<-data.frame(prodID,values)
#  head(v)
#  

## -----------------------------------------------------------------------------
#  QU(milk, start="2018-12", end="2019-12", v)

## -----------------------------------------------------------------------------
#  tpd_splice(milk, start="2018-12", end="2020-02",window=10,splice="half",interval=TRUE)

## -----------------------------------------------------------------------------
#  geks_fbew(milk, start="2018-12", end="2020-03")
#    geks_fbew(milk, start="2018-12", end="2019-12")*
#    geks_fbew(milk, start="2019-12", end="2020-03")

## -----------------------------------------------------------------------------
#  ccdi_fbmw(milk, start="2018-12", end="2020-03")
#  
#  ccdi_fbmw(milk, start="2018-12", end="2019-12")*
#  ccdi_fbmw(milk, start="2019-12", end="2020-03")

## -----------------------------------------------------------------------------
#  price_index(milk, start="2019-05", end="2019-06", formula="fisher")
#  price_index(milk, start="2018-12", end="2020-02",
#              formula="tpd_splice",splice="movement",interval=TRUE)

## -----------------------------------------------------------------------------
#  price_indices(milk, start="2019-12", end="2020-08", bilateral=c("fisher"),
#                bindex=c("young"), base=c("2018-12"),
#                cesindex=c("agmean"), sigma=c(0.5),
#                fbmulti=c("geks", "gk"), fbwindow=c(9,9),
#                splicemulti=c("tpd_splice"),splicewindow=c(6),
#                splice=c("movement"), interval=TRUE)

## -----------------------------------------------------------------------------
#  g1<-dplyr::filter(milk, milk$description=="full-fat milk UHT")
#  g2<-dplyr::filter(milk, milk$description=="low-fat milk UHT")

## -----------------------------------------------------------------------------
#  final_index(datasets=list(g1,g2), start="2018-12", end="2019-05",
#              formula="chwalsh",
#              aggrsets = "laspeyres", aggrret = "fisher",
#              interval=TRUE)

## -----------------------------------------------------------------------------
#  final_index2(data=coffee, by="description",all=TRUE,
#               start="2018-12",end="2019-12",
#               formula="fisher",
#               interval=TRUE,
#               aggrsets="laspeyres",aggrret="none",
#               figure=FALSE)
#  

## -----------------------------------------------------------------------------
#  final_index2(data=coffee, by="description",all=TRUE,
#               start="2018-12",end="2019-12", formula="fisher",
#               interval=TRUE,
#               aggrsets="laspeyres",aggrret="none",
#               figure=TRUE)
#  

## -----------------------------------------------------------------------------
#  final_index2(data=coffee, by="retID",all=TRUE,
#               start="2018-12",end="2019-12", formula="fisher",
#               interval=TRUE,
#               aggrsets="none",aggrret="none",
#               figure=TRUE)

## -----------------------------------------------------------------------------
#  compare_indices(milk, start="2018-12",end="2019-12",bilateral=c("chjevons"),
#                  fbmulti=c("geks"),fbwindow=c(13),
#                  namebilateral=c("Chain Jevons"), namefbmulti=c("Full GEKS"))

## -----------------------------------------------------------------------------
#  case1<-price_index(milk, start="2018-12",end="2019-12",
#                     formula="tpd", interval=TRUE)
#  case2<-final_index(datasets=list(milk), start="2018-12", end="2019-12",
#                     formula="tpd", aggrsets="none", aggrret = "fisher",
#                     interval=TRUE)
#  

## -----------------------------------------------------------------------------
#  compare_final_indices(finalindices=list(case1, case2),names=c("TPD without aggregation","TPD with aggregation"))

## -----------------------------------------------------------------------------
#  #Creating a data frame with unweighted bilateral index values
#  df<-price_indices(milk, bilateral=c("jevons","dutot","carli"),
#                    start="2018-12",end="2019-12",interval=TRUE)
#  #Calculating average distances between indices (in p.p)
#  compare_distances(df)

## -----------------------------------------------------------------------------
#  #Creating a data frame with example bilateral indices
#  df<-price_indices(milk,
#                    bilateral=c("jevons","laspeyres","paasche","walsh"),
#                    start="2018-12",end="2019-12",interval=TRUE)
#  #Calculating the target Fisher price index
#  target_index<-fisher(milk,start="2018-12",end="2019-12",interval=TRUE)
#  #Calculating average distances between considered indices and the Fisher index (in p.p)
#  compare_to_target(df,target=target_index)

