
set Plants;
set Storages;

param MaxProductionPerPlant{p in Plants};
param StorageRequirementsPerStorage{s in Storages};
param TransportCosts{p in Plants, s in Storages};

var Transported{p in Plants, s in Storages} >= 0;

minimize TotalTransportCost:
    sum{p in Plants, s in Storages} TransportCosts[p,s] * Transported[p,s];

subject to StorageRequirementsk{s in Storages}:
    sum{p in Plants} Transported[p,s] >= StorageRequirementsPerStorage[s];

subject to MaxProduction{p in Plants}:
    sum{s in Storages} Transported[p,s] <= MaxProductionPerPlant[p];


