set SCREW_TYPES;
set MACHINES;

param SCREW_ORDERS{SCREW_TYPES};
param MACHINE_PROD_SCREW_TIME{MACHINES, SCREW_TYPES};

var PRODUCTION{MACHINES, SCREW_TYPES} >= 0 integer;

minimize TOTAL_PRODUCTION_TIME:
    sum{m in MACHINES, s in SCREW_TYPES} PRODUCTION[m, s] / MACHINE_PROD_SCREW_TIME[m, s];

subject to SCREWS_REQUIREMENTS_CONSTRAINT{s in SCREW_TYPES}:
    sum{m in MACHINES} PRODUCTION[m, s] >= SCREW_ORDERS[s];

subject to MINIMAL_RUN_TIME_CONSTRAINT{m in MACHINES}:
    sum{s in SCREW_TYPES} PRODUCTION[m, s] * MACHINE_PROD_SCREW_TIME[m, s] >= 10;