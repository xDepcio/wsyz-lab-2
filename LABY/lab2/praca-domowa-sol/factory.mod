# XP profit/ton = 32
# XK profit/ton = 51
# XC profit/ton = 55

var XPrety;
var XKatowniki;
var XCeowniki;

maximize Profit: 32*XPrety + 51*XKatowniki + 55*XCeowniki;

subject to Time: XPrety*(1/200) + XKatowniki*(1/140) + XCeowniki*(1/120) <= 40;
subject to Prety_limit: 0 <= XPrety <= 4000;
subject to Katowniki_limit: 0 <= XKatowniki <= 4000;
subject to Ceowniki_limit: 0 <= XCeowniki <= 4000;
