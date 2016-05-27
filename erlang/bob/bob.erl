-module(bob).
-export([response_for/1]).

response_for(String) ->
  Checks = [
    {fun says_anything/1, "Fine. Be that way!" },
    {fun is_shouting/1,   "Whoa, chill out!" },
    {fun is_a_question/1, "Sure." },
    {fun(_) -> true end,  "Whatever." }
  ],
  get_response(String, Checks).

get_response(String, [{F, Message}|T]) ->
  case F(String) of
    true -> Message;
       _ -> get_response(String, T)
  end.

is_shouting(String) ->
  String =:= string:to_upper(String) andalso
    lists:any(fun(L) -> L >= $A andalso L =< $Z end, String).

is_a_question(String) ->
  $? =:= lists:last(String).

says_anything(String) ->
  nomatch =/= re:run(String, "^(\\h|\\v)*$", [unicode]).
