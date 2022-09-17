
println("*** Starting ***")

include("definitions.jl")

# # initialize logging of simulation 
# logg = log_init(sim_model, sim_length)

# simulation loop
for i = 1:sim_length

end

log_plot(logg)

if sim_model == human_pv 
    println("Position Velocity model")
elseif  sim_model == human_pva
    println("Position Velocity Acceleration model")
elseif  sim_model == human_compare
    println("Comparison of PV and PVA model")
end

