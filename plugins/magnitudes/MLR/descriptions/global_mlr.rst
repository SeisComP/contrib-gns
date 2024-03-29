
The MLr magnitude provides a GNS/Geonet local magnitude (:cite:t:`ristau-2016`).
MLr magnitudes are implemented by the *mlr* plugin.
It is a modified version of the gempa ML magnitude developed
at the Liverpool developer meeting (:cite:t:`gempa`) based on the SED
:ref:`MLh<global_mlh>` magnitude.
The *mlr* plugin is designed to use the MLv station amplitudes for computing
MLr magnitudes. 
The magnitude uses a station correction term and the hypocentral distance.


Amplitude
=========

The MLr amplitude calculation is that of :ref:`MLv<global_mlv>`.


Station Magnitude
=================

The *mLr* plugin calculates individual MLr station local magnitudes from
:ref:`MLv<global_mlv>` amplitudes as:

.. math::

   MLr = \log10(waampl) - \log10(waamplRef)

.. math::

   \log10(waamplRef)= 0.2869 - 1.272 \times 1^{-3} \times hypdistkm - 1.493 \times \log10(hypdistkm) + StationCorrection

with
   
* *waampl:* the :ref:`MLv<global_mlv>` amplitude.
* *hypdistkm:* the distance from the sensor to the hypocenter in kilometers.
*  *A(station):* Station correction is given by module.trunk.NZ.WEL.MLR.params, A.
   Station Correction is set to be distance dependent.
   
   Format: "UpToKilometers A ; UpToNextKilometers A ".
   The option "nomag" disables the station magnitude.

General parameters:
   
* Amplitude unit in SeisComP: **millimeter** (mm) from :ref:`MLv<global_mlv>`
* Time window: 150 s by :ref:`scautopick` or distance dependent
* Distance range: 0 - 20 deg (hypocentral distance, hard-coded)
* Depth range: 0 - 800 km (hard-coded)


Network magnitude
=================

The GNS/Geonet Mlr local magnitude is using the default |scname| behaviour for
the automatic network magnitudes.
Hard-coded ranges are 0-20 degrees maximum distance and 800 km maximum depth.


Configuration
=============

Add the mlr plugin to the existing plugins in the global configuration.
Set the calibration parameters in the global bindings. Add MLr to the list of
magnitudes in the configuration of :ref:`scamp` and :ref:`scmag` for computation
and in :ref:`scesv` for visibility.
