test_that("nested_read_depth_table sensitivity approaches prob=1 when testing with extremely high DNA input and high sequencing depth", {
  expect_equal(nested_read_depth_table(total_primer_plexes=1000,
                                         loss_term=0,
                                         vaf_threshold=0.01,
                                         expected_vaf=0.5,
                                         dna_input=1000000,
                                         minimum_depth=10000,
                                         maximum_depth=10000),
               data.frame(read_depth=10000, prob=1))
})

test_that("nested_read_depth_table gives prob=0 for low DNA input (10ng) and low read depth (1 read)", {
  expect_equal(nested_read_depth_table(total_primer_plexes=1000,
                                      loss_term=0,
                                      vaf_threshold=0.1,
                                      dna_input=10,
                                      expected_vaf=0.5,
                                      minimum_depth=1,
                                      maximum_depth=1),
               data.frame(read_depth=1, prob=0))
})