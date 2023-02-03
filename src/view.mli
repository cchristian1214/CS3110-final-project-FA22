(** The view responsible for updating the graphical interface of a current game. *)

val update_game : (string * int) list -> (int * int) list -> unit
(**[redraw_players plist] redraws the current graphical interface to update the
   current representation of the position of the players. *)

val draw_jumps : (int * int) list -> unit
(**[draw_jumps jlist] draws the visual representation of "Jumps" onto the
   graphical interface. In this game, we represent "Snake" with an "S" on the
   game board, and "Ladders" as an L on the game board. So, when a player
   reaches an S, they jump backwards to another S, and when a player reaches an
   L they will jump forward to another L. Requires: The two ints composing a
   "Jump" cannot be equal. *)

val update_next_turn_id : string -> unit
(**[update_next_turn_id id] takes in a player identifier [id] and uses it to
   update the graphical signal of the next turn. For example, if [id] is the
   string "Carson" then applying it to this function will print to the graphical
   interface "Carson Turn". *)

val update_winner_id : string -> unit
(**[update_winner_id id] updates the graphic interface to display the winner
   [id], in the case that player [id] has won the current game. *)

val draw_empty_board : unit -> unit
(** [draw_empty_board] draws the full 600x600 game board. *)
