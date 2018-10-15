.. _simulations:

Benchmark Simulations
=====================

General Guidelines
------------------

- Simulation tools should be used to the limit of their capabilities. Two-dimensional, steady-state solutions are accepted for low-fidelity models. Mid- and high-fidelity models are expected to provide time series of three-dimensional flow fields from which the mean quantities will be diagnosed.
- Time-stepped simulations should be run to convergence, for statistically representative 10-minute conditions. The minimum recommended time of simulation is 60 minutes, so that six realizations of a 10-minute period may be combined to produce a statistically significant representation of the flow field under the prescribed inflow. Whenever possible, 100+ minutes of simulation should be the target.
- The choice of domain size, grid spacing, time step, and other model configuration parameters is left to the discretion of the participant.
- All provided results must observe the variable definitions and units as explicitly defined in :ref:`glossary`.

Turbine Model
-------------

Please check back later.

.. The official wind-turbine model released with this benchmark is the FAST v7 model of the V27 SWiFT wind turbine. Please check back later for this model.
.. The FAST v7 model was ported to the current version of FAST, called OpenFAST. This version is also provided as supplementary material. Please check back later for this model.
.. Benchmark participants who choose not to use FAST or OpenFAST for their simulations are responsible for porting this turbine model to their simulation platform, and encouraged to share their developed model with the community.

.. _phase1:

Benchmark Phase 1: Code Calibration
-----------------------------------

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
    - Upload a single file named ``<participant_id>_<YYMMDD>_uvw_<x>D.nc`` (format `NetCDF 4.0 <https://www.unidata.ucar.edu/software/netcdf/>`_)
        - A template for this file can be downloaded :download:`here <../../file_templates/template_181001_uvw_2D.nc>`
        - A sample writer for this file can be found in this :download:`jupyter notebook <../../code/example_write_netcdf.ipynb>`
        - ``<YYMMDD>`` is the file submission date
        - ``<x>`` is the downstream distance :math:`x` normalized by the rotor diameter :math:`D`
        - File should contain :math:`u,v,w` values, which are four-dimensional: :math:`(n_t \times n_x \times n_y \times n_z)`. For this submission, :math:`n_x=1` (:math:`x=-65~\mathrm{m}\sim-2.5\mathrm{D}`) and the time is given in units of seconds, since the start of the simulation usable time (i.e., not counting spin-up)
- Results for steady-state simulation tools:
    - Upload a single file named ``<participant_id>_<YYMMDD>_uvw_<x>D_steady_state.nc``
        - Same as for time-stepping simulation tools, but now :math:`n_t=1`

**Wind Turbine Response**

Once the atmospheric inflow is verified to match the conditions specified within the benchmark (within an acceptable range, determined by the upper and lower bounds of the ensemble mean of each quantity considered), the turbine response is compared to measured values.

The inputs with high uncertainty which may need calibration include: A, B, C. Participants are asked to submit the following results:

- Results for time-stepping simulation tools:
    - Upload a single file named ``<participant_id>_<YYMMDD>_wtg_response.txt``
        - A template for this file can be downloaded :download:`here <../../file_templates/template_181005_wtg_response.txt>`
        - ``<YYMMDD>`` is the file submission date
        - File shall have one column per variable (including time) and :math:`n_t` rows
        - Requested variables are time series of rotor speed, power, torque, pitch, and blade-root out-of-plane bending moment
- Results for steady-state simulation tools:
    - Upload a single file named ``<participant_id>_<YYMMDD>_wtg_response_steady_state.txt``
        - A template for this file can be downloaded :download:`here <../../file_templates/template_181005_wtg_response_steady_state.txt>`
        - ``<YYMMDD>`` is the file submission date
        - File shall have three columns: variable name, variable value, variable unit
        - Requested variables are the same as those requested for the time-stepping tools, and their value set to NaN when model cannot simulate them

Benchmark Phase 2: Blind Comparison
-----------------------------------

In Phases 2 and 3 of the benchmark, the downstream evolution of the wind-turbine wake is considered. Phase 2 is composed of two parts. First, a code-to-code comparison is made without considering the wake measurements. Second, the simulation results are compared to measurements.

**Code-to-Code Comparison**

    *The objective of the first step in the blind comparison is to identify potential errors in model configuration, which might be evident in the form of outliers when the model results are cross-compared.*

**Code-to-Measurements Comparison**

    *The objective of the second step of the blind comparison is to provide a first assessment of the skill of the simulation tool.*

In both parts of this phase, participants are requested to submit their results for as many of the requested quantities as possible, according to the level of fidelity of their simulation tool. Publicly released python notebooks will show the analysis method used to compute diagnostics from the submitted results. This is done to ensure consistency of the methodology across groups, and to guarantee repeatability of the analysis. Participants are asked to submit the simulation setup information as well as the simulation results listed below.

- Simulation setup:
    - Same format as in Phase 1

- Results for time-stepping simulation tools and for steady-state simulation tools:
    - Same as requested in Phase 1 for atmospheric inflow and turbine response
    - For atmospheric inflow, several netcdf files are uploaded, one for each :math:`x` dsitance (i.e., not only at :math:`x=-2.5` D, but also between :math:`x=1` D and :math:`x=8` D in :math:`1` D increments)
    - The number of uploaded files for atmospheric inflow will be :math:`9\times n_t` (one per downstream distance and per time)

Benchmark Phase 3: Iteration
----------------------------

    *The objective of this phase is to interrogate results to understand where models work well and where improvements are required.*

In Phase 3, participants are encouraged to revise their simulations and submit updated results. Results from similar models are grouped accordingly to help identify potential improvements to the code or its use. No calibration of the models can be performed at this stage. The calibration is limited to Phase 1. At each iteration, participants are asked to submit the same files requested in Phase 2 in addition to:

- Description of updates to the simulation
    - Upload a single file named ``<participant_id>_<YYMMDD>_updates.txt``
        - ``<YYMMDD>`` is the file submission date
        - File contents clearly identify what was changed from the previous submission to the current, and why the changes were made
        - File can be freely formatted by participants
