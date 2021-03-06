PLAN YOUR PICNIC!
=================

Plan Your Picnic helps you to celebrate Canberra's 100th Birthday with a perfect
outing to one of the ACT's many fine picnic locations!

Plan Your Picnic was developed for GovHack 2013.

WARNING
=======

This code was developed for a hackathon during 48 hours of sleep deprivation and
far too much caffeine and sugar. The documentation is necessarily incomplete,
and we don't guarantee much by way of code quality!


SOURCE CODE
===========

GitHub: https://github.com/daxtens/planyourpicnic/


REQUIREMENTS
============
* Python 2.7 (NOT Python 3.x)
* PostgreSQL 9.1+
* PostgreSQL "cube" and "earthdistance" plugins
* Fabric
* Possibly other things - read our installation scripts...


INSTALLING
==========

*WARNING*: Installation does fun things! It may destroy stuff! These
instructions are incomplete and probably wrong!

1. Install Fabric
2. Adjust settings in settings.py
3. Adjust HOSTNAME in settings.py, assets/js/frontend.js
4. You may need other dependencies that can be seen in bootstrap.sh
5. fab setup
6. Run main.py to run the default Bottle server

## Installing on something other than dedicated hardware

1. Create a virtualenv in ./env
2. Set up all the dependencies.
3. Adjust supervisor's pyp.conf to use the main_shared.py file.

ACKNOWLEDGEMENTS
================

Plan Your Picnic uses the following datasets from the ACT Government:

* Playgrounds in the ACT
[https://www.data.act.gov.au/Public-Works/Playgrounds-in-the-ACT/gk9r-4a8z]
* Public Toilets in the ACT
[https://www.data.act.gov.au/Public-Works/Public-Toilets-in-the-ACT/3tyf-txjn]
* Public Furniture in the ACT
[https://www.data.act.gov.au/Public-Works/Public-Furniture-in-the-ACT/ch39-bukk]
* ACT Barbecue (BBQ) Locations
[http://data.gov.au/dataset/act-barbecue-bbq-locations/]

ACT Government datasets are released under the Creative Commons Attribution 3.0
Australia licence.

Historical information is provided by the National Library of Australia, through
Trove. 

Icons are from Nicolas Mollet's Maps Icons Collection
[http://mapicons.nicolasmollet.com/] under the Creative Commons
Attribution-ShareAlike 3.0 Unported licence.


COPYRIGHT AND DISCLAIMER
========================

The following licence applies only to the Plan Your Picnic application code and
not to any datasets, libraries or graphics.

Plan Your Picnic — a picnic planner for Canberra

Copyright © 2013 Daniel Axtens, Teresa Bradbury, Andrew Donnellan, Jonathan
Franzi.

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see <http://www.gnu.org/licenses/>.

Plan Your Picnic is not endorsed or associated with the ACT Government in any
way, and the ACT Government is not responsible for any errors in this
application.
