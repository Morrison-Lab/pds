response_levels <- c("small", "moderate", "large")
vaccine_tab <-
  dobson::vaccine |>
  dplyr::mutate(response = factor(response, levels = response_levels)) |>
  xtabs(frequency ~ treatment + response, data = _)
vaccine_tab |>
  as.data.frame.matrix() |>
  pander::pander()
n_vaccine <- sum(vaccine_tab)
n_placebo <- vaccine_tab["placebo", ] # nolint: base_subset_linter. A matrix.
