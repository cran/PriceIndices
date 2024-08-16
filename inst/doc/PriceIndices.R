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
#  #Generating an artificial dataset (the elasticity of substitution is 1.25)
#  df<-generate_CES(pmi=c(1.02,1.03),psigma=c(0.04,0.03),
#  elasticity=1.25,start="2020-01",n=100,days=TRUE)
#  head(df)

## -----------------------------------------------------------------------------
#  #Verifying the elasticity of substitution
#  elasticity(df, start="2020-01",end="2020-02")

## -----------------------------------------------------------------------------
#  head(data_preparing(milk, time="time",prices="prices",quantities="quantities"))

## -----------------------------------------------------------------------------
#  #Creating a data frame with zero prices (df)
#  data<-dplyr::filter(milk,time>=as.Date("2018-12-01") & time<=as.Date("2019-03-01"))
#  sample<-dplyr::sample_n(data, 100)
#  rest<-setdiff(data, sample)
#  sample$prices<-0
#  df<-rbind(sample, rest)
#  #The Fisher price index calculated for the original data set
#  fisher(df, "2018-12","2019-03")
#  #Zero price imputations:
#  df2<-data_imputing(df, start="2018-12", end="2019-03",
#                zero_prices=TRUE,
#                outlets=TRUE)
#  #The Fisher price index calculated for the data set with imputed prices:
#  fisher(df2, "2018-12","2019-03")

## -----------------------------------------------------------------------------
#  dataAGGR

## -----------------------------------------------------------------------------
#  data_aggregating(dataAGGR)

## -----------------------------------------------------------------------------
#  data_unit(dataU,units=c("g|ml|kg|l"),multiplication="x")

## -----------------------------------------------------------------------------
#  # Preparing a data set
#  data<-data_unit(dataU,units=c("g|ml|kg|l"),multiplication="x")
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
#                           class="coicop6",
#                           grid=my.grid,
#                           indicators=c("description","codeIN","grammage"),
#                           key_words=c("uht"),
#                           rounds=60)

## -----------------------------------------------------------------------------
#  ML$figure_training

## -----------------------------------------------------------------------------
#  ML$figure_importance

## -----------------------------------------------------------------------------
#  #Setting a temporary directory as a working directory
#  wd<-tempdir()
#  setwd(wd)
#  #Saving and loading the model
#  save_model(ML, dir="My_model")
#  ML_fromPC<-load_model("My_model")
#  #Prediction
#  data_predicted<-data_classifying(ML_fromPC, data_test)
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
#  sugar.<-dplyr::filter(sugar, time==as.Date("2018-12-01") | time==as.Date("2019-12-01"))
#  nrow(sugar.)
#  sugar_<-data_reducing(sugar., start="2018-12", end="2019-12",by="description", minN=5)
#  nrow(sugar_)

## -----------------------------------------------------------------------------
#  #Data matching over time
#  df<-data_matching(data=data_DOWN_UP_SIZED, start="2024-01", end="2024-02",
#                    codeIN=TRUE,codeOUT=TRUE,description=TRUE,
#                    onlydescription=FALSE,precision=0.9,interval=FALSE)
#  # Extraction of information about grammage
#  df<-data_unit(df,units=c("g|ml|kg|l"),multiplication="x")
#  # Price standardization
#  df<-data_norm(df, rules=list(c("ml","l",1000),c("g","kg",1000)))
#  # Downsized and upsized products detection
#  result<-shrinkflation(data=df, start="2024-01","2024-02", prec=3, interval=FALSE, type="shrinkflation")
#  # result$df_changes
#  result$df_type
#  result$df_overview
#  # result$products_detected
#  # result$df_detected
#  # result$df_reduced
#  result$df_summary

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
#  list<-products(milk, "2018-12","2019-12")
#  list$statistics

## -----------------------------------------------------------------------------
#  list$figure

## -----------------------------------------------------------------------------
#  products_fig(milk, "2018-12","2019-12",
#  fixed_base=TRUE, contributions=FALSE,
#  show=c("new","disappearing","matched","available"))
#  

## -----------------------------------------------------------------------------
#  prices(milk, period="2019-06")

