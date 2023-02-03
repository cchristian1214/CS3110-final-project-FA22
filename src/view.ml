open Graphics

(** [make_rect x y] creates a rectangle of size 60x60 with lower-left
    coordinates [x], [y]. *)
let make_rect (x : int) (y : int) =
  draw_rect x y 60 60;
  fill_rect x y 60 60

(** [draw_row i] creates row [i] on the game board. Requires: [i] is
    non-negative. *)
let draw_row (i : int) =
  for j = 0 to 9 do
    if j * 60 mod 120 = 0 && i mod 2 = 0 then set_color green
    else if j * 60 mod 120 <> 0 && i mod 2 <> 0 then set_color green
    else set_color blue;
    make_rect (j * 60) (i * 60)
  done

(** [number_row i] numbers the tiles appropriately on the board for row [i].
    Requires: [i] is non-negative. *)
let number_row (i : int) =
  for j = 0 to 9 do
    if j * 60 mod 120 = 0 then set_color black else set_color white;
    moveto ((j * 60) + 45) ((i * 60) + 45);
    draw_string (string_of_int ((i * 10) + (j + 1)))
  done

(** [number_row i] numbers the tiles in reverse order on the board for row [i].
    Requires: [i] is non-negative. *)
let number_row_rev (i : int) =
  for j = 0 to 9 do
    if (600 - (j * 60)) mod 120 = 0 then set_color black else set_color white;
    moveto (581 - (j * 60)) ((i * 60) + 45);
    draw_string (string_of_int ((i * 10) + (j + 1)))
  done

(** [draw_tile_nums] draws the tile numbers onto the game board. *)
let draw_tile_nums () =
  for i = 0 to 9 do
    if i mod 2 = 0 then number_row i else number_row_rev i
  done

(**[draw_one_player c1 r1] draws a single player tile onto the game board at
   position [c1], [r1]. This player will be red. Requires: [c1, r1] >= 0 and <
   10.*)
let draw_one_player (c1 : int) (r1 : int) =
  set_color red;
  draw_circle ((c1 * 60) + 30) ((r1 * 60) + 30) 5;
  fill_circle ((c1 * 60) + 30) ((r1 * 60) + 30) 5

(** [draw_two_players c1 r1 c2 r2] draws two new players on the tile
    corresponding the position [c1], [r1] and [c2], [r2] on the board. The first
    player is represented by a red circle and the second player is represented
    by a white circle. Requires: [c1, r1, c2, r2] >= 0 and < 10. *)
let draw_two_players (c1 : int) (r1 : int) (c2 : int) (r2 : int) =
  set_color red;
  draw_circle ((c1 * 60) + 30) ((r1 * 60) + 20) 5;
  fill_circle ((c1 * 60) + 30) ((r1 * 60) + 20) 5;
  set_color white;
  draw_circle ((c2 * 60) + 30) ((r2 * 60) + 40) 5;
  fill_circle ((c2 * 60) + 30) ((r2 * 60) + 40) 5

(** [draw_three_players c1 r1 c2 r2 c3 r3] draws three new players on the tile
    corresponding the position [c1], [r1] and [c2], [r2] and [c3], [r3] on the
    board. The first player is represented by a red circle and the second player
    is represented by a white circle, and the third a black circle. Requires:
    [c1, r1, c2, r2] >= 0 and < 10. *)
let draw_three_players (c1 : int) (r1 : int) (c2 : int) (r2 : int) (c3 : int)
    (r3 : int) =
  set_color red;
  draw_circle ((c1 * 60) + 40) ((r1 * 60) + 20) 5;
  fill_circle ((c1 * 60) + 40) ((r1 * 60) + 20) 5;
  set_color white;
  draw_circle ((c2 * 60) + 40) ((r2 * 60) + 40) 5;
  fill_circle ((c2 * 60) + 40) ((r2 * 60) + 40) 5;
  set_color black;
  draw_circle ((c3 * 60) + 20) ((r3 * 60) + 30) 5;
  fill_circle ((c3 * 60) + 20) ((r3 * 60) + 30) 5

(** [draw_four_players c1 r1 c2 r2 c3 r3 c4 r4] draws four new players on the
    tile corresponding the position [c1], [r1] and [c2], [r2] and [c3], [r3] and
    [c4], [r4] on the board. The first player is represented by a red circle and
    the second player is represented by a white circle, and the third a black
    circle and the fourth a magenta circle. Requires: [c1, r1, c2, r2] >= 0 and
    < 10. *)
let draw_four_players (c1 : int) (r1 : int) (c2 : int) (r2 : int) (c3 : int)
    (r3 : int) (c4 : int) (r4 : int) =
  set_color red;
  draw_circle ((c1 * 60) + 40) ((r1 * 60) + 20) 5;
  fill_circle ((c1 * 60) + 40) ((r1 * 60) + 20) 5;
  set_color white;
  draw_circle ((c2 * 60) + 40) ((r2 * 60) + 40) 5;
  fill_circle ((c2 * 60) + 40) ((r2 * 60) + 40) 5;
  set_color black;
  draw_circle ((c3 * 60) + 20) ((r3 * 60) + 20) 5;
  fill_circle ((c3 * 60) + 20) ((r3 * 60) + 20) 5;
  set_color magenta;
  draw_circle ((c4 * 60) + 20) ((r4 * 60) + 40) 5;
  fill_circle ((c4 * 60) + 20) ((r4 * 60) + 40) 5

