.. _swift_neutral_evolution:


Neutral Benchmark
=================

This benchmark focuses on **Wake Evolution in a Nearly Neutral Atmosphere**. This document provides detailed, quantitative information necessary to engage in this specific SWiFT Benchmark. For general information about the SWiFT Benchmarks, see :ref:`the_swift_benchmarks`.


The Simulation
--------------

Participants are asked to simulate the mean wake behind a single turbine (between 1 D and 8 D) operating in a neutral atmosphere under the inflow described below. Please observe the following guidelines:

- Simulation tools should be used to the limit of their capabilities. Two-dimensional, steady-state solutions are accepted for low-fidelity models. Mid- and high-fidelity models are expected to provide time series of three-dimensional flow fields from which the mean quantities will be diagnosed.
- Time-stepped simulations should be run to convergence, for statistically representative 10-minute conditions. The minimum recommended time of simulation is 60 minutes, so that six realizations of a 10-minute period may be combined to produce a statistically significant representation of the flow field under the prescribed inflow. Whenever possible, 100+ minutes of simulation should be the target.
- The choice of domain size, grid spacing, time step, and other model configuration parameters is left to the discretion of the participant.
- All provided results must observe the variable definitions and units as explicitly defined in :ref:`glossary`.


**Inflow Conditions**

The information below should be used by the benchmark participants to simulate atmospheric inflow (in the case of higher-fidelity models) or to constrain the parameters used to initialize the model (in the case of lower-fidelity models). Not all information given will necessarily be used to perform the simulations. Note that the values provided refer to the ensemble average of six 10-minute temporal averages.

.. table:: 
    :widths: 10 40 10 10 30
    
    +---------------------------------------------------+--------------------------------------------+------------+-------+----------------------------------------------------------------------------------+
    | Variable                                          | Short Description                          | Value      | Unit  | Remark                                                                           |
    +---------------------------------------------------+--------------------------------------------+------------+-------+----------------------------------------------------------------------------------+
    | :math:`\langle \overline{U}_{hub} \rangle`        | Mean hub-height wind speed                 | 8.3        | m/s   |                                                                                  |
    +---------------------------------------------------+--------------------------------------------+------------+-------+----------------------------------------------------------------------------------+
    | :math:`\langle \overline{TI}_{hub} \rangle`       | Mean hub-height turbulence intensity       | 10.5       | %     |                                                                                  |
    +---------------------------------------------------+--------------------------------------------+------------+-------+----------------------------------------------------------------------------------+
    | :math:`\langle \alpha\rangle`                     | Mean wind-speed profile power-law exponent | 0.14       | \-    |                                                                                  |
    +---------------------------------------------------+--------------------------------------------+------------+-------+----------------------------------------------------------------------------------+
    | :math:`z_0`                                       | Roughness length                           | 0.005-0.05 | m     | Ensemble range for intercept of :math:`\log(z)-U` curve from sonic measurements  | 
    +---------------------------------------------------+--------------------------------------------+------------+-------+----------------------------------------------------------------------------------+
    | :math:`z_i`                                       | Atmospheric boundary layer height          | n/a        | m     |                                                                                  |
    +---------------------------------------------------+--------------------------------------------+------------+-------+----------------------------------------------------------------------------------+
    | :math:`\langle z/L \rangle`                       | Stability parameter                        | 0.004      | \-    | Computed from sonic measurements at :math:`z=10` m                               |       
    +---------------------------------------------------+--------------------------------------------+------------+-------+----------------------------------------------------------------------------------+
    | :math:`\langle u_* \rangle`                       | Friction velocity                          | 0.41       | m/s   | Computed from sonic measurements at :math:`z=10` m                               |
    +---------------------------------------------------+--------------------------------------------+------------+-------+----------------------------------------------------------------------------------+
    | :math:`\langle \overline{w'\theta_v'} \rangle`    | Kinematic vertical turbulent heat flux     | -0.002     | K m/s | Computed from sonic measurements at :math:`z=10` m                               |
    +---------------------------------------------------+--------------------------------------------+------------+-------+----------------------------------------------------------------------------------+    

