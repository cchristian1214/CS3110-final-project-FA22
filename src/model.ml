(*NOTE THAT THIS BOARD IS 0 INDEXED BUT THE OUTPUT NEEDS TO BE 1 INDEXED*)

module IntMap = Map.Make (Int)

type player_info = {
  id : string;
  loc : int;
}

(*tiles just represent possible jumps*)
type tile = int option
type turn_queue = player_info BatchedQueue.t

type t = {
  board : tile IntMap.t;
  turn_queue : turn_queue;
}

let rec empty_board_aux acc_board = function
  | 0 -> acc_board
  | n -> empty_board_aux (IntMap.add n None acc_board) (n - 1)

(*int is the length of the board*)
let rec empty_board = empty_board_aux IntMap.empty
let empty = { board = empty_board 100; turn_queue = BatchedQueue.empty }

let add_player g s =
  let new_start_tile = None in
  let new_board = IntMap.add 0 new_start_tile g.board in
  let new_turn_list = BatchedQueue.enq { id = s; loc = 0 } g.turn_queue in
  { board = new_board; turn_queue = new_turn_list }

let rec add_player_list acc_model lst =
  match lst with
  | [] -> acc_model
  | h :: t -> add_player_list (add_player acc_model h) t

let rec add_jumps_board (jlist : (int * int) list) (acc_board : tile IntMap.t) =
  match jlist with
  | [] -> acc_board
  | (a, b) :: t ->
      let new_tile = Some (b - 1) in
      let new_board = IntMap.add (a - 1) new_tile acc_board in
      add_jumps_board t new_board

let rec add_jumps jlist g =
  { board = add_jumps_board jlist g.board; turn_queue = g.turn_queue }

let get_jump_list g =
  IntMap.filter_map (fun i jump_opt -> jump_opt) g.board
  |> IntMap.bindings
  |> List.map (fun (k, v) -> (k + 1, v + 1))

let get_player_locations g =
  List.map
    (fun { id; loc } -> (id, loc + 1))
    (BatchedQueue.to_list g.turn_queue)

let dice () =
  Random.self_init ();
  Random.int 6 + 1

let who_is_next_turn g =
  let { id; loc } = BatchedQueue.front g.turn_queue in
  id

let take_turn g =
  let player = BatchedQueue.front g.turn_queue in
  let roll = dice () in
  print_endline ("--roll is a " ^ string_of_int roll ^ "--");
  let target = min 99 (roll + player.loc) in
  let new_loc =
    match IntMap.find target g.board with
    | None -> target
    | Some v -> v
  in
  let new_player_info = { id = player.id; loc = new_loc } in
  let new_turn_queue =
    g.turn_queue |> BatchedQueue.deq |> BatchedQueue.enq new_player_info
  in
  let new_game = { board = g.board; turn_queue = new_turn_queue } in
  let next_turn = who_is_next_turn new_game in
  let possible_winner =
    match new_loc with
    | 99 -> Some player.id
    | _ -> None
  in
  (new_game, next_turn, possible_winner)

let take_turn_loc_list = ()
