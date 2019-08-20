install.packages('dplyr')
library(dplyr)
packageVersion('dplyr')
# > packageVersion('dplyr')
# [1] ‘0.8.3’

# 259 개 함수 포함
# 190815 기준 77개 사용경험 있음
## 사용해본적 있는 것
sel_val <- names(iris)
iris %>% group_by(sel_val)
iris %>% group_by_(.dots = sel_val)

for (idx in sel_val) {
  iris %>% 
    group_by_(.dots = idx) %>% 
    count() %>% 
    print()
}

# what is difference between group_by and group_by_?
#Dplyr uses non-standard evaluation (NSE) in all of the most important single table verbs: 
# filter(), mutate(), summarise(), arrange(), select() and group_by(). 
# NSE is important not only to save you typing, but for database backends, 
# is what makes it possible to translate your R code to SQL. 
# However, while NSE is great for interactive use it’s hard to program with. 
# This vignette describes how you can opt out of NSE in dplyr, and instead rely only on SE (along with a little quoting).

#Every function in dplyr that uses NSE also has a version that uses SE. 
# There’s a consistent naming scheme: the SE is the NSE name with _ on the end. 
# For example, the SE version of summarise() is summarise_(), the SE version of arrange() is arrange_(). 
# These functions work very similarly to their NSE cousins, but the inputs must be “quoted”
iris %>% 
  select_vars(include = chr('Sepal'))
# 기본
dplyr::select()
dplyr::filter()
dplyr::group_by()
dplyr::mutate()
dplyr::arrange()
dplyr::desc()
dplyr::distinct()


# 고급
dplyr::arrange_()
dplyr::arrange_all()
dplyr::arrange_at()
dplyr::arrange_if()

dplyr::distinct_()
dplyr::distinct_all()
dplyr::distinct_at()
dplyr::distinct_if()

dplyr::filter_()
dplyr::filter_all()
dplyr::filter_at()
dplyr::filter_if()

dplyr::group_by_()
dplyr::group_by_all()
dplyr::group_by_at()
dplyr::group_by_if()
dplyr::intersect()
dplyr::lag()
dplyr::lead()
dplyr::mutate_()
dplyr::mutate_all()
dplyr::mutate_at()
dplyr::mutate_each()
dplyr::mutate_each_()
dplyr::mutate_if()
dplyr::n_distinct()
dplyr::n()
dplyr::rename()
dplyr::rename_()
dplyr::sample_frac()
dplyr::sample_n()
dplyr::select_()
dplyr::select_all()
dplyr::select_at()
dplyr::select_if()
dplyr::select_var()
dplyr::select_vars()
dplyr::select_vars_()

dplyr::summarise()
dplyr::summarise_()
dplyr::summarize_all()
dplyr::summarize_at()
dplyr::summarize_each()
dplyr::summarize_each_()
dplyr::summarize_if()
dplyr::transmute()
dplyr::transmute_()
dplyr::transmute_all()
dplyr::transmute_at()
dplyr::transmute_if()
dplyr::ungroup()
dplyr::union()
dplyr::union_all()
dplyr::coalesce()


## condition
dplyr::if_else()
dplyr::case_when()
starwars %>%
  select(name:mass, gender, species) %>%
  mutate(
    type = case_when(
      height > 200 | mass > 200 ~ "large",
      species == "Droid"        ~ "robot",
      TRUE                      ~ "other"
    )
  )

## join
dplyr::semi_join()
dplyr::full_join()
dplyr::inner_join()
dplyr::anti_join()
dplyr::left_join()
dplyr::right_join()
dplyr::nest_join()

## dataset

dplyr::band_instruments
dplyr::band_instruments2
dplyr::band_members
dplyr::nasa
dplyr::starwars
dplyr::storms

## windowed rank function
dplyr::cume_dist()
dplyr::row_number()
dplyr::ntile()
dplyr::min_rank()
dplyr::dense_rank()
dplyr::percent_rank()


