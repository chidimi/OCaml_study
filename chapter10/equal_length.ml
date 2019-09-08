(* リストを２つ受け取り、その長さが同じか判定する *)
(* 'a list -> 'a list *)
let rec equal_length lst1 lst2 = match (lst1, lst2) with
    ([], []) -> true
  | ([], first2 :: rest2) -> false
  | (first1 :: rest1, []) -> false
  | (first1 :: rest1, first2 :: rest2) -> equal_length rest1 rest2

let test1 = equal_length [] [] = true
let test2 = equal_length [1] [] = false
let test3 = equal_length [] [1] = false
let test4 = equal_length [1; 2; 3] [1; 2; 3] = true
let test5 = equal_length [1; 2; 3; 4] [1; 2; 3] = false