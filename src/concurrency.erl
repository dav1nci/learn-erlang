-module(concurrency).
-author("stdima").

-export([start/1, ping/2, pong/0]).

ping(N, Pong_Pid) ->
  link(Pong_Pid),
  ping1(N, Pong_Pid).

ping1(0, _) ->
  exit(ping_sygnal);
ping1(N, Pong_Pid) ->
  Pong_Pid ! {ping, self()},
  receive
    pong ->
      io:format("Ping received pong~n", [])
  end,
  ping1(N - 1, Pong_Pid).

pong() ->
  receive
    {ping, Ping_Pid} ->
      io:format("Pong received ping~n", []),
      Ping_Pid ! pong,
      pong();
    {'EXIT', From_Pid, Reason} ->
      io:format("Pong recieve proc kill sygnal~n")
  end.

start(Ping_Node) ->
  Pong_Pid = spawn(concurrency, pong, []),
  spawn(Ping_Node, concurrency, ping, [3, Pong_Pid]).