## Count/tally observations by group
dplyr::add_count()
dplyr::add_count_()
dplyr::add_tally()
dplyr::add_tally_()
dplyr::count()
dplyr::count_()
dplyr::tally()
dplyr::tally_()

## Apply predicate to all variables
dplyr::all_vars()
dplyr::any_vars()

## tbl
dplyr::tbl()
dplyr::tbl_cube()
dplyr::tbl_df()
dplyr::as.tbl()
dplyr::as.tbl_cube()
dplyr::is.tbl()

# Objects exported from other packages
# from magrittr
dplyr::`%>%`()

# from tibble
dplyr::data_frame()
dplyr::data_frame_()
dplyr::as_data_frame()
dplyr::lst()
dplyr::lst_()
dplyr::add_row()
dplyr::type_sum()
dplyr::glimpse()
dplyr::frame_data()
dplyr::tibble()
dplyr::tribble()
dplyr::as_tibble()
dplyr::trunc_mat()
dplyr::tbl_sum()

# from tidyselect
dplyr::contains()
dplyr::ends_with()
dplyr::everything()
dplyr::matches()
dplyr::num_range()
dplyr::one_of()
dplyr::starts_with()
dplyr::last_col()

# Tidy eval helpers
dplyr::enexpr()
dplyr::enexprs()
dplyr::ensym()
dplyr::ensyms()
dplyr::sym()
dplyr::syms()
dplyr::enquo()
dplyr::enquos()
dplyr::expr()
dplyr::as_label()
dplyr::quo()
dplyr::quo_name()
dplyr::quos()

# Evaluate, compare, benchmark operations of a set of srcs.
dplyr::bench_tbls()
dplyr::compare_tbls()
dplyr::compare_tbls2()
dplyr::eval_tbls()
dplyr::eval_tbls2()

# Efficiently bind multiple data frames by row and column
dplyr::bind_cols()
dplyr::bind_rows()

# Cumulativate versions of any, all, and mean
dplyr::cumall()
dplyr::cumany()
dplyr::cummean()


# Print the location in memory of a data frame
dplyr::location()
dplyr::changes()


# Database and SQL generics.
dplyr::db_analyze()
dplyr::db_begin()
dplyr::db_commit()
dplyr::db_create_index()
dplyr::db_create_indexes()
dplyr::db_create_table()
dplyr::db_data_type()
dplyr::db_desc()
dplyr::db_drop_table()
dplyr::db_explain()
dplyr::db_has_table()
dplyr::db_insert_into()
dplyr::db_list_tables()
dplyr::db_query_fields()
dplyr::db_query_rows()
dplyr::db_rollback()
dplyr::db_save_query()
dplyr::db_write_table()
dplyr::sql()
dplyr::sql_escape_ident()
dplyr::sql_escape_string()
dplyr::sql_join()
dplyr::sql_select()
dplyr::sql_semi_join()
dplyr::sql_set_op()
dplyr::sql_subquery()
dplyr::sql_translate_env()


# Force computation of a database query
dplyr::collapse()
dplyr::compute()
dplyr::collect()


## 처음 보는 것

dplyr::add_rownames()
dplyr::all_equal()
dplyr::auto_copy()

dplyr::between()
iris[between(iris$Sepal.Length, 3, 5), ]


dplyr::check_dbplyr()


dplyr::combine()
dplyr::common_by()

dplyr::copy_to()
dplyr::current_vars()

dplyr::dim_desc()
dplyr::distinct_prepare()
dplyr::do()
dplyr::do_()
dplyr::dr_dplyr()
dplyr::explain()
dplyr::failwith()
dplyr::first()
dplyr::funs()
dplyr::funs_()
dplyr::group_by_drop_default()
dplyr::group_by_prepare()


dplyr::group_cols()
  s_dt <- iris %>% group_by(Species)
  s_dt %>% select(group_cols())


dplyr::group_data()
dplyr::group_rows()
iris %>% 
  group_by(Sepal.Length) %>% 
  group_data()
  group_rows()


