-module(leap).
-compile(export_all).

leap_year(Y) when (Y rem 4 =:= 0 andalso Y rem 100 =/= 0) orelse Y rem 400 =:= 0 ->
    true;

leap_year(_) ->
    false.
