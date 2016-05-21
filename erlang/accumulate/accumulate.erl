-module(accumulate).
-compile(export_all).


accumulate(Fn, L) -> lists:reverse(tail_accumulate(Fn, L, [])).

tail_accumulate(Fn, [], Acc) -> Acc;
tail_accumulate(Fn, [H|T], Acc) -> tail_accumulate(Fn, T, [Fn(H)|Acc]).
