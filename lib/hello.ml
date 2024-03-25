print_string "Hello world!\n";;

(* utop *)

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

