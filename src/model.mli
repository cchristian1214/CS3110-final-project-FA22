(** The model responsible for tracking and udpating the state of a current game. *)

type t
(**The abstract type representing a game board. *)

val empty : t
(**[empty] is the empty game. *)

val add_player_list : t -> string list -> t
(**[add_player lst] adds players to the representation of the game. Players are
   added to the first tile, the head of the list is added to the front of the
   turn list and the end of the list is at the end*)

val add_jumps : (int * int) list -> t -> t
(**[add_jumps jlist g] places jump points from x to y in the game state on the
   game representation. For example, if a jump point is from tile 19 to tile 3,
   a player at tile 19 will jump to tile 3. *)

val get_player_locations : t -> (string * int) list
(**[get_player_locations g ploclist] returns an association list containing a
   list of players bound to the tile they are currently located at in the game
   state. For example, if player two is at tile 54, and player 1 is at 34, the
   list returned will be [("1", 34), ("2", 54)]. *)

val get_jump_list : t -> (int * int) list
(**[add_jumps g] returns the jump points from x to y in the game state. For
   example, if a jump point is from tile 19 to tile 3, a (19,3) is added to the
   list. *)

val take_turn : t -> t * string * string option
(**[take_turn g] advances one turn in the game state. *)

val who_is_next_turn : t -> string
(**[who_is_next_turn g] returns which player's turn comes next in the game
   state. *)
