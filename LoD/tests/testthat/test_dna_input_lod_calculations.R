test_that("amplification_input_table gives prob=0 for low DNA input (1ng)", {
  expect_equal(amplification_input_table(total_primer_plexes=660,
                                   loss_term=0,
                                   vaf_threshold=0.1,
                                   expected_vaf=0.5,
                                   minimum_dna_input=1,
                                   maximum_dna_input=1),
              data.frame(dna_input=1, prob=0))
  })