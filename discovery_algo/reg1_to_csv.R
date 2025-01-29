# Load from RData file
setwd('DT-LAB')
load("rg1.RData")  # rg1 will now be available in your environment
load("adj1.RData")


# Initialize an empty list to collect rows
data_list <- list()

# Assume rg1 is the nested list containing 1000 simulations
for (sim_id in seq_along(rg1)) {
  # Extract Y and A for the current simulation
  sim_data <- rg1[[sim_id]]
  Y <- sim_data[[1]]  # Outcomes
  A <- sim_data[[2]]  # Treatments
  
  # Create a dataframe for this simulation
  sim_df <- do.call(rbind, lapply(1:nrow(Y), function(obs_id) {
    data.frame(
      Simulation_ID = sim_id,
      Observation_ID = obs_id,
      Node_ID = 1:9,
      Treatment = A[obs_id, ],
      Outcome = Y[obs_id, ]
    )
  }))
  
  # Append to the list
  data_list[[sim_id]] <- sim_df
}

# Combine all simulations into a single dataframe
final_df <- do.call(rbind, data_list)

write.csv(final_df, "simulation_results.csv", row.names = FALSE)
write.csv(Adj, "adj_matrix.csv", row.names = FALSE)

