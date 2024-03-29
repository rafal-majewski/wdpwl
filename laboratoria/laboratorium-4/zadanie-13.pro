% Please define a predicate route(Place1,Place2,Day,Route) finding connections based on a timetable.
% The timetable is given by a predicate timetable(Place1,Place2,List_of_flights), where List_of_Flights is a flight list from Place1 to Place2.
% Each flight is a list [Departure_time,Arrival_time,Flight_number,List_of_days].
% Example timetable:
timetable(edinburgh,london,
	[ [ 9:40, 10:50, ba4733, alldays],
		[13:40, 14:50, ba4773, alldays],
		[19:40, 20:50, ba4833, [mo,tu,we,th,fr,su]] ]).
	
timetable(london, edinburgh,
	[ [ 9:40, 10:50, ba4732, alldays],
		[13:40, 14:50, ba4752, alldays],
		[18:40, 19:50, ba4822, [mo,tu,we,th,fr]] ]).
	
timetable(london,ljubljana,
	[ [13:20, 16:20, ju201, [fr]],
		[13:20, 16:20, ju213, [su]] ]).
	
timetable(ljubljana, zurich,
	[ [11:30, 12:40, ju322, [tu,th]] ]).

timetable(zurich, london,
	[ [ 9:00,  9:40, ba613, [mo,tu,we,th,fr,sa]],
		[16:10, 16:55, sr806, [mo,tu,we,th,fr,su]] ]).

% A connection Route from Place1 to Place2 is a list of flights PlaceA-PlaceB:Flight_number:Departure_time such that

% PlaceA in the first element of Route is Place1.
% PlaceB in the last element of Route is Place2.
% all flights in Route take place the same day.
% Between all flights there is enough transfer time, let's say 45 minutes.

% Example:
%      ?- route(ljubljana,edinburgh,th,Route).
%      Route = [ljubljana-zurich:ju322:11:30, zurich-london:sr806:16:10, london-edinburgh:ba4822:18:40].

time_later_or_equal(Later_date_hours:Later_date_minutes, Earlier_date_hours:Earlier_date_minutes) :-
	(
		Later_date_hours > Earlier_date_hours,
		!
	);
	(
		Later_date_hours =:= Earlier_date_hours,
		Later_date_minutes >= Earlier_date_minutes
	).

later_45_minutes(Earlier_date_hours:Earlier_date_minutes, Later_date_hours:Later_date_minutes) :-
	(
		Earlier_date_minutes < 15,
		!,
		Later_date_hours is Earlier_date_hours,
		Later_date_minutes is Earlier_date_minutes + 45
	);
	(
		Later_date_hours is Earlier_date_hours + 1,
		Later_date_minutes is Earlier_date_minutes + 45 - 60
	).

day_valid(Day, Days) :-
	(
		Days = alldays,
		!,
		member(Day, [mo, tu, we, th, fr, sa, su])
	);
	member(Day, Days).

route_no_earlier_than(Start_place, End_place, Day, Route, Minimal_time) :-
	(
		Start_place = End_place,
		Route = []
	);
	(
		Route = [Start_place-Next_place:Flight_number:Departure_time|Rest_route],
		timetable(Start_place, Next_place, Flights),
		member([Departure_time, Arrival_time, Flight_number, Days], Flights),
		day_valid(Day, Days),
		time_later_or_equal(Departure_time, Minimal_time),
		later_45_minutes(Arrival_time, Minimal_next_departure_time),
		route_no_earlier_than(Next_place, End_place, Day, Rest_route, Minimal_next_departure_time)
	).

route(Start_place, End_place, Day, Route) :-
	route_no_earlier_than(Start_place, End_place, Day, Route, 0:00).
