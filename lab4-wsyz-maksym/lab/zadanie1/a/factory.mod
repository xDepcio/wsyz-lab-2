set PRODUCTS;

param MACHINE_CAPACITY{PRODUCTS};

param SELLING_PRICE{PRODUCTS};

param WEEKLY_LIMIT{PRODUCTS};

param MAX_HOURS;

var PRODUCTION_HOURS{p in PRODUCTS} integer >= 0; 
var PRODUCTION{p in PRODUCTS} integer >= 0;

maximize TOTAL_PROFIT:
    sum{p in PRODUCTS} SELLING_PRICE[p] * PRODUCTION[p];

subject to PRODUCTION_HOURS_CONSTRAINT{p in PRODUCTS}:
    PRODUCTION_HOURS[p] = PRODUCTION[p] / MACHINE_CAPACITY[p];

subject to WEEKLY_LIMIT_CONSTRAINT{p in PRODUCTS}:
    PRODUCTION[p] <= WEEKLY_LIMIT[p];

subject to HOURS_LIMIT_CONSTRAINT:
    sum{p in PRODUCTS} PRODUCTION_HOURS[p] <= MAX_HOURS;