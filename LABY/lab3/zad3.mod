set OPERATIONS;
set PREDECESORS within (OPERATIONS cross OPERATIONS);

param time {OPERATIONS} >= 0;

var Tmin >= 0;
var StartMoments {OPERATIONS} >= 0;

minimize Total_Time:
  Tmin;

subject to Ograniczenia_Poprzednikow {(i, j) in PREDECESORS}:
  StartMoments[j] >= StartMoments[i] + time[i];

subject to Ograniczenia_Poczatkowe:
  StartMoments['Fundamenty'] = 0;

subject to Ograniczenia_Koncowe {i in OPERATIONS}:
  Tmin >= StartMoments['Ostatnie_prace'] + time['Ostatnie_prace'];
