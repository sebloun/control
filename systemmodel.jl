abstract type SystemModel end


@enum SystemModels begin
    human_pv        # human system model with position and velocity as states
                    # and normal distributed noise as acceleration
    human_pva       # human system model with position, velocity and 
                    # acceleration as states and normal distributed noise as 
                    # jerk
    human_compare   # compares human_pv and human pva estimator with human_pva 
                    # system model
end


mutable struct System
    sysmodel::SystemModel   # defines which system model to use
    dt                      # update period
    state                   # contains updated version of state
end

struct SystemModelCart <: SystemModel
    vel                     # forward velocity of cart
    ori                     # orientation of cart in space
end



# call iteravely to update system state
function system_update!(sys::System)
    sys.state = system_state_update!(sys.sysmodel, sys.state, sys.dt)
end


# human system model for 2D pos and vel with propagation of acc noise
function system_state_update!(sysmodel::SystemModelCart, state, dt)
    A = [
        1 0 dt  0 
        0 1 0   dt 
        0 0 1   0 
        0 0 0   1 
    ]

    B = [
        0.5 * dt^2  0
        0           0.5 * dt^2
        dt          0
        0           dt
    ]

    state = A * state + B * randn(2) * sysmodel.acc_noise

    return system_state_limit(sysmodel, state)
end

