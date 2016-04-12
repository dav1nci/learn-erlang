-module(if_test).
-author("stdima").

-export([test_if/2, case_demo/1, month_lenght/2, foreach/2, start/0]).



test_if(A, B) ->
  if
    A == 5 ->
      io:format("A == 5~n", []),
      a_equals_5;
    B == 6 ->
      io:format("B == 6~n", []),
      {qwe, 15};
    A == 2, B == 3 ->
      io:format("A == 2, B == 3~n", []),
      a_equals_2_b_equals_3;
    A == 1, B == 7 ->
      io:format("A == 1 ; B == 7~n", []),
      a_equals_1_or_b_equals_7
  end.

case_demo(Lenght) ->
  case Lenght of
    {c, X} ->
      {i, X * 2.5};
    {i, X} ->
      {i, X}
  end.


start() ->
  io:format("~w~n", [hello_world]).



month_lenght(Year, Month) ->
  Leap = if
           trunc(Year / 400) * 400 == Year ->
             leap;
           trunc(Year / 100) * 400 == Year ->
             not_leap;
           trunc(Year / 4) * 4 == Year ->
             leap;
           true ->
             not_leap
         end,
  case Month of
    sept ->
      30;
    apr ->
      30;
    feb when Leap == leap ->
      28;
    feb ->
      29
end.



foreach(Fun, [First | Rest]) ->
  Fun(First),
  foreach(Fun, Rest);
foreach(Fun, []) ->
  done.
