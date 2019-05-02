context("test-mappings-and-scores-work")
set.seed(1234)
df <- simulate_block_data(5, lower_corr = .5, upper_corr = .65, n = 100)
prt <- partition(df, threshold = .6)

test_that("mappings work", {
  key <- mapping_key(prt)
  expect_is(key, "tbl")
  expect_length(key, 4)
  expect_equal(nrow(key), ncol(partition_scores(prt)))

  long_key <- unnest_mappings(prt)
  expect_is(long_key, "tbl")
  expect_length(long_key, 4)
  expect_equal(nrow(long_key), ncol(df))
  expect_equal(tidyr::unnest(key), long_key)

  expect_true(nrow(long_key) > nrow(key))
  expect_true(nrow(unnest_mappings(prt)) > nrow(unnest_reduced(prt)))

  gnames <- mapping_groups(prt)
  gind <- mapping_groups(prt, indices = TRUE)
  expect_equal(length(gnames), length(gind))
  expect_equal(length(gnames), nrow(key))
  expect_equal(length(unlist(gnames)), nrow(long_key))
  expect_is(gnames[[1]], "character")
  expect_is(gind[[1]], "integer")
})


test_that("reduced scores work", {
  scores <- partition_scores(prt)
  expect_is(scores, "tbl")
  expect_length(scores, 3)
  expect_equal(nrow(scores), nrow(df))
})