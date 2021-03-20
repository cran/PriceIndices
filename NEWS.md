# Package update 0.0.3 -> 0.0.4

## New function

* 1 new function (**data_check**) has beed added. This function checks if the user's data frame is suitable for further price index calculation.

## Bug fixes

* 2 bugs fixed (they concern **data_norm** and **unit** functions)
* corrected descriptions (e.g. **model_classification** function)


# Package update 0.0.2 -> 0.0.3

## Bug fixes

* Function **data_norm** (which is crucial for product unit standarization) has beed corrected 
(the previous version of that function duplicated rows in data frame)


# Package update 0.0.1 -> 0.0.2

## Improvements

* Function **data_matching()** has been modified and now it is much more faster,

* Examples concerning **chain indices** have been modified and now they are less time-consuming while checking,

* New data set is added (**dataU**)

* New functions for scanner data processing are added (**data_unit** and **data_norm**)

## Bug fixes

* Access to HASP and WISP methods has been added in the **price_index()** function and now **price_indices()** works correctly,

* The default value and the meaning of the **sensitivity** parameter in **data_preparing()** and **model_classification()** functions have been corrected.
