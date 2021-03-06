% To run tests:
% erl -make && erl -noshell -eval "eunit:test(bob, [verbose])" -s init stop

-module(bob_tests).

-include_lib("eunit/include/eunit.hrl").

responds_to_something_test() ->
  bob_responds("Tom-ay-to, tom-aaaah-to.", "Whatever.").

responds_to_shouts_test() ->
  bob_responds("WATCH OUT!", "Whoa, chill out!").

responds_to_questions_test() ->
  bob_responds("Does this cryogenic chamber make me look fat?", "Sure.").

responds_to_forceful_talking_test() ->
  bob_responds("Let's go make out behind the gym!", "Whatever.").

responds_to_acronyms_test() ->
  bob_responds("It's OK if you don't want to go to the DMV.", "Whatever.").

responds_to_forceful_questions_test() ->
  bob_responds("WHAT THE HELL WERE YOU THINKING?", "Whoa, chill out!").

responds_to_shouting_with_special_characters_test() ->
  bob_responds("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!",
               "Whoa, chill out!").

responds_to_shouting_numbers_test() ->
  bob_responds("1, 2, 3, GO!", "Whoa, chill out!").

responds_to_shouting_with_no_exclamation_mark_test() ->
  bob_responds("I HATE YOU", "Whoa, chill out!").

responds_to_statement_containing_question_mark_test() ->
  bob_responds("Ending with ? means a question", "Whatever.").

responds_to_silence_test() ->
  bob_responds("", "Fine. Be that way!").

responds_to_prolonged_silence_test() ->
  bob_responds("    ", "Fine. Be that way!").


responds_to_non_letters_with_question_test() ->
  bob_responds(":) ?", "Sure.").

responds_to_multiple_line_questions_test() ->
  bob_responds("\nDoes this cryogenic chamber make me look fat? \nno",
               "Whatever.").

%% This one is especially challenging in Erlang, hint: use the re module.
responds_to_other_whitespace_test() ->
   bob_responds("\n\r \t\v\xA0\x{2002}", "Fine. Be that way!").

responds_to_only_numbers_test() ->
  bob_responds("1, 2, 3", "Whatever.").

responds_to_question_with_only_numbers_test() ->
  bob_responds("4?", "Sure.").

responds_to_unicode_shout_test() ->
  bob_responds("\xdcML\xc4\xdcTS!", "Whoa, chill out!").

responds_to_unicode_non_shout_test() ->
  bob_responds("\xdcML\xe4\xdcTS!", "Whatever.").

bob_responds(Question, Answer) ->
  ?assertEqual(Answer, bob:response_for(Question)).
