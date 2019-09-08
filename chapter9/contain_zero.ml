(* int list は
    - [] 空リスト、あるいは
    - first :: rest 最初の要素が first で　残りの要素が rest という形 *)

(* 目的: 受け取ったリスト lst に 0 が含まれているか調べる *)
(* contain_zero : int list -> bool *)
let rec contain_zero lst = match lst with
    [] -> false
  | first :: rest -> if first = 0 then true
                                  else contain_zero rest


(* test *)
let test1 = contain_zero [] = false
let test2 = contain_zero [0; 1] = true
let test3 = contain_zero [1; 0] = true
let test4 = contain_zero [1; 2] = false
let test5 = contain_zero [1; 2; 3; 0; 4; 5; 6] = true
let test6 = contain_zero [1; 2; 3; 4; 5; 6] = false