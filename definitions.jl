## Definition of constant parameters, initialization of system model 
## and estimators
## All units in SI Units

using LinearAlgebra

## Definition which system model is used for the simulation
sim_model = human_compare          # human_pv, human_pva, human_compare


## Definition of time parameters for the simulation 
sim_duration = 120                     
sim_step = 0.05                    # 20 Hz
sim_t = 0:sim_step:sim_duration
sim_length = length(sim_t)

