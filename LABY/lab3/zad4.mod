# set OPERATIONS;
# set PREDECESORS within (OPERATIONS cross OPERATIONS);

# param time {OPERATIONS} >= 0;

# var Tmin >= 0;
# var StartTimes {OPERATIONS} >= 0;

# minimize Total_Time:
#   Tmin;

# # subject to Ograniczenia_Poprzednikow {(i, j) in PREDECESORS}:
# #   StartTimes[j] >= StartTimes[i] + time[i];

# subject to Ograniczenia_Poprzednikow_jak_najpozniej {(i, j) in PREDECESORS}:
#   StartTimes[j] >= StartTimes[i] + time[i] - time[j];

# # subject to Ograniczenia_Poczatkowe:
# #   StartTimes['Fundamenty'] = 0;

# subject to Ograniczenia_Koncowe {i in OPERATIONS}:
#   Tmin >= StartTimes['Ostatnie_prace'] + time['Ostatnie_prace'];

set OPERATIONS;
set PREDECESORS within (OPERATIONS cross OPERATIONS);

param time {OPERATIONS} >= 0;

param Tmin = 450;
var StartTimes {OPERATIONS} >= 0;

maximize Times:
  sum {o in OPERATIONS} StartTimes[o];

subject to Ograniczenia_Poczatkowe:
  StartTimes['Ostatnie_prace'] = Tmin - time['Ostatnie_prace'];

subject to Ograniczenia_OdGory {o in OPERATIONS}:
  StartTimes[o] + time[o] <= Tmin;

subject to Ograniczenia_Poprzednikow {(i, j) in PREDECESORS}:
  StartTimes[i] + time[i] <= StartTimes[j];
