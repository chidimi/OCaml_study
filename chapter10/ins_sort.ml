#use "insert.ml"

(* 整数のリストを受け取ったら、それを昇順に整列したリストを返す *)
(* int list -> int list *)
let rec ins_sort lst = match lst with
    [] -> []
  | first :: rest -> insert first (ins_sort rest)

let test1 = ins_sort [] = []
let test2 = ins_sort [1; 2; 3] = [1; 2; 3]
let test3 = ins_sort [3; 2; 8 ;1] = [1; 2; 3; 8] 