**Turbine Operation**

The official wind-turbine model released with this benchmark is the FAST v7 model of the V27 SWiFT wind turbine. Please check back later for this model.

The FAST v7 model was ported to the current version of FAST, called OpenFAST. This version is also provided as supplementary material. Please check back later for this model.

Benchmark participants who choose not to use FAST or OpenFAST for their simulations are responsible for porting this turbine model to their simulation platform, and encouraged to share their developed model with the community.

.. _phase1:

Phase 1: Code Calibration
-------------------------

    *The objective of this phase is to provide an opportunity for model calibration before the blind comparison.*

In Phase 1 of the benchmark, the wind-turbine wake is not yet considered. Instead, the atmospheric inflow and turbine response are considered. Participants are requested to submit their results for as many of the requested quantities as possible, according to the level of fidelity of their simulation tool. Publicly released python notebooks will show the analysis method used to compute diagnostics from the submitted results. This is done to ensure consistency of the methodology across groups, and to guarantee repeatability of the analysis.

The calibration is used to modify inputs that are of high uncertainty to ensure that output quantities of interest are correct. 

**Atmospheric Inflow**

During this exercise, the simulated atmospheric inflow is compared to measured atmospheric inflow (this may not be applicable to lower-fidelity models).
For the quantities of interest that were provided in the benchmark definition, the simulated values are simply compared to the range of acceptable values across the ensemble of measurements (which thus far has only been provided for roughness length).
For additional quantities of interest, the simulated values are compared to the mean and range of measured values within the ensemble that makes up this benchmark. 

The inputs with high uncertainty which may need calibration include: roughness length, surface heat flux, atmospheric boundary layer height. The quantities of interest that will be considered can be found in :ref:`validation`. Participants are asked to submit the simulation setup information as well as the simulation results listed below.

- Simulation setup:
    - Upload a single file named ``<participant_id>_<YMMDD>_simulation_setup.txt`` 
		- A template for this file can be downloaded :download:`here <../../file_templates/template_181001_simulation_setup.txt>`
		- ``<YYMMDD>`` is the file submission date
		- File shall have three columns: parameter description, parameter value, parameter unit
		- Comments should be preceded by #. As many comment lines as necessary can be added.
		- No header is necessary. Number of rows is the number of parameters provided. 
		- Requested parameters are:    
			- Mesh grid spacing in the three spatial dimensions (:math:`\Delta x, \Delta y, \Delta z`)
			- Temporal resolution of the output (:math:`\Delta t`)
			- Number of points in each of the four dimensions (:math:`n_x, n_y, n_z, n_t`)
			- Any constants used to initialize the model (e.g., roughness lenght, inversion height and strength, surface heat flux, wake expansion coefficient...)
    - Mesh information does not require its own file; it is contained within the wind flow files.			
- Results for time-stepping simulation tools:      
    - Upload files named ``<participant_id>_<YYMMDD>_uvw_<x>D_<t>.vtk``
		- A template for this file can be downloaded :download:`here <../../file_templates/template_181001_uvw_-2.5D_0.vtk>`
		- ``<YYMMDD>`` is the file submission date
		- ``<x>`` is the downstream distance :math:`x` normalized by the rotor diameter :math:`D` 
		- ``<t>`` is the time of the flow field in the file, in units of seconds, since the start of the simulation usable time (i.e., not counting spin-up)
		- File should contain :math:`u,v,w` values on a 2-dimensional plane (along :math:`y` and :math:`z`) at a fixed time and downstream distance (:math:`x=-65~\mathrm{m}\sim-2.5\mathrm{D}`)
		- A total of :math:`n_t` files should be uploaded