(**[draw_single_jump id1 id2 start_point end_point] *)
let draw_single_jump (id1 : string) (id2 : string) (start_point : int)
    (end_point : int) =
  let row_start = (start_point - 1) / 10 in
  let row_end = (end_point - 1) / 10 in
  let col_start =
    if row_start mod 2 = 0 then (start_point - 1) mod 10
    else
      10
      -
      let modten = start_point mod 10 in
      if modten = 0 then 10 else modten
  in
  let col_end =
    if row_end mod 2 = 0 then (end_point - 1) mod 10
    else
      10
      -
      let modten = end_point mod 10 in
      if modten = 0 then 10 else modten
  in
  set_color magenta;
  set_text_size 10;
  moveto ((col_start * 60) + 25) ((row_start * 60) + 25);
  draw_string id1;
  moveto ((col_end * 60) + 25) ((row_end * 60) + 25);
  draw_string id2

(**[draw_jumps_aux lcount jcount lst] adds the representation of "jumps" to the
   game board. It uses [lcount] and [jcount] as accumulators to track the number
   of "ladders" and "snakes" that have been added. Reqiures: [lst] must contain
   information on jumps that do not contain cycles nor have double jumps. *)
let rec draw_jumps_aux (lcount : int) (jcount : int) (lst : (int * int) list) =
  match lst with
  | [] -> ()
  | (s, e) :: t ->
      if e > s then
        let new_lcount = lcount + 1 in
        let () =
          draw_single_jump
            ("L" ^ string_of_int new_lcount)
            ("L" ^ string_of_int new_lcount)
            s e
        in
        draw_jumps_aux new_lcount jcount t
      else
        let new_jcount = jcount + 1 in
        let () =
          draw_single_jump
            ("S" ^ string_of_int new_jcount)
            ("S" ^ string_of_int new_jcount)
            s e
        in
        draw_jumps_aux lcount new_jcount t

let draw_jumps (lst : (int * int) list) = draw_jumps_aux 0 0 lst

let draw_empty_board () =
  for z = 0 to 9 do
    draw_row z
  done;
  draw_tile_nums ()

(**[get_row_from_tile t] determines the row, numbered 0 to 9 inclusive, from the
   given tile [t]. Requires: [t] > 0 and [t] <= 100. *)
let get_row_from_tile (t : int) = (t - 1) / 10

(**[get_col_from_tile t] determines the column, numbered 0 to 9 inclusive, from
   the given tile [t]. Requires: [t] > 0 and [t] <= 100. *)
let get_col_from_tile (t : int) =
  let row = get_row_from_tile t in
  if row mod 2 = 0 then (t - 1) mod 10
  else
    10
    -
    let modten = t mod 10 in
    if modten = 0 then 10 else modten

let rec sort_player_list (plist : (string * int) list) =
  List.sort (fun (n1, t1) (n2, t2) -> Stdlib.compare n1 n2) plist

let update_game (plist : (string * int) list) (jump_list : (int * int) list) =
  match sort_player_list plist with
  | [ (id, tile) ] ->
      clear_graph ();
      draw_empty_board ();
      draw_jumps jump_list;
      let row = get_row_from_tile tile in
      let col = get_col_from_tile tile in
      draw_one_player col row
  | [ (id1, tile1); (id2, tile2) ] ->
      clear_graph ();
      draw_empty_board ();
      draw_jumps jump_list;
      let row1 = get_row_from_tile tile1 in
      let row2 = get_row_from_tile tile2 in
      let col1 = get_col_from_tile tile1 in
      let col2 = get_col_from_tile tile2 in
      draw_two_players col1 row1 col2 row2
  | [ (id1, tile1); (id2, tile2); (id3, tile3) ] ->
      clear_graph ();
      draw_empty_board ();
      draw_jumps jump_list;
      let row1 = get_row_from_tile tile1 in
      let row2 = get_row_from_tile tile2 in
      let row3 = get_row_from_tile tile3 in
      let col1 = get_col_from_tile tile1 in
      let col2 = get_col_from_tile tile2 in
      let col3 = get_col_from_tile tile3 in
      draw_three_players col1 row1 col2 row2 col3 row3
  | [ (id1, tile1); (id2, tile2); (id3, tile3); (id4, tile4) ] ->
      clear_graph ();
      draw_empty_board ();
      draw_jumps jump_list;
      let row1 = get_row_from_tile tile1 in
      let row2 = get_row_from_tile tile2 in
      let row3 = get_row_from_tile tile3 in
      let row4 = get_row_from_tile tile4 in
      let col1 = get_col_from_tile tile1 in
      let col2 = get_col_from_tile tile2 in
      let col3 = get_col_from_tile tile3 in
      let col4 = get_col_from_tile tile4 in
      draw_four_players col1 row1 col2 row2 col3 row3 col4 row4
  | _ -> failwith "Error: Unsupported Number of Players!"

let update_next_turn_id (id : string) =
  set_color white;
  let size = text_size (id ^ " Turn") in
  let x_coordinate = size |> fst |> fun x -> 595 - x in
  let y_coordinate = 5 in
  moveto x_coordinate y_coordinate;
  set_text_size 10;
  draw_string (id ^ " Turn")

let update_winner_id (id : string) =
  clear_graph ();
  set_color black;
  moveto 300 300;
  set_text_size 200;
  let size_of_msg = text_size ("PLAYER " ^ id ^ " WINS") in
  let x_coordinate = size_of_msg |> fst |> fun x -> 300 - (x / 2) in
  let y_coordinate = size_of_msg |> snd |> fun x -> 300 - (x / 2) in
  moveto x_coordinate y_coordinate;
  draw_string ("PLAYER " ^ id ^ " WINS")