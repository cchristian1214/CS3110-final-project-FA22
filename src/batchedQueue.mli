(**An implementation of the Batched Queue data structure. *)

type 'a t
(** The abstract type of batched queues.*)

val empty : 'a t
(**[empty] represents the empty batched queue.*)

val is_empty : 'a t -> bool
(**[is_empty bq] is true if [bq] is the empty batched queue. *)

val enq : 'a -> 'a t -> 'a t
(**[enq x bq] adds [x] to the batched queue [bq]. *)

val front : 'a t -> 'a
(**[front bq] returns the element at the front of batched queue [bq]. *)

val deq : 'a t -> 'a t
(**[deq bq] dequeues the batched queue [bq]. *)

val size : 'a t -> int
(**[size bq] returns the size of the queue [bq]. *)

val to_list : 'a t -> 'a list
(**[to_list bq] returns a list representation of the batched queue [bq].*)