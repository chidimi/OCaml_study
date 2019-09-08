(* 照準に並んでいる整数のリスト lst と整数 n を受け取ったら、lst を前から順に見ていき、昇順となる位置に n を挿入したリストを返す *) 
(* int -> int list -> int list *)
let rec insert n lst = match lst with
    [] -> [n]
  | first :: rest -> if first < n then first :: insert n rest
                                  else n :: lst

let test1 = insert 1 [] = [1]
let test2 = insert 2 [1] = [1; 2]
let test3 = insert 5 [1; 4; 7; 9] = [1; 4; 5; 7; 9]

(*
first 1
rest [4; 7; 9]

n = 5
*)