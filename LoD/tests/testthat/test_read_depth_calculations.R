test_that("read_depth_table gives correct probability for read_depth=2", {
  expect_equal(read_depth_table(vaf_threshold=0.1,
                                expected_vaf=0.5,
                                minimum_depth=1,
                                min_alt_reads=2,
                                maximum_depth=1),
               data.frame(read_depth=1, min_alt_reads=2, prob=0))
})

test_that("calculate_required_depth gives minimum depths for sensitivity", {
  depth_frame <- data.frame(read_depth = c(10,11), prob=c(0.95, 0.97))
  expect_equal(calculate_required_depth(read_depth_table=depth_frame,
                                        sensitivity_goal=0.96),
               11)
})