## -----------------------------------------------------------------------------
#  quantities(milk, period="2019-06", set=c(400032, 71772, 82919), ID=TRUE)

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
#  elasticity_fig (milk,start="2018-12",end="2019-04",figure=TRUE,
#  method=c("lm","f","sv"),names=c("LM","Fisher", "SV"))

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
#      ccdi_fbmw(milk, start="2018-12", end="2019-12")*
#      ccdi_fbmw(milk, start="2019-12", end="2020-03")

## -----------------------------------------------------------------------------
#  price_indices(milk,
#           start = "2018-12", end = "2019-12",
#           formula=c("geks","ccdi","hybrid","fisher",
#           "QMp","young","geksl_fbew"),
#           window = c(13, 13),
#           base = c("2019-03", "2019-03"),
#           r=c(3), interval=TRUE)

## -----------------------------------------------------------------------------
#  price_indices(coffee,
#           start = "2018-12", end = "2019-12",
#           formula=c("laspeyres","paasche","fisher"),
#           interval=FALSE)

## -----------------------------------------------------------------------------
#  final_index(milk, start = "2018-12", end = "2019-12",
#           formula = "fisher", groups = TRUE, outlets = TRUE,
#           aggr = "laspeyres", by = "description",
#           interval = TRUE)
#  

## -----------------------------------------------------------------------------
#  df<-price_indices(milk, start = "2018-12", end = "2019-12",
#  formula=c("laspeyres", "fisher"), interval = TRUE)
#  compare_indices_df(df)

## -----------------------------------------------------------------------------
#  case1<-price_indices(milk, start="2018-12",end="2019-12",
#                     formula="fisher", interval=TRUE)
#  case2<-final_index(milk, start="2018-12", end="2019-12",
#                     formula="fisher",
#                     outlets=TRUE,
#                     aggr = "laspeyres",
#                     interval=TRUE)
#  

## -----------------------------------------------------------------------------
#  compare_indices_list(data=list(case1, case2),
#                  names=c("Fisher without aggregation",
#                  "Fisher with aggregation"))

## -----------------------------------------------------------------------------
#  #Creating a data frame with unweighted bilateral index values
#  df<-price_indices(milk,
#                    formula=c("jevons","dutot","carli"),
#                    start="2018-12",
#                    end="2019-12",
#                    interval=TRUE)
#  #Calculating average distances between indices (in p.p)
#  compare_distances(df)

## -----------------------------------------------------------------------------
#  #Creating a data frame with example bilateral indices
#  df<-price_indices(milk,
#                    formula=c("jevons","laspeyres","paasche","walsh"),
#                    start="2018-12",end="2019-12",interval=TRUE)
#  #Calculating the target Fisher price index
#  target_index<-fisher(milk,start="2018-12",end="2019-12",interval=TRUE)
#  #Calculating average distances between considered indices and the Fisher index (in p.p)
#  compare_to_target(df,target=target_index)

## -----------------------------------------------------------------------------
#  #creating a list with jackknife results
#  comparison<-compare_indices_jk(milk,
#  formula=c("jevons","fisher","geks"),
#  start="2018-12",
#  end="2019-12",
#  window=c(13),
#  names=c("Jevons","Fisher","GEKS"),
#  by="retID",
#  title_iterations="Box-plots for iteration values",
#  title_pseudovalues="Box-plots for pseudovalues")
#  #displaying a data frame with basic characteristics of the calculated iteration index values
#  comparison$iterations

## -----------------------------------------------------------------------------
#  #displaying a data frame with basic characteristics of the calculated index pseudovalues obtained in the jackknife procedure
#  comparison$pseudovalues

## -----------------------------------------------------------------------------
#  #displaying box-plotes created for the calculated iteration index values
#  comparison$figure_iterations

## -----------------------------------------------------------------------------
#  #displaying box-plotes created for the calculated index pseudovalues obtained in the jackknife procedure
#  comparison$figure_pseudovalues

## -----------------------------------------------------------------------------
#  bennet(milk, start = "2018-12", end = "2019-12", interval=TRUE)

## -----------------------------------------------------------------------------
#  milk$prodID<-milk$description
#  bennet(milk, start = "2018-12", end = "2019-12", contributions = TRUE)

## -----------------------------------------------------------------------------
#  montgomery(coffee, start = "2018-12", end = "2019-12", interval=TRUE)

## -----------------------------------------------------------------------------
#  coffee$prodID<-coffee$description
#  montgomery(coffee, start = "2018-12", end = "2019-12", contributions = TRUE)

