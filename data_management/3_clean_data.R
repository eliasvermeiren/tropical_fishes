# Clean the available data -----------------------------------------------------

df_raw |> str()


df_clean <- 
  df_raw |> 
  mutate(idx=row_number(),
         name_scientific = paste0(
    toupper(substring(name_scientific,first = 1, last = 1)), 
    substring(name_scientific,first = 2)),
    size_num_f=ifelse(is.na(size_num_f), size_num_m, size_num_f),
    dh_low=ifelse(is.na(dh_low), 0, dh_low),
    dh_high=ifelse(is.na(dh_high), max(df_raw$dh_high, na.rm = T), dh_high),
    compatibility=case_when(
      grepl("peaceful|comm|may fin",comptability_str) ~ "community",
      grepl("aggr|agr|territor|speci|boisterous|pugn", comptability_str, ignore.case = T) ~ "specialist",
      grepl("single|predator", comptability_str) ~ "single",
      T ~comptability_str
    ),
    size_int=cut(size_num_m, c(0,10,25,50, Inf), labels=c("<10", "10-24", "25-50", "50+")),
    size_cat=cut(size_num_m, c(0,10,25,50, Inf), labels=c("small", "medium", "large", "very large"))
    ) |> 
  separate(name_common, c("name_first"),sep = ";")


df_cropped<-
  df_clean |> 
  select(water, family,family_scientific,
         name_scientific, name_first, distribution, size_cat)
