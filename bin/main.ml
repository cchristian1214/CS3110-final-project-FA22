open Graphics
open Snake.Controller

let run () =
  open_graph " 600x600";
  set_window_title "Snakes and Ladders";
  main_loop ();
  ignore (read_key ())

let _ = run ()