- Results for steady-state simulation tools:
    - Upload a single file named ``<participant_id>_<YYMMDD>_uvw_<x>D_steady_state.txt`` 
		- A template for this file can be downloaded :download:`here <../../file_templates/template_181001_uvw_-2.5D_0.vtk>`
		- ``<YYMMDD>`` is the file submission date
		- ``<x>`` is the downstream distance :math:`x` normalized by the rotor diameter :math:`D` 
		- File should contain :math:`u,v,w` values on a 2-dimensional plane (along :math:`y` and :math:`z`) at a fixed time and downstream distance (:math:`x=-65~\mathrm{m}\sim-2.5\mathrm{D}`)		

**Wind Turbine Response**

Once the atmospheric inflow is verified to match the conditions specified within the benchmark (within an acceptable range, determined by the upper and lower bounds of the ensemble mean of each quantity considered), the turbine response is compared to measured values. 

The inputs with high uncertainty which may need calibration include: A, B, C. Participants are asked to submit the following results:

- Results for time-stepping simulation tools:       
    - Upload a single file named ``<participant_id>_<YYMMDD>_wtg_response.txt`` 
		- ``<YYMMDD>`` is the file submission date
		- File shall have one column per variable (including time) and :math:`n_t` rows 
		- Requested variables are time series of rotor speed, power, torque, pitch, and blade-root out-of-plane bending moment
- Results for steady-state simulation tools:
    - Upload a single file named ``<participant_id>_<YYMMDD>_wtg_response_steady_state.txt`` 
		- ``<YYMMDD>`` is the file submission date
		- File shall have three columns: variable name, variable value, variable unit
		- Requested variables are the same as those requested for the time-stepping tools, except when model cannot simulate them

Phase 2: Blind Comparison
-------------------------

In Phases 2 and 3 of the benchmark, the downstream evolution of the wind-turbine wake is considered. Phase 2 is composed of two parts. First, a code-to-code comparison is made without considering the wake measurements. Second, the simulation results are compared to measurements.

**Code-to-Code Comparison**

    *The objective of the first step in the blind comparison is to identify potential errors in model configuration, which might be evident in the form of outliers when the model results are cross-compared.*  
    
**Code-to-Measurements Comparison**
    
    *The objective of the second step of the blind comparison is to provide a first assessment of the skill of the simulation tool.*

In both parts of this phase, participants are requested to submit their results for as many of the requested quantities as possible, according to the level of fidelity of their simulation tool. Publicly released python notebooks will show the analysis method used to compute diagnostics from the submitted results. This is done to ensure consistency of the methodology across groups, and to guarantee repeatability of the analysis. Participants are asked to submit the simulation setup information as well as the simulation results listed below.

- Simulation setup:
    - Same format as in Phase 1

- Results for time-stepping simulation tools: 
	- Same format as in Phase 1, but now uploaded not only at :math:`x=-2.5` D, but also between :math:`x=1` D and :math:`x=8` D in :math:`1` D increments 
	- The number of uploaded files will be :math:`9\times n_t` (one per downstream distance and per time)  

- Results for steady-state simulation tools:
	- Same format as in Phase 1, but now uploaded not only at :math:`x=-2.5` D, but also between :math:`x=1` D and :math:`x=8` D in :math:`1` D increments 
	- The number of uploaded files will be :math:`9`, one for each :math:`x` distance requested
        

Phase 3: Iteration
------------------

    *The objective of this phase is to interrogate results to understand where models work well and where improvements are required.*

In Phase 3, participants are encouraged to revise their simulations and submit updated results. Results from similar models are grouped accordingly to help identify potential improvements to the code or its use. No calibration of the models can be performed at this stage. The calibration is limited to Phase 1. At each iteration, participants are asked to submit the same files requested in Phase 2 in addition to:

- Description of updates to the simulation
    - Upload a single file named ``<participant_id>_<YYMMDD>_updates.txt`` 
		- ``<YYMMDD>`` is the file submission date
		- File contents clearly identify what was changed from the previous submission to the current, and why the changes were made
		- File can be freely formatted by participants
