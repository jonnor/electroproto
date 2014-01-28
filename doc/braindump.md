

Automated PCB testing
=======================
Flying-probes style testing allows to automatically detect many types of production failures on PCBs.
One could build this with two individually controllable XY (Z) axis
probes, one handling "right hand" and one "left hand" probe. Could also use 4 probes, each covering one "corner".
Each probe would have to be able to both stimulate and measure, and software verify
actual electrical characteristics against the expected.


For low-complexity PCBs one could maybe use a standardized bed-of-nails test fixture,
with NxM nails in a YYY mil spaced grid where each nail can be individually raised or lowered.
The nails could maybe be controlled by linear actuators/solenoids, or be bi-stable such that they
could be "poked down" at start of test run.
