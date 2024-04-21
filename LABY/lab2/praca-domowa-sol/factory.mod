# XP profit/ton = 32
# XK profit/ton = 51
# XC profit/ton = 55

param prety_cena := 32;
param katowniki_cena := 51;
param ceowniki_cena := 55;

param prety_t_w_h := 200;
param katowniki_t_w_h := 140;
param cetowniki_t_w_h := 120;

param max_czas_w_h := 40;

param max_prety := 4000;
param max_katowniki := 3000;
param max_ceowniki := 2500;

var XPrety;
var XKatowniki;
var XCeowniki;

maximize Profit:
    prety_cena*XPrety +
    katowniki_cena*XKatowniki +
    ceowniki_cena*XCeowniki;

subject to Time:
    XPrety*(1/prety_t_w_h) +
    XKatowniki*(1/katowniki_t_w_h) +
    XCeowniki*(1/cetowniki_t_w_h)
        <= max_czas_w_h;

subject to Prety_limit:
    0 <= XPrety <= max_prety;

subject to Katowniki_limit:
    0 <= XKatowniki <= max_katowniki;

subject to Ceowniki_limit:
    0 <= XCeowniki <= max_ceowniki;
