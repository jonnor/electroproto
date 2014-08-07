Current architecture
=======================
* Moving XY bed
* Belt drive (probably need to change to thread drive pretty fast?)
* Tools mounted stationary in roof of machine
* Each job has a dedicated tool/head, with individual Z axis

Open questions
* How to make movable Z-axis??
* What kind of structure to use for joining the XY framing and the roof with heads?


Considerations
=================
* X-Y working area: 160x200mm, enough for 2x std EURO rack PCBs (or 1PCB+1pick-and-place tray)
* Precision: ? Enough to do ICs like TQFP ML44
* Z axis tool weight capacity: 0.5 kg, enough for dremel/multitool spindle

The various tool heads should go as closely together as possible to minimize overhead for XY axis.

* Cut-out requires the most XY strength. Workaround: many passes
* Trace milling requires the most precision, drilling and pasting second.
* Drilling the most Z-axis strength

As a start the PCB mounting can be 160x100mm only, or similar.
Limitation: single-sided PCBs. Seems to complicated for its usefulness to attempt
to create a dual-sided machine or automatic flipping mechanism.
Allowing for an already populated board to be manually mounted the other way and software
to support this is definetely possible though.

Both copper and glass fiber dust is quite unhealthy. The design should incorporate a solution for
not letting this into the air that the operator breathes. Having a shroud/case is useful, but
also draft with filtering will be neccesary.


Development
=============
Always focus on the whole process of realizing electronics, from schematics to finished product,
integrated into the physical assembly.

Use a pen-holder with 0.2 mm pen for initial runs, use to determine maximum precision.
Just use a wooden offering plate and drills screws directly into it for initial PCB mounting?
Mount a camera and light, record processes for documentation and debug. Take a picture of every finished board,
dump this together with all the input data of the job. Overlay results with theoretical/ideal, use as evalutation basis.

Get to a workable revision 1 machine as fast as possible, conducting many experiments to learn what is needed.
When the limits of that architecture has been found, build up a separate generation 2 machine.
Keep generation 1 machine operational for practical/usage experience while developing rev 2.


Testprod items
===============
Ideally be something that can be given away, sold cheaply online,
used by myself or others in hackerspace, or nice things to do workshops on.

* Arduino Nano, Trinket or similar devboard
* Piezo amplifiers
* Analog synth modules
* Guitar effects
* Sensorbricks!
* Reprap motor drivers

Reprap principles applied to electronics
========================
* Can the machine reproduce all its electronics?
* Can it be built using (primarily) a reprap 3d-printer,
and then be used to create the electronics for a reprap?


SMT for non-SMD
=================
Most hackers and hackerspaces still produce non-SMT, and have tons of non-SMD components lying around.
Drilling holes and soldering manually however is a pain. How well does it work to:
* Solder DIL8 to DIL24 with pads+solderpaste
* Solder TO92 and TO220 "
* Solder wires for interconnect
* Handle vias. 0 ohm resistors enough?

Can one use solderpaste with a through-hole component mounted normally, for cases where bending the
legs of component, lying the component sideways is not desired?
Can one automatically deposit paste ahead of component placement?


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


Links
=======

* [MIT POP Fab](http://mtm.cba.mit.edu): Mill, vinyl cutter, 3d printer in a suitcase.
* [MIT reconfigurable stages](http://mtm.cba.mit.edu/machines/stages/). Idea for Z-axis?
* [Stepper precison calculator](http://calculator.josefprusa.cz)
* [Shapeoko open hardware desktop CNC](https://www.inventables.com/technologies/desktop-cnc-mill-kit-shapeoko-2)

SW
====
* PCB milling codegen: https://github.com/Traumflug/Visolate
* Kicad->Cyclone PCB Factory scripts->Printrun->Teacup firmware (-> and Gen7 hardware) to manufacture PB’s.
* pcb2gcode: http://sourceforge.net/apps/mediawiki/pcb2gcode/index.php?title=Main_Page


Moving-Z carriage
=====================
Joakim at Bitraf came up with the idea of having the carriage be the Z-axis,
to avoid having to create one per tool.

* Required travel: 20mm, 5mm work + 15mm safe-Z (for avoiding components)
* Required weight capacity: 100 gram? (mount-plate + PCB + components)
* For drilling, needs to withhold the vertical force acted
* For solder-paste, should be fast to be able to do many holes. Use very low safe-Z, 2-3 mm

Due to the low travel required, could perhaps use a simple cam-follower, driven by a servo.

* Cam principles: [Wikipedia](http://en.wikipedia.org/wiki/Cam), [cmu.edu](http://www.cs.cmu.edu/~rapidproto/mechanisms/chpt6.html)


Host WS & User interface
================

Must be able to run on a cheap embedded device (like RPI).
User interface should be browser based, requiring zero install of custom tools.
Want people to be able to come into hackerspace with only their design and layout, and realize it.
Want ability to build statistics of machine usage, to capture the live process on a video camera, and make time-lapses.
Automatic publishing of these artifacts to show activity and results, improvements over time.

