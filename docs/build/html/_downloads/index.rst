.. _the_swift_benchmarks:

The SWiFT Benchmarks
====================

.. toctree::
   :hidden:
   
   timeline
   measurements
   swift_neutral_evolution
   swift_stable_evolution
   swift_unstable_dynamics
   validation
   glossary
   faq

.. figure:: ../../images/swift_sunrise.jpg

*Figure: The DOE SWiFT facility in Lubbock, Texas*

What is SWiFT?
--------------
The Scaled Wind Farm Technology (SWiFT) facility is a ground for research and technology innovation in the field of wind-turbine and wind-plant aerodynamics. The facility is funded by the United States (U.S.) Department of Energy (DoE), and located at Texas Tech University's National Wind Institute Research Center in Lubbock, Texas. All data collected at SWiFT through the wake-steering experiment are available free of charge through the DoE Data Archive Portal (DAP).

Atmospheric Conditions at SWiFT
-------------------------------
SWiFT is located in the U.S. Great Plains and is therefore exempt from complex, terrain-induced flow patterns. In the absence of weather phenomena (e.g., fronts, storms) the atmospheric conditions at SWiFT approximate canonical diurnal cycles. The relative simplicity of atmospheric conditions at the site make it a valuable resource for research in complex turbulent flows such as wind-turbine wakes. In other words, the mean and dynamics characteristics of wakes and their effect on downstream turbines can be considered without the influence of complex terrain and weather. For more detail on the atmospheric conditions at this site, see Kelley and Ennis (2016).

Wind Turbines at SWiFT
----------------------
The facility hosts 3 variable-speed, variable-pitch, modified Vestas V27 wind turbine generators (WTGs). These are substantially smaller than utility-scale WTGs (i.e., rotor diameter is 27 m and hub height is 32.5 m), facilitating the deployment of instrumentation and reducing the cost of conducting experiments and testing new technology. 

Instrumentation at SWiFT
------------------------
The largest wind-energy experiment conducted at SWiFT to date is the "wake-steering experiment". In 2016 and 2017, the upstream WTG was intentionally yawed into and out of the wind in order to steer the propagation direction of its wake. This deliberate control of the wake has a direct effect on the power and loads of both WTGs. The data used to define this benchmark were collected during this experiment. A meteorological tower collected freestream atmospheric measurements and a rear-facing, nacelle-mounted lidar mesured the wake. In addition, power and loads measurements were collected at the wake-producing WTG and the wake-bearing WTG.

The Benchmarks
--------------
Researchers at the National Renewable Energy Laboratory (NREL) and Sandia National Laboratories (SNL) have worked together to define three benchmarks for validation of wind-turbine wake simulations:

- :ref:`Wake Evolution in a Nearly Neutral Atmosphere <swift_neutral_evolution>`
- :ref:`Wake Evolution in a Stable Atmosphere <swift_stable_evolution>`
- :ref:`Wake Dynamics in an Unstable Atmosphere <swift_unstable_dynamics>`

If possible, participants are encouraged to engage in all benchmarks in order to investigate the performance of their simulation tool under different stratification scenarios. Participants using steady-state models are limited to the evolution benchmarks: :ref:`Wake Evolution in a Nearly Neutral Atmosphere <swift_neutral_evolution>` and :ref:`Wake Evolution in a Stable Atmosphere <swift_stable_evolution>`.

Status
------

Each benchmark has 3 phases:

1. Code calibration
	First, the atmospheric inflow and turbine response are compared to a subset of the measurements.
2. Blind comparison
    - Code-to-code comparison: Simulation results from all participants are cross-compared, to identify potential mistakes in model configuration.
    - Code-to-data comparison: Simulation results from all participants are compared to the measurement data.
3. Iteration
	Participants are encouraged to revise their simulations and perform their own comparison with the measurement data.

Each phase will be carried out concurrently for the three benchmarks, according to this :ref:`timeline`. 

Data Accessibility
------------------

The benchmark is open to all participants of the International Energy Agency (IEA) Wind Task 31.


References
----------
Christopher Lee Kelley and Brandon Lee Ennis, "SWiFT Site Atmospheric Characterization" (Sandia National Laboratories (SNL-NM), Albuquerque, NM (United States), 2016), https://doi.org/10.2172/1237403.
