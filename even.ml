(* 目的 : 整数のリストを受け取ったら、その中の偶数の要素のみを含むリストを返す *)
let rec even lst = match lst with
    [] -> []
  | first :: rest -> if first mod 2 == 0 then first :: even rest
                                         else even rest

(* test *)
let test1 = even [] = []
let test2 = even [1] = []
let test3 = even [2] = [2]
let test4 = even [1; 2; 3; 4; 5] = [2; 4]

let rec concat lst = match lst with
    [] -> ""
  | first :: rest -> first ^ concat rest

let test5 = concat [] = ""
let test6 = concat ["秋"] = "秋"
let test7 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"

