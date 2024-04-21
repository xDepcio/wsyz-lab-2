set Screws;
set Machines;

param Requirements{Screws};
param ManufacturingSpeeds{Machines, Screws};

var Production{Machines, Screws} >= 0;
var ProductionTimeCap >= 0;

minimize MaxProductionTime: ProductionTimeCap;

subject to ProductionTimeCapDef{m in Machines}:
    ProductionTimeCap >= sum{s in Screws} Production[m, s] / ManufacturingSpeeds[m, s];

subject to ScrewsRequirements{s in Screws}:
    sum{m in Machines} Production[m, s] >= Requirements[s];

subject to MinimalRuningTime{m in Machines}:
    sum{s in Screws} Production[m, s] * ManufacturingSpeeds[m, s] >= 10;
   

