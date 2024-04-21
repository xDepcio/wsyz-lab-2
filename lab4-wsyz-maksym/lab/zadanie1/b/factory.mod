set PRODUCTS;

param MACHINE_CAPACITY{PRODUCTS};

param SELLING_PRICE{PRODUCTS};

param WEEKLY_LIMIT{PRODUCTS};

param MAX_HOURS;

# Plan the production for each product
var PRODUCTION_PLAN_PRODUCTS{PRODUCTS, t in 1..MAX_HOURS};
var PRODUCTION_PLAN_BINARY{p in PRODUCTS, t in 1..MAX_HOURS} binary;

subject to TWO_DEVICES_AT_A_TIME{t in 1..MAX_HOURS}:
    sum{p in PRODUCTS} PRODUCTION_PLAN_BINARY[p, t] <= 2;

subject to NOT_PRODUCING_IF_NOT_ACTIVE{p in PRODUCTS, t in 1..MAX_HOURS}:
    PRODUCTION_PLAN_PRODUCTS[p, t] <= MACHINE_CAPACITY[p] * PRODUCTION_PLAN_BINARY[p, t];

maximize TOTAL_PROFIT:
    sum{p in PRODUCTS, t in 1..MAX_HOURS} SELLING_PRICE[p] * PRODUCTION_PLAN_PRODUCTS[p, t];

subject to WEEKLY_LIMIT_CONSTRAINT{p in PRODUCTS}:
    sum{t in 1..MAX_HOURS} PRODUCTION_PLAN_BINARY[p, t] <= WEEKLY_LIMIT[p];

subject to HOURS_LIMIT_CONSTRAINT:
    sum{p in PRODUCTS, t in 1..MAX_HOURS} PRODUCTION_PLAN_BINARY[p, t] <= MAX_HOURS;