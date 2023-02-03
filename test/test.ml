(* TEST PLAN - We divided our system into three compilation units, the model,
   which contains the current state of the game, the view, which is responsible
   for drawing the board, and the controller, which controls the state of the
   game. The model was tested by OUnit, but the view and the controller were
   manually tested. This is because the view and the controller required
   interacting with the GUI hence they had to be manually tested, whereas the
   model did not. We used a combination of black box testing and glass box
   testing to develop test cases. We mostly used black box testing, however we
   decided to implement the game in such a way that only between (and including)
   1-4 players could play the game at once so we had to account for that while
   developing test cases. This testing approach demonstrates the correctness of
   the system because we were thoroughly able to test all the functions in
   model.mli and we were able to determine whether the game was running as
   intended on the GUI.*)

open OUnit2
open Snake.View
open Snake.Controller
open Snake.Model

let model_t_testing_example_1 =
  let empty_board = Snake.Model.empty in
  let player_list = [ "Adam"; "Joe" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_1_all_jumps_added =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [
           (3, 4);
           (5, 6);
           (7, 8);
           (9, 10);
           (11, 12);
           (13, 14);
           (15, 16);
           (17, 18);
           (19, 20);
           (21, 22);
           (23, 24);
           (25, 26);
           (27, 28);
           (29, 30);
           (31, 32);
           (33, 34);
           (35, 36);
           (37, 38);
           (39, 40);
           (41, 42);
           (43, 44);
           (45, 46);
           (47, 48);
           (49, 50);
           (51, 52);
           (53, 54);
           (55, 56);
           (57, 58);
           (59, 60);
           (61, 62);
           (63, 64);
           (65, 66);
           (67, 68);
           (69, 70);
           (71, 72);
           (73, 74);
           (75, 76);
           (77, 78);
           (79, 80);
           (81, 82);
           (83, 84);
           (85, 86);
           (87, 88);
           (89, 90);
           (91, 92);
           (93, 94);
           (95, 96);
           (97, 98);
         ]
  in
  let player_list = [ "Adam"; "Joe" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_1_add =
  let empty_board = Snake.Model.empty in
  let player_list = [ "Adam"; "Joe"; "Aron" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_1_add_2 =
  let empty_board = Snake.Model.empty in
  let player_list = [ "Adam"; "Joe"; "Aron"; "Artha" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_1_new =
  let empty_board = Snake.Model.empty in
  let player_list = [ "Adam"; "Joe"; "Aron" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_1_1 =
  let empty_board = Snake.Model.empty |> Snake.Model.add_jumps [ (10, 30) ] in
  let player_list = [ "Adam"; "Joe" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_1_2 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps [ (10, 30); (5, 24); (3, 67); (29, 79); (45, 59) ]
  in
  let player_list = [ "Adam"; "Joe" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_2_1 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [
           (10, 20);
           (30, 40);
           (80, 90);
           (26, 59);
           (75, 80);
           (78, 81);
           (97, 99);
           (11, 31);
         ]
  in
  let player_list = [ "Victor"; "Reo" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_2_2 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [
           (10, 20);
           (30, 40);
           (80, 90);
           (26, 59);
           (75, 80);
           (78, 81);
           (97, 99);
           (11, 31);
           (5, 25);
           (45, 65);
           (71, 72);
         ]
  in
  let player_list = [ "Victor"; "Reo" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_2_3 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [
           (10, 20);
           (30, 40);
           (80, 90);
           (26, 59);
           (75, 80);
           (78, 81);
           (97, 99);
           (11, 31);
           (5, 24);
         ]
  in
  let player_list = [ "Victor"; "Reo" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_2 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [
           (10, 20); (30, 40); (80, 90); (26, 59); (75, 80); (78, 81); (97, 99);
         ]
  in
  let player_list = [ "Victor"; "Reo" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_2_add_1 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [
           (10, 20); (30, 40); (80, 90); (26, 59); (75, 80); (78, 81); (97, 99);
         ]
  in
  let player_list = [ "Victor"; "Reo"; "Aron" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_2_add_2 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [
           (10, 20); (30, 40); (80, 90); (26, 59); (75, 80); (78, 81); (97, 99);
         ]
  in
  let player_list = [ "Victor"; "Reo"; "Aron"; "Harris" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_3 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [ (1, 3); (5, 7); (19, 20); (45, 70); (89, 98); (90, 92) ]
  in
  let player_list = [ "Rit"; "Hector" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_3_new_player =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [ (1, 3); (5, 7); (19, 20); (45, 70); (89, 98); (90, 92) ]
  in
  let player_list = [ "Rit"; "Hector"; "Henrik" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_3_new_1 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [
           (1, 3);
           (5, 7);
           (19, 20);
           (45, 70);
           (89, 98);
           (90, 92);
           (11, 31);
           (6, 25);
           (46, 65);
           (71, 72);
         ]
  in
  let player_list = [ "Rit"; "Hector" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_3_new_2 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [ (1, 3); (5, 7); (19, 20); (45, 70); (89, 98); (90, 92); (11, 31) ]
  in
  let player_list = [ "Rit"; "Hector" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_3_new_3 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [ (5, 7); (19, 20); (45, 70); (89, 98); (90, 92); (11, 31); (9, 24) ]
  in
  let player_list = [ "Rit"; "Hector" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_4 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [ (20, 40); (60, 80); (80, 90); (91, 92); (95, 97); (98, 99) ]
  in
  let player_list = [ "Sam"; "Morelo"; "James" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_4_new_1 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [ (20, 40); (60, 80); (80, 90); (91, 92); (95, 97); (98, 99) ]
  in
  let player_list = [ "Sam"; "Morelo"; "James"; "Henry" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_5 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps [ (6, 10); (12, 13); (15, 17); (20, 22); (68, 80) ]
  in
  let player_list = [ "Fred"; "Sarr"; "Mathew"; "Mitchell" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_6 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [
           (3, 4);
           (5, 6);
           (7, 8);
           (9, 10);
           (11, 12);
           (13, 14);
           (15, 16);
           (17, 18);
           (19, 20);
           (21, 22);
           (23, 24);
           (25, 26);
           (27, 28);
           (29, 30);
           (31, 32);
           (33, 34);
           (35, 36);
           (37, 38);
           (39, 40);
           (41, 42);
           (43, 44);
           (45, 46);
           (47, 48);
           (49, 50);
           (51, 52);
           (53, 54);
           (55, 56);
           (57, 58);
           (59, 60);
           (61, 62);
           (63, 64);
           (65, 66);
           (67, 68);
           (69, 70);
           (71, 72);
           (73, 74);
           (75, 76);
           (77, 78);
           (79, 80);
           (81, 82);
           (83, 84);
           (85, 86);
           (87, 88);
           (89, 90);
           (91, 92);
         ]
  in
  let player_list = [ "John"; "Connaught"; "Sylvester" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_6_new_1 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [
           (3, 4);
           (5, 6);
           (7, 8);
           (9, 10);
           (11, 12);
           (13, 14);
           (15, 16);
           (17, 18);
           (19, 20);
           (21, 22);
           (23, 24);
           (25, 26);
           (27, 28);
           (29, 30);
           (31, 32);
           (33, 34);
           (35, 36);
           (37, 38);
           (39, 40);
           (41, 42);
           (43, 44);
           (45, 46);
           (47, 48);
           (49, 50);
           (51, 52);
           (53, 54);
           (55, 56);
           (57, 58);
           (59, 60);
           (61, 62);
           (63, 64);
           (65, 66);
           (67, 68);
           (69, 70);
           (71, 72);
           (73, 74);
           (75, 76);
           (77, 78);
           (79, 80);
           (81, 82);
           (83, 84);
           (85, 86);
           (87, 88);
           (89, 90);
           (91, 92);
         ]
  in
  let player_list = [ "John"; "Connaught"; "Sylvester"; "Ford" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_7 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [
           (5, 6);
           (9, 10);
           (13, 14);
           (17, 18);
           (21, 22);
           (25, 26);
           (29, 30);
           (33, 34);
           (37, 38);
           (41, 42);
           (45, 46);
           (49, 50);
           (51, 52);
           (53, 54);
           (55, 56);
           (57, 58);
           (59, 60);
           (61, 62);
           (63, 64);
           (65, 66);
           (67, 68);
           (69, 70);
           (71, 72);
           (73, 74);
           (75, 76);
           (77, 78);
           (79, 80);
           (81, 82);
           (83, 84);
           (85, 86);
           (87, 88);
           (89, 90);
           (91, 92);
         ]
  in
  let player_list = [ "Aryan"; "Hatay"; "Leo"; "Rath" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_7_jump_added =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [
           (3, 4);
           (5, 6);
           (7, 8);
           (9, 10);
           (11, 12);
           (13, 14);
           (15, 16);
           (17, 18);
           (19, 20);
           (21, 22);
           (23, 24);
           (25, 26);
           (27, 28);
           (29, 30);
           (31, 32);
           (33, 34);
           (35, 36);
           (37, 38);
           (39, 40);
           (41, 42);
           (43, 44);
           (45, 46);
           (47, 48);
           (49, 50);
           (51, 52);
           (53, 54);
           (55, 56);
           (57, 58);
           (59, 60);
           (61, 62);
           (63, 64);
           (65, 66);
           (67, 68);
           (69, 70);
           (71, 72);
           (73, 74);
           (75, 76);
           (77, 78);
           (79, 80);
           (81, 82);
           (83, 84);
           (85, 86);
           (87, 88);
           (89, 90);
           (91, 92);
           (93, 94);
           (95, 96);
           (97, 98);
         ]
  in
  let player_list = [ "Aryan"; "Hatay"; "Leo"; "Rath" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_8 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [
           (3, 92);
           (5, 90);
           (7, 88);
           (9, 86);
           (11, 85);
           (13, 84);
           (15, 83);
           (17, 82);
           (19, 81);
           (21, 80);
           (23, 78);
           (25, 76);
           (27, 74);
           (29, 72);
           (31, 70);
           (33, 69);
           (35, 68);
           (37, 64);
           (39, 79);
           (41, 62);
           (43, 60);
           (45, 61);
           (47, 59);
           (49, 57);
           (51, 58);
           (53, 56);
           (55, 54);
           (57, 52);
           (59, 50);
           (61, 48);
           (63, 46);
           (65, 44);
           (67, 42);
           (69, 40);
           (71, 38);
           (73, 36);
           (75, 34);
           (77, 32);
           (79, 30);
           (81, 28);
           (83, 26);
           (85, 24);
           (87, 22);
           (89, 20);
           (91, 18);
         ]
  in
  let player_list = [ "Liam"; "Oliver" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_9 =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps [ (5, 6); (9, 15); (16, 100); (83, 62); (90, 79) ]
  in
  let player_list = [ "Takuma"; "Nishimura" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_9_add_1_player =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps [ (5, 6); (9, 15); (16, 100); (83, 62); (90, 79) ]
  in
  let player_list = [ "Takuma"; "Nishimura"; "Yokoyama" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_9_add_2_player =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps [ (5, 6); (9, 15); (16, 100); (83, 62); (90, 79) ]
  in
  let player_list = [ "Takuma"; "Nishimura"; "Yokoyama"; "Ryoma" ] in
  Snake.Model.add_player_list empty_board player_list

let model_t_testing_example_9_add_multiple_jumps =
  let empty_board =
    Snake.Model.empty
    |> Snake.Model.add_jumps
         [ (5, 6); (9, 15); (16, 100); (50, 64); (57, 69); (83, 62); (89, 91) ]
  in
  let player_list = [ "Takuma"; "Nishimura" ] in
  Snake.Model.add_player_list empty_board player_list

let rec model_to_string_printer_aux lst acc =
  match lst with
  | [] -> ""
  | h :: t -> model_to_string_printer_aux t (acc ^ " " ^ h)

let model_to_string_printer lst = model_to_string_printer_aux lst ""

let add_player_list_test (name : string) (input : Snake.Model.t)
    (pinfo : string list) (expected_output : Snake.Model.t) : test =
  name >:: fun _ -> assert_equal expected_output (add_player_list input pinfo)

let take_turn_test (name : string) (input : Snake.Model.t)
    (expected_output : Snake.Model.t * string * string option) : test =
  name >:: fun _ -> assert_equal expected_output (take_turn input)

let empty_test (name : string) (expected_output : Snake.Model.t) : test =
  name >:: fun _ -> assert_equal expected_output empty

let add_player_test (name : string) (input : Snake.Model.t)
    (input2 : string list) (expected_output : Snake.Model.t) : test =
  name >:: fun _ -> assert_equal expected_output (add_player_list input input2)

let add_jumps_test (name : string) (input : (int * int) list)
    (input2 : Snake.Model.t) (expected_output : Snake.Model.t) : test =
  name >:: fun _ -> assert_equal expected_output (add_jumps input input2)

let rec model_string_of_list_printer_aux (input : (string * int) list) acc =
  match input with
  | [] -> acc
  | (k, v) :: t ->
      model_string_of_list_printer_aux t (acc ^ " " ^ k ^ " " ^ string_of_int v)

let model_string_of_list_printer input =
  model_string_of_list_printer_aux input ""

let get_player_locations_test (name : string) (input : Snake.Model.t)
    (expected_output : (string * int) list) : test =
  name >:: fun _ -> assert_equal expected_output (get_player_locations input)

let get_jump_test (name : string) (input : Snake.Model.t)
    (expected_output : (int * int) list) : test =
  name >:: fun _ ->
  assert_equal expected_output (get_jump_list input) ~printer:(fun x ->
      "{"
      ^ List.fold_left
          (fun acc (s, e) ->
            acc ^ string_of_int s ^ ":" ^ string_of_int e ^ ";")
          "" x
      ^ "}")

let take_turn_printer (input : string * string option) =
  match input with
  | s, Some v -> s ^ " " ^ v
  | s, None -> s ^ " None"

let take_turn_test (name : string) (input : Snake.Model.t)
    (expected_output : string * string option) : test =
  name >:: fun _ ->
  assert_equal expected_output
    (match take_turn input with
    | _, s, v -> (s, v))
    ~printer:take_turn_printer

let who_is_next_turn_printer (input : string option) =
  match input with
  | Some s -> s
  | None -> ""

let who_is_next_turn_test (name : string) (input : Snake.Model.t)
    (expected_output : string) : test =
  name >:: fun _ -> assert_equal expected_output (who_is_next_turn input)

let redraw_players_test (name : string) (input : (string * int) list)
    (input2 : (int * int) list) (expected_output : unit) =
  name >:: fun _ -> assert_equal expected_output (update_game input input2)

let draw_jumps_test (name : string) (input : (int * int) list)
    (expected_output : unit) =
  name >:: fun _ -> assert_equal expected_output (draw_jumps input)

let update_next_turn_id_test (name : string) (input : string)
    (expected_output : unit) =
  name >:: fun _ -> assert_equal expected_output (update_next_turn_id input)

let update_winner_id_test (name : string) (input : string)
    (expected_output : unit) =
  name >:: fun _ -> assert_equal expected_output (update_winner_id input)

let draw_empty_board_test (name : string) (expected_output : unit) =
  name >:: fun _ -> assert_equal expected_output (draw_empty_board ())

let model_tests =
  [
    add_player_list_test "Adding a new player to the game"
      model_t_testing_example_1 [ "Aron" ] model_t_testing_example_1_add;
    add_player_list_test "Adding multiple new\n  players to the game"
      model_t_testing_example_1 [ "Aron"; "Artha" ]
      model_t_testing_example_1_add_2;
    add_player_test "Adding a new player to the game" model_t_testing_example_2
      [ "Aron" ] model_t_testing_example_2_add_1;
    add_player_test "Adding multiple new players to the game"
      model_t_testing_example_2 [ "Aron"; "Harris" ]
      model_t_testing_example_2_add_2;
    add_player_test "Adding a new player to the two player game"
      model_t_testing_example_3 [ "Henrik" ]
      model_t_testing_example_3_new_player;
    add_player_test "Adding a player to the three player game"
      model_t_testing_example_4 [ "Henry" ] model_t_testing_example_4_new_1;
    add_player_test "Adding a player to a different three player game"
      model_t_testing_example_6 [ "Ford" ] model_t_testing_example_6_new_1;
    add_player_test "Adding a new player to a different two player game"
      model_t_testing_example_9 [ "Yokoyama" ]
      model_t_testing_example_9_add_1_player;
    add_player_test "Adding two new player to a different two player game"
      model_t_testing_example_9 [ "Yokoyama"; "Ryoma" ]
      model_t_testing_example_9_add_2_player;
    add_jumps_test "Adding one jump to the test"
      [ (11, 31) ]
      model_t_testing_example_2 model_t_testing_example_2_1;
    add_jumps_test "Adding multiple jumps to the test"
      [ (10, 30) ]
      model_t_testing_example_1 model_t_testing_example_1_1;
    add_jumps_test "Adding multiple jumps to the test"
      [ (11, 31); (5, 25); (45, 65); (71, 72) ]
      model_t_testing_example_2 model_t_testing_example_2_2;
    add_jumps_test "Adding two jumps to the test"
      [ (11, 31); (5, 24) ]
      model_t_testing_example_2 model_t_testing_example_2_3;
    add_jumps_test "Adding one jump to the test"
      [ (11, 31) ]
      model_t_testing_example_3 model_t_testing_example_3_new_2;
    add_jumps_test "Adding multiple jumps to the test"
      [ (11, 31); (6, 25); (46, 65); (71, 72) ]
      model_t_testing_example_3 model_t_testing_example_3_new_1;
    add_jumps_test "Adding two jumps to the test"
      [ (11, 31); (9, 24) ]
      model_t_testing_example_3 model_t_testing_example_3_new_3;
    add_jumps_test "Adding all possible jumps to example 7"
      [
        (3, 4);
        (7, 8);
        (11, 12);
        (15, 16);
        (19, 20);
        (23, 24);
        (27, 28);
        (31, 32);
        (35, 36);
        (39, 40);
        (43, 44);
        (47, 48);
        (93, 94);
        (95, 96);
        (97, 98);
      ]
      model_t_testing_example_7 model_t_testing_example_7_jump_added;
    add_jumps_test "Adding all possible jumps to the first example"
      [
        (3, 4);
        (5, 6);
        (7, 8);
        (9, 10);
        (11, 12);
        (13, 14);
        (15, 16);
        (17, 18);
        (19, 20);
        (21, 22);
        (23, 24);
        (25, 26);
        (27, 28);
        (29, 30);
        (31, 32);
        (33, 34);
        (35, 36);
        (37, 38);
        (39, 40);
        (41, 42);
        (43, 44);
        (45, 46);
        (47, 48);
        (49, 50);
        (51, 52);
        (53, 54);
        (55, 56);
        (57, 58);
        (59, 60);
        (61, 62);
        (63, 64);
        (65, 66);
        (67, 68);
        (69, 70);
        (71, 72);
        (73, 74);
        (75, 76);
        (77, 78);
        (79, 80);
        (81, 82);
        (83, 84);
        (85, 86);
        (87, 88);
        (89, 90);
        (91, 92);
        (93, 94);
        (95, 96);
        (97, 98);
      ]
      model_t_testing_example_1 model_t_testing_example_1_all_jumps_added;
    get_player_locations_test "Getting locations of player in example 1"
      model_t_testing_example_1
      [ ("Adam", 1); ("Joe", 1) ];
    get_player_locations_test "Getting locations of player in example 2"
      model_t_testing_example_2
      [ ("Victor", 1); ("Reo", 1) ];
    get_player_locations_test "Getting locations of player in example 3"
      model_t_testing_example_3
      [ ("Rit", 1); ("Hector", 1) ];
    get_player_locations_test "Getting locations of player in example 4"
      model_t_testing_example_4
      [ ("Sam", 1); ("Morelo", 1); ("James", 1) ];
    get_player_locations_test "Getting locations of player in example 5"
      model_t_testing_example_5
      [ ("Fred", 1); ("Sarr", 1); ("Mathew", 1); ("Mitchell", 1) ];
    get_player_locations_test "Getting locations of player in example 6"
      model_t_testing_example_6
      [ ("John", 1); ("Connaught", 1); ("Sylvester", 1) ];
    get_player_locations_test "Getting locations of player in example 7"
      model_t_testing_example_7
      [ ("Aryan", 1); ("Hatay", 1); ("Leo", 1); ("Rath", 1) ];
    get_player_locations_test "Getting locations of player in example 8"
      model_t_testing_example_8
      [ ("Liam", 1); ("Oliver", 1) ];
    get_player_locations_test "Getting locations of player in example 9"
      model_t_testing_example_9
      [ ("Takuma", 1); ("Nishimura", 1) ];
    take_turn_test "Advancing one turn in the first example"
      model_t_testing_example_1 ("Joe", None);
    take_turn_test "Advancing one turn in the second example"
      model_t_testing_example_2 ("Reo", None);
    take_turn_test "Advancing one turn in the third example"
      model_t_testing_example_3 ("Hector", None);
    take_turn_test "Advancing one turn in the fourth example"
      model_t_testing_example_4 ("Morelo", None);
    take_turn_test "Advancing one turn in the fifth example"
      model_t_testing_example_5 ("Sarr", None);
    take_turn_test "Advancing one turn in the sixth example"
      model_t_testing_example_6 ("Connaught", None);
    take_turn_test "Advancing one turn in the seventh example"
      model_t_testing_example_7 ("Hatay", None);
    take_turn_test "Advancing one turn in the eighth example"
      model_t_testing_example_8 ("Oliver", None);
    take_turn_test "Advancing one turn in the eighth example"
      model_t_testing_example_9 ("Nishimura", None);
    who_is_next_turn_test "Next turn in Example 1" model_t_testing_example_1
      "Adam";
    who_is_next_turn_test "Next turn in Example 2" model_t_testing_example_2
      "Victor";
    who_is_next_turn_test "Next turn in Example 3" model_t_testing_example_3
      "Rit";
    who_is_next_turn_test "Next turn in Example 4" model_t_testing_example_4
      "Sam";
    who_is_next_turn_test "Next turn in Example 5" model_t_testing_example_5
      "Fred";
    who_is_next_turn_test "Next turn in Example 6" model_t_testing_example_6
      "John";
    who_is_next_turn_test "Next turn in Example 7" model_t_testing_example_7
      "Aryan";
    who_is_next_turn_test "Next turn in Example 8" model_t_testing_example_8
      "Liam";
    who_is_next_turn_test "Next turn in Example 9" model_t_testing_example_9
      "Takuma";
    get_jump_test "Jumps in the first example" model_t_testing_example_1 [];
    get_jump_test "Jumps in the second example" model_t_testing_example_2
      [ (10, 20); (26, 59); (30, 40); (75, 80); (78, 81); (80, 90); (97, 99) ];
    get_jump_test "Jumps in the third example" model_t_testing_example_3
      [ (5, 7); (19, 20); (45, 70); (89, 98); (90, 92) ];
    get_jump_test "Jumps in the fourth example" model_t_testing_example_4
      [ (20, 40); (60, 80); (80, 90); (91, 92); (95, 97); (98, 99) ];
    get_jump_test "Jumps in the fifth example" model_t_testing_example_5
      [ (6, 10); (12, 13); (15, 17); (20, 22); (68, 80) ];
    get_jump_test "Jumps in the sixth example" model_t_testing_example_6
      [
        (3, 4);
        (5, 6);
        (7, 8);
        (9, 10);
        (11, 12);
        (13, 14);
        (15, 16);
        (17, 18);
        (19, 20);
        (21, 22);
        (23, 24);
        (25, 26);
        (27, 28);
        (29, 30);
        (31, 32);
        (33, 34);
        (35, 36);
        (37, 38);
        (39, 40);
        (41, 42);
        (43, 44);
        (45, 46);
        (47, 48);
        (49, 50);
        (51, 52);
        (53, 54);
        (55, 56);
        (57, 58);
        (59, 60);
        (61, 62);
        (63, 64);
        (65, 66);
        (67, 68);
        (69, 70);
        (71, 72);
        (73, 74);
        (75, 76);
        (77, 78);
        (79, 80);
        (81, 82);
        (83, 84);
        (85, 86);
        (87, 88);
        (89, 90);
        (91, 92);
      ];
    get_jump_test "Jumps in the seventh example" model_t_testing_example_7
      [
        (5, 6);
        (9, 10);
        (13, 14);
        (17, 18);
        (21, 22);
        (25, 26);
        (29, 30);
        (33, 34);
        (37, 38);
        (41, 42);
        (45, 46);
        (49, 50);
        (51, 52);
        (53, 54);
        (55, 56);
        (57, 58);
        (59, 60);
        (61, 62);
        (63, 64);
        (65, 66);
        (67, 68);
        (69, 70);
        (71, 72);
        (73, 74);
        (75, 76);
        (77, 78);
        (79, 80);
        (81, 82);
        (83, 84);
        (85, 86);
        (87, 88);
        (89, 90);
        (91, 92);
      ];
    get_jump_test "Jumps in the eighth example" model_t_testing_example_8
      [
        (3, 92);
        (5, 90);
        (7, 88);
        (9, 86);
        (11, 85);
        (13, 84);
        (15, 83);
        (17, 82);
        (19, 81);
        (21, 80);
        (23, 78);
        (25, 76);
        (27, 74);
        (29, 72);
        (31, 70);
        (33, 69);
        (35, 68);
        (37, 64);
        (39, 79);
        (41, 62);
        (43, 60);
        (45, 61);
        (47, 59);
        (49, 57);
        (51, 58);
        (53, 56);
        (55, 54);
        (57, 52);
        (59, 50);
        (61, 48);
        (63, 46);
        (65, 44);
        (67, 42);
        (69, 40);
        (71, 38);
        (73, 36);
        (75, 34);
        (77, 32);
        (79, 30);
        (81, 28);
        (83, 26);
        (85, 24);
        (87, 22);
        (89, 20);
        (91, 18);
      ];
    get_jump_test "Jumps in the ninth example" model_t_testing_example_9
      [ (5, 6); (9, 15); (16, 100); (83, 62); (90, 79) ];
  ]

let tests = "test suite for the final project" >::: List.flatten [ model_tests ]
let _ = run_test_tt_main tests
