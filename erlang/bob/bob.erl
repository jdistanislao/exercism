-module(bob).
-export([response_for/1]).

response_for(S) ->
  Checks = [
    {fun(S) -> says_anything(S) end, "Fine. Be that way!" },
    {fun(S) -> is_a_question(S) end, "Sure." },
    {fun(S) -> is_a_shout(S) end, "Whoa, chill out!" }
  ],
  get_response(S, Checks).

get_response(_, []) -> "Whatever.";
get_response(S, [H|T]) ->
  {F, M} = H,
  case F(S) of
    true -> M;
    _ -> get_response(S, T)
  end.

is_a_shout(S) ->
  S =:= string:to_upper(S) andalso lists:any(fun(L) -> is_letter(L) end, S).

is_a_question(S) ->
  case is_a_shout(S) of
    true -> false;
    _ -> $? =:= lists:last(S)
  end.

says_anything(S) -> "" =:= string:strip(S).

is_letter(L) when L >= $a andalso L =< $z -> true;
is_letter(L) when L >= $A andalso L =< $Z -> true;
is_letter(_) -> false.


%% "\n\r \t\v\xA0\x{2002}", "Fine. Be that way!"
