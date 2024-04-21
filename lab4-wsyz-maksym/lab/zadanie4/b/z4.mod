set Screws;
set Machines;

param Requirements{Screws};
param ManufacturingSpeeds{Machines, Screws};

var Production{Machines, Screws} >= 0;

minimize TotalProductionTime:
    sum{m in Machines, s in Screws} Production[m, s] / ManufacturingSpeeds[m, s];

subject to ScrewsRequirements{s in Screws}:
    sum{m in Machines} Production[m, s] >= Requirements[s];

subject to MinimalRuningTime{m in Machines}:
    sum{s in Screws} Production[m, s] * ManufacturingSpeeds[m, s] >= 10;
   