dplyr::group_indices()
dplyr::group_indices_()
  group_indices(iris, Species)
  group_indices_(iris, 'Species')

dplyr::group_keys()
dplyr::group_split()
iris %>% group_by(Species) %>% 
  group_split()
  group_keys()

dplyr::group_map()
dplyr::group_modify()
dplyr::group_nest()

dplyr::group_size()

dplyr::group_trim()
dplyr::group_vars()
dplyr::group_walk()
dplyr::grouped_df()
dplyr::groups()
dplyr::hybrid_call()
dplyr::id()
dplyr::ident()
dplyr::is_grouped_df()
dplyr::is.grouped_df()
dplyr::is.src()
dplyr::last()
dplyr::make_tbl()

dplyr::n_groups()
dplyr::na_if()
dplyr::near()
dplyr::new_grouped_df()
dplyr::nth()


dplyr::order_by()
dplyr::progress_estimated()
dplyr::pull()
dplyr::rbind_all()
dplyr::rbind_list()
dplyr::recode()
dplyr::recode_factor()
dplyr::rename_all()
dplyr::rename_at()
dplyr::rename_vars()
dplyr::rename_vars_()
dplyr::rowwise()
dplyr::same_src()
dplyr::setdiff()
dplyr::setequal()

dplyr::show_query()
dplyr::slice()
dplyr::slice_()
dplyr::src()
dplyr::src_df()
dplyr::src_local()
dplyr::src_mysql()
dplyr::src_postgres()
dplyr::src_sqlite()
dplyr::src_tbls()

dplyr::tbl_nongroup_vars()
dplyr::tbl_vars()
dplyr::top_frac()
dplyr::top_n()
dplyr::validate_grouped_df()
dplyr::vars()
dplyr::with_order()
dplyr::wrap_dbplyr_obj()



# 사용할 필요 없음
# iris %>% 
# select(select_vars(names(iris), everything()))
# select_vars(names(iris), starts_with("Petal"))
# select_vars(names(iris), ends_with("Width"))
# select_vars(names(iris), contains("etal"))
# select_vars(names(iris), matches(".t."))
# select_vars(names(iris), Petal.Length, Petal.Width)
# select_vars(names(iris), one_of("Petal.Length", "Petal.Width"))

iris %>% 
  select(matches('Se'))
df <- as.data.frame(matrix(runif(100), nrow = 10))
df <- df[c(3, 4, 7, 1, 9, 8, 5, 2, 6, 10)]
select_vars(names(df), num_range("V", 4:6))

# Drop variables
select_vars(names(iris), -starts_with("Petal"))
select_vars(names(iris), -ends_with("Width"))
select_vars(names(iris), -contains("etal"))
select_vars(names(iris), -matches(".t."))
select_vars(names(iris), -Petal.Length, -Petal.Width)

# Rename variables
select_vars(names(iris), petal_length = Petal.Length)
select_vars(names(iris), petal = starts_with("Petal"))

# Rename variables preserving all existing - 사용할 수 있을 수 있음
iris %>% select(
rename_vars(names(iris), petal_length = Petal.Length))

# You can unquote names or formulas (or lists of)
select_vars(names(iris), !!! list(quo(Petal.Length)))
select_vars(names(iris), !! quote(Petal.Length))

# The .data pronoun is available:
# select_vars(names(mtcars), .data$cyl)
# select_vars(names(mtcars), .data$mpg : .data$disp)

# However it isn't available within calls since those are evaluated
# outside of the data context. This would fail if run:
# select_vars(names(mtcars), identical(.data$cyl))


# If you're writing a wrapper around select_vars(), pass the dots
# via splicing to avoid matching dotted arguments to select_vars()
# named arguments (`vars`, `include` and `exclude`):
# wrapper <- function(...) {
#   select_vars(names(mtcars), !!! quos(...))
# }
# 
# # This won't partial-match on `vars`:
# wrapper(var = cyl)
# 
# # This won't match on `include`:
# wrapper(include = cyl)
# wrapper(include = cyl, a = carb)
# }
