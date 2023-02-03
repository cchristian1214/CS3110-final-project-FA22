(** Controller for the main executable program of Snakes and Ladders. *)

val main_loop : unit -> unit
(**[main_loop] runs the main loop of the interface. *)

val init_game : unit -> Model.t
(**[init_game] initializes a new game. That is, it begins the game by opening
   the starting graphical interface state. *)

val add_player_list : Model.t -> string list -> Model.t
(**[add_player model list] adds players in [lst] to the game. *)

val take_turn_inf : Model.t -> unit
(** [take_turn g] continually prompts user to take a turn and then advances one
    step until the game is over*)
