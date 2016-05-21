-module(hello_world).
-compile(export_all).

greet() -> "Hello, World!".
greet(S) -> "Hello, " ++ S ++ "!".
