.. _swift_neutral_evolution:


Neutral Benchmark
=================

This benchmark focuses on **Wake Evolution in a Nearly Neutral Atmosphere**. This document provides detailed, quantitative information necessary to engage in this specific SWiFT Benchmark. For general information about the SWiFT Benchmarks, see :ref:`the_swift_benchmarks`.


The Simulation
--------------

Participants are asked to simulate the mean wake behind a single turbine (between 1 D and 8 D) operating in a neutral atmosphere under the inflow described below. Please observe the following guidelines:

- Simulation tools should be used to the limit of their capabilities. Two-dimensional, steady-state solutions are accepted for low-fidelity models. Mid- and high-fidelity models are expected to provide time series of three-dimensional flow fields from which the mean quantities will be diagnosed.
- Time-stepped simulations should be run for an absolute minimum of 10 minutes of usable data  (i.e., in addition to the spin-up time required by their simulation tool). The recommended time of simulation is 60 minutes, so that six realizations of a 10-minute period may be combined to produce a statistically significant representation of the flow field under the prescribed inflow.
- The choice of domain size, grid spacing, time step, and other model configuration parameters is left to the discretion of the participant.
- All provided results must observe the variable definitions and units as explicitly defined in :ref:`glossary`.


**Inflow Conditions**

The information below should be used by the benchmark participants to simulate atmospheric inflow (in the case of higher-fidelity models) or to constrain the parameters used to initialize the model (in the case of lower-fidelity models). Not all information given will necessarily be used to perform the simulations. Note that the values provided refer to the ensemble average of six 10-minute temporal averages.

+---------------------------------------------------+-----------+-------+-------------------------------------------------------+
| Variable                                          | Value     | Unit  | Remark                                                |
+===================================================+===========+=======+=======================================================+
| :math:`\langle \overline{U}_{hub} \rangle`        | 8.3       | m/s   |                                                       |
+---------------------------------------------------+-----------+-------+-------------------------------------------------------+
| :math:`\langle \overline{TI}_{hub} \rangle`       | 10.5      | %     |                                                       |
+---------------------------------------------------+-----------+-------+-------------------------------------------------------+
| :math:`\langle \alpha\rangle`                     | 0.14      | \-    |                                                       |
+---------------------------------------------------+-----------+-------+-------------------------------------------------------+
| :math:`\langle z/L \rangle`                       | 0.004     | \-    | Computed from sonic measurements at :math:`z=10` m    |
+---------------------------------------------------+-----------+-------+-------------------------------------------------------+
| :math:`\langle u_* \rangle`                       | 0.41      | m/s   | Computed from sonic measurements at :math:`z=10` m    |
+---------------------------------------------------+-----------+-------+-------------------------------------------------------+
| :math:`\langle \overline{w'\theta_v'} \rangle`    | -0.002    | K m/s | Computed from sonic measurements at :math:`z=10` m    |
+---------------------------------------------------+-----------+-------+-------------------------------------------------------+

**Turbine Operation**

The official wind-turbine model released with this benchmark is the FAST v7 model of the V27 SWiFT wind turbine. The FAST v7 model was ported to the current version of FAST, called OpenFAST. This version is also provided as supplementary material. Benchmark participants who choose not to use FAST or OpenFAST for their simulations are responsible for porting this turbine model to their simulation platform, and encouraged to share their developed model with the community.

Phase 1: Code Calibration
-------------------------

	*The objective of this phase is to provide an opportunity for model calibration before the blind comparison.*

In Phase 1 of the benchmark, the wind-turbine wake is not yet considered. Instead, the atmospheric inflow and turbine response are considered. Participants are requested to submit their results for as many of the requested quantities as possible, according to the level of fidelity of their simulation tool. Publicly released python notebooks will show the analysis method used to compute diagnostics from the submitted results. This is done to ensure consistency of the methodology across groups, and to guarantee repeatability of the analysis.

**Atmospheric Inflow**

During this exercise, the simulated atmospheric inflow is compared to the measured atmospheric inflow (this may not be applicable to lower-fidelity models). Participants are asked to submit the simulation setup information as well as the simulation results listed below.

- Simulation setup:
	- Upload a single file named ``<participant_id>_<submission_date_YYMMDD>_simulation_setup.txt`` with three columns: parameter description, parameter value, parameter unit. Number of rows is the number of parameters provided. Requested parameters are:
		- Mesh grid spacing in the three spatial dimensions (:math:`\Delta x, \Delta y, \Delta z`)
		- Temporal resolution of the output (:math:`\Delta t`)
		- Number of points in each of the four dimensions (:math:`n_x, n_y, n_z, n_t`)
		- Any constants used to initialize the model (e.g., roughness lenght, inversion height and strength, surface heat flux, wake expansion coefficient...)
- Results for time-stepping simulation tools:	
	- Time series of :math:`u, v, w` at :math:`(x=-65,y=0,z=18.5~\mathrm{m})`
		- Upload a single file named ``<participant_id>_<submission_date_YYMMDD>_uvw_rotor_top.txt`` with four columns :math:`(t, u, v`, w)` and :math:`n_t` rows.
	- Time series of :math:`u, v, w` at :math:`(x=-65,y=0,z=32.0~\mathrm{m})`
		- Upload a single file named ``<participant_id>_<submission_date_YYMMDD>_uvw_rotor_hub.txt`` with four columns :math:`(t, u, v$, w)` and :math:`n_t` rows.
	- Time series of :math:`u, v, w` at :math:`(x=-65,y=0,z=45.0~\mathrm{m})`
		- Upload a single file named ``<participant_id>_<submission_date_YYMMDD>_uvw_rotor_bot.txt`` with four columns :math:`(t, u, v$, w)` and :math:`n_t` rows. 
	- Temporally-averaged vertical profile of :math:`U$ at :math:`(x=-65,y=0)`
		- Upload a single file named ``<participant_id>_<submission_date_YYMMDD>_U_vertical_profile.txt`` with two columns (:math:`z,U`) and :math:`n_z` rows.
