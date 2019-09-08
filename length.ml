(* 目的 : 整数のリストを受け取ったら、そのリストの長さを返す関数 *)
(* lenght : int list -> int *)
let rec length lst = match lst with
    [] -> 0
  | first :: rest -> length rest + 1

(* test *)
let test1 = length [] = 0
let test2 = length [1] = 1
let test3 = length [1; 2; 3; 4; 5] = 5