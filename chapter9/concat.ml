(* 目的: 文字列リストを受け取ったら、要素を前から順にくっつけた文字列を返す *)
(* string list -> string list *)
let rec concat lst = match lst with
    [] -> ""
  | first :: rest -> first ^ concat rest


(* test *)
let test1 = concat [] = ""
let test2 = concat ["1"] = "1"
let test3 = concat ["1"; "2"; "3"] = "123"