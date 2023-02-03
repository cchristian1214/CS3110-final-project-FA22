let jump_list =
  [
    (4, 14);
    (9, 31);
    (17, 7);
    (20, 38);
    (28, 84);
    (40, 59);
    (51, 67);
    (63, 81);
    (64, 60);
    (89, 26);
    (95, 75);
    (99, 78);
  ]

let rec prompt_player_list_aux acc_lst =
  if List.length acc_lst = 4 then begin
    print_endline "starting 4 player game!";
    acc_lst
  end
  else begin
    print_endline
      "enter up to 4 player names one at a time (separated by the \n\
      \    enter key) or enter \"\" to start the game";
    match input_line stdin with
    | "" ->
        print_endline
          ("starting "
          ^ (acc_lst |> List.length |> string_of_int)
          ^ " player game!");
        acc_lst
    | s -> prompt_player_list_aux (s :: acc_lst)
  end

let prompt_player_list () = List.rev (prompt_player_list_aux [])

let add_player_list model lst =
  let new_game = Model.add_player_list model lst in
  let player_info_list = Model.get_player_locations new_game in
  let jlist = Model.get_jump_list new_game in
  View.update_game player_info_list jlist;
  new_game

let init_game () =
  let game_without_players = Model.empty |> Model.add_jumps jump_list in
  let player_list = prompt_player_list () in
  let game = Model.add_player_list game_without_players player_list in
  let player_info_list = Model.get_player_locations game in
  View.update_game player_info_list jump_list;
  let who_is_next_turn = Model.who_is_next_turn game in
  View.update_next_turn_id who_is_next_turn;
  game

let rec take_turn_inf g =
  print_endline "type: \"\" to take a turn";
  match input_line stdin with
  | "" -> (
      let new_game, next_turn, winner_opt = Model.take_turn g in
      let new_player_list = Model.get_player_locations new_game in
      let jlist = Model.get_jump_list new_game in
      View.update_game new_player_list jlist;
      View.update_next_turn_id next_turn;
      match winner_opt with
      | None -> take_turn_inf new_game
      | Some winner -> View.update_winner_id winner)
  | _ -> take_turn_inf g

(*todo need to actually prompt the user to take a turn*)
let main_loop () =
  let initial_game = init_game () in
  take_turn_inf initial_game