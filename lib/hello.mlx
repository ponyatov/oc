print_string "Hello world!\n";;

utop

#require "core";;
open Core;;

# 3 + 4;;
- : int = 7

# 8 / 3;;
- : int = 2

# 3.5 +. 6.;;
- : float = 9.5

# 30_000_000 / 300_000;;
- : int = 100

# sqrt 9.;;
- : float = 3.

# let x = 3 + 4;;
val x : int = 7

# let y = x + x;;
val y : int = 14

# let square x = x * x ;;
val square : int -> int = <fun>

# square 2;;
- : int = 4
# square (square 2);;
- : int = 16

# let ratio x y =
  Float.of_int x /. Float.of_int y
  ;;
val ratio : int -> int -> oat = <fun>
# ratio 4 7;;
- : float = 0.571428571429

1,2,3;;
- : int * int * int = (1, 2, 3)

let (x,y,z) = (1,2,3);;
val x : int = 1
val y : int = 2
val z : int = 3

# let languages = ["OCaml";"Perl";"C"];;
val languages : string list = ["OCaml"; "Perl"; "C"]

1::2::[];;

[1,2,3];;
- : (int * int * int) list = [(1, 2, 3)]
[1;2;3];;
- : int list = [1; 2; 3]

let first lst =
  match lst with
  | head::tail -> [head]
  | [] -> []
;;

first [1;2;3];;
- : int list = [1]
first [];;
- : 'a list = []

type opt<'a> =
  | Some('a)
  | None
;;

List.map ((+) 1) [1;2;3];;

let (+!) (x1,y1) (x2,y2) = (x1+x2,y1+y2);;
(1,2) +! (3,4) ;;

let sum ?(b=1) a = a + b;;
