# set BREWERIES;
# set WHOLESALERS;

# param BREWERY_CAPABILITIES{BREWERIES};
# param WHOLESALER_REQUIREMENTS{WHOLESALERS};
# param TRANSPORT_COST{BREWERIES, WHOLESALERS};

# var BEER_TRANSPORTED{BREWERIES, WHOLESALERS} integer >= 0;

# minimize TOTAL_COST:
#     sum{(b, w) in BREWERIES cross WHOLESALERS} TRANSPORT_COST[b, w] * BEER_TRANSPORTED[b, w];

# subject to BREWERY_CAPABILITIES_CONSTRAINT{b in BREWERIES}:
#     sum{w in WHOLESALERS} BEER_TRANSPORTED[b, w] <= BREWERY_CAPABILITIES[b];

# subject to SATISFY_WHOLESALER_REQUIREMENTS{w in WHOLESALERS}:
#     sum{b in BREWERIES} BEER_TRANSPORTED[b, w] >= WHOLESALER_REQUIREMENTS[w];

set STEAL_FACTORIES;
set STORAGES;

param STORAGES_NEEDS {STORAGES};
param FACTORIES_CAPABILITIES {STEAL_FACTORIES};
param TRANSPORTATION_COSTS {STEAL_FACTORIES, STORAGES};

var STEAL_TRANSPORTED {STEAL_FACTORIES, STORAGES} integer >= 0;

minimize TRANSPORT_COST:
    sum{(f, s) in STEAL_FACTORIES cross STORAGES} TRANSPORTATION_COSTS[f, s] * STEAL_TRANSPORTED[f, s];

subject to FACTORIES_CAPABILITIES_CONSTRAINT {f in STEAL_FACTORIES}:
    sum{s in STORAGES} STEAL_TRANSPORTED[f, s] <= FACTORIES_CAPABILITIES[f];

subject to STORAGES_NEEDS_CONSTRANT {s in STORAGES}:
    sum{f in STEAL_FACTORIES} STEAL_TRANSPORTED[f, s] >= STORAGES_NEEDS[s];
