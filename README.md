# harmonic_power_flow.gms
harmonic analysis, seasonal and hourly variations, considering nonlinear loads, power generation, voltage constraints, and time-dependent electricity pricing


This GAMS code sets up the data structure and parameters for modeling power flow and harmonic distortion in a distribution network (DN) that includes nonlinear loads and seasonal/time-based variations. It defines sets for buses, harmonics, nonlinear loads, time intervals, and seasonal conditions, as well as parameters for generation, load, and power flow constraints. Harmonic current injection from nonlinear loads is modeled using predefined harmonic current factors. Seasonal and hourly variation in load and pricing is accounted for using scaling coefficients, and cost factors for both real and reactive power are incorporated. The code also calculates time-varying values for power generation, demand, and electricity price across different seasons and times of the day.








