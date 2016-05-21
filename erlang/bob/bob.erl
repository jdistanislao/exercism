-module(bob).
-export([response_for/1]).

response_for(S) ->
    case res(S) of
        sure -> "Sure.";
        chill -> "Whoa, chill out!";
        _ -> "Whatever."
    end.

res(S) ->
    case string:substr(lists:reverse(S), 1, 1) of
        "?" -> sure;
        "!" -> chill
    end.