- Results for steady-state simulation tools:
	- Upload a single file named ``<participant_id>_<submission_date_YYMMDD>_inflow_steady_state.txt`` with three columns: variable name, variable value, variable unit. The requested variables are the atmospheric inflow validation metrics listed below.


**Wind Turbine Response**

Once the atmospheric inflow is verified to match the conditions specified within the benchmark (within an acceptable range, determined by the upper and lower bounds of the ensemble mean of each quantity considered), the turbine response is compared to measured values. Participants are asked to submit the following results:

- Results for time-stepping simulation tools:	
	- Time series of :math:`P` and :math:`M_x`
		- Upload a single file named ``<participant_id>_<submission_date_YYMMDD>_wtg_response.txt`` with three columns (:math:`t,P,M_x`) and :math:`n_t` rows. 
- Results for steady-state simulation tools:
	- Upload a single file named ``<participant_id>_<submission_date_YYMMDD>_wtg_response_steady_state.txt`` with three columns: variable name, variable value, variable unit. The requested variables are the same as those requested for the time-stepping tools, except when model cannot simulate them.

Phase 2: Blind Comparison
-------------------------

In Phases 2 and 3 of the benchmark, the downstream evolution of the wind-turbine wake is considered. Phase 2 is composed of two parts. First, a code-to-code comparison is made without considering the wake measurements. Second, the simulation results are compared to measurements.

**Code-to-Code Comparison**

	*The objective of the first step in the blind comparison is to identify potential errors in model configuration, which might be evident in the form of outliers when the model results are cross-compared.*  
	
**Code-to-Measurements Comparison**
	
	*The objective of the second step of the blind comparison is to provide a first assessment of the skill of the simulation tool.*

In both parts of this phase, participants are requested to submit their results for as many of the requested quantities as possible, according to the level of fidelity of their simulation tool. Publicly released python notebooks will show the analysis method used to compute diagnostics from the submitted results. This is done to ensure consistency of the methodology across groups, and to guarantee repeatability of the analysis. Participants are asked to submit the simulation setup information as well as the simulation results listed below.

- Simulation setup:
	- Upload a single file named ``<participant_id>_<submission_date_YYMMDD>_simulation_setup.txt`` with three columns: parameter description, parameter value, parameter unit. Number of rows is the number of parameters provided. Requested parameters are:
		- Mesh grid spacing in the three spatial dimensions (:math:`\Delta x, \Delta y, \Delta z`)
		- Temporal resolution of the output (:math:`\Delta t`)
		- Number of points in each of the four dimensions (:math:`n_x, n_y, n_z, n_t`)
		- Any constants used to initialize the model (e.g., roughness lenght, inversion height and strength, surface heat flux...)
	- Mesh information does not require its own file. It is contained within the wind flow files.

- Results for time-stepping simulation tools:		
	- Time series of :math:`u, v, w` on two-dimensional planes parallel to the rotor at :math:`x=-2.5` D, and between :math:`x=1` D and :math:`x=8` D in :math:`1` D increments. 
		- Upload nine files, one for each :math:`x` distance requested
		- Each file should be named ``<participant_id>_<submission_date_YYMMDD>_uvw_<x>D.<format>`` where ``<x>`` can be -2.5, 1, 2, 3, 4, 5, 6, 7, 8
		- Each file will contain a 4-dimensional data set, with the following dimensions: :math:`t`, :math:`y`, :math:`z`, and velocity component. The size of the data array will be :math:`n_t \times n_y \times n_z \times 3`.
		- Accepted file formats are ``TBD``

- Results for steady-state simulation tools:
	- Mean of :math:`u, v, w` on two-dimensional planes parallel to the rotor at :math:`x=-2.5` D, and between :math:`x=1` D and :math:`x=8` D in :math:`1` D increments. 
		- Upload nine files, one for each :math:`x` distance requested
		- Each file should be named ``<participant_id>_<submission_date_YYMMDD>_uvw_<x>D_steady_state.<format>`` where ``<x>`` can be -2.5, 1, 2, 3, 4, 5, 6, 7, 8
		- Each file will contain a 3-dimensional data set, with the following dimensions: :math:`y`, :math:`z`, and velocity component. The size of the data array will be :math:`n_y \times n_z \times 3`.
		- Accepted file formats are ``TBD``


Phase 3: Iteration
------------------

	*The objective of this phase is to interrogate results to understand where models work well and where improvements are required.*

In Phase 3, participants are encouraged to revise their simulations and submit updated results. Results from similar models are grouped accordingly to help identify potential improvements to the code or its use. No calibration of the models can be performed at this stage. The calibration is limited to Phase 1. At each iteration, participants are asked to submit the same files requested in Phase 2 in addition to:

- Description of updates to the simulation
	- Upload a single file named ``<participant_id>_<submission_date_YYMMDD>_updates.txt`` which clearly identifies what was changed from the previous submission to the current, and why the changes were made.
