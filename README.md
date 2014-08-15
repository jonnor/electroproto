ElectroProto is a prototyping and small-scale production system for electronics.
It aims to allow you to realize eletronics from a schematic in under 1 hour, with
minimal manual steps once the process is started.

ElectroProto aims to be cheap, small and safe/covenient enough that every hackerspace,
and engineering individual, can have one - next to their 3d printer.

Goals:
* Optimized for prototyping, `1-10 boards`
* `End-to-end`, raw materials in, assembly-ready electronics out
* Complete board in `<1 hour`
* `No manual intervention` required during process
* Precise enough for `simple SMT designs`. 0805, SOIC

Status
=======
Proof-of-concept in progress

Milestones
===========
* 0.0.1: Proof-of-concept. Can mill+drill a PCB, without intermediate manual steps.
* 0.1.0: Minimally useful. Can mill+drill+paste a PCB, "-". Board cutout, component placement and reflow done manually.
* 0.2.0: Can mill+drill+cutout+paste a PCB, "-".
* 0.3.0: Can mill+drill+paste+pick-and-place a PCB ". Solder reflow done manually.
* 0.4.0: Can mill+drill+paste+pick-and-place+reflow a PCB ".
* x.0.0: Electroproto is available for purchase from several manufacturers, and can be made using standard fablab tools.

DONE
=====
* Computer-controlled XY axis, based on Makerblock robot plotter kit.
Basic motion and testing with pen completed.
* Prototype Z axis based on moving bed created.
* Vacum-controlled solder dispenser sourced, cheap china copy.

TODO
======
0.0.1: Proof-of-concept
Goal: September, 2014

* CNC a top-plate for tool mounting, based on bottom plate design
* Make Z-axis functional
** Splice belt
** Modify motor mount to include belt-tightening
* Test/verify XY precision, speed using pen. Calculate requirements
* Create toolmounts for dremel-like multi-tools
* Mount mill+drill toolheads
* Allow to input a set of Gerber files for the PCB traces and holes
* Produce first real PCB


0.1.0: Minimally useful
Goal: November, 2014

* Hack solder paster to be computer controlled, test.
* Produce real PCB for demo
* Improve Gerber input to also dispense solder paste on the PCB
* Document the build for reproducability
