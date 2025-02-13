library("EpiNow2")

reported_cases <- example_confirmed[1:60]

# set up example generation time
generation_time <- get_generation_time(
  disease = "SARS-CoV-2", source = "ganyani", fixed = TRUE
)

# set delays between infection and case report
incubation_period <- get_incubation_period(
  disease = "SARS-CoV-2", source = "lauer", fixed = TRUE
)

reporting_delay <- dist_spec(
  mean = convert_to_logmean(2, 1), mean_sd = 0,
  sd = convert_to_logsd(2, 1), sd_sd = 0, max = 10
)

delays <- delay_opts(incubation_period + reporting_delay)

# set up example generation time
u_generation_time <- get_generation_time(
  disease = "SARS-CoV-2", source = "ganyani", fixed = FALSE
)

# set delays between infection and case report
u_incubation_period <- get_incubation_period(
  disease = "SARS-CoV-2", source = "lauer", fixed = FALSE
)

u_reporting_delay <- dist_spec(
  mean = convert_to_logmean(2, 1), mean_sd = 0.1,
  sd = convert_to_logsd(2, 1), sd_sd = 0.1, max = 10
)

u_delays <- delay_opts(u_incubation_period + u_reporting_delay)
