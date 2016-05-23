-module(bob).
-compile(export_all).

response_for(S) ->
  Checks = [
    {fun bob:is_empty_string/1, "Fine. Be that way!" },
    {fun bob:ends_with_question_mark/1, "Sure." },
    {fun bob:are_capital_letters/1, "Whoa, chill out!" }
  ],
  get_response(S, Checks).

get_response(_, []) -> "Whatever.";
get_response(S, [H|T]) ->
  {F, M} = H,
  case F(S) of
    true -> M;
    _ -> get_response(S, T)
  end.

are_capital_letters(S) -> S =:= string:to_upper(S).

ends_with_question_mark(S) -> $? =:= lists:last(S).

is_empty_string(S) -> "" =:= string:strip(S).
