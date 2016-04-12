-module(max).
-author("stdima").

-export([list_max/1, reverse_list/1, format_temps/1]).


list_max([Head | Rest]) ->
  list_max(Rest, Head).


list_max([], Head) ->
  Head;
list_max([Head | Rest], Item) when Head > Item->
  list_max(Rest, Head);
list_max([Head | Rest], Item) ->
  list_max(Rest, Item).


reverse_list(List) ->
  reverse_list(List, []).

reverse_list([], List) ->
  List;
reverse_list([Head | Rest], EmptyList) ->
  reverse_list(Rest, [Head | EmptyList]).


format_temps(List_of_cities) ->
  Converted_list = convert_list_to_c(List_of_cities),
  print_temp(Converted_list).

convert_list_to_c([{Name, {f, F}} | Rest]) ->
  Converted_sity = {Name, {c, (F - 32) * 5 / 9}},
  [Converted_sity | convert_list_to_c(Rest)];
convert_list_to_c([City | Rest]) ->
  [City | convert_list_to_c(Rest)];
convert_list_to_c([]) ->
  [].

print_temp([{Name, {c, C}} | Rest]) ->
  io:format("~-15w ~w c~n", [Name, C]),
  print_temp(Rest);
print_temp([]) ->
  ok.
