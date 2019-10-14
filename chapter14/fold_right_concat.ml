

let fold_concat lst = let concat first rest_result = first ^ rest_result in List.fold_right concat lst ""

(* test *)
let test1 = fold_concat [] = ""
let test2 = fold_concat ["1"] = "1"
let test3 = fold_concat ["1"; "2"; "3"] = "123"