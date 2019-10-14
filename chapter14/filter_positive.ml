let rec filter_positive lst = match lst with
  [] -> []
 | first :: rest -> if first > 0 then first :: filter_positive rest
                                 else filter_positive rest


let test1 = filter_positive [] = []

let test2 = filter_positive [1] = [1]


let test3 = filter_positive [-1] = []

let test4 = filter_positive [-1; 0; 2; -4; 5] = [2; 5]

let rec filter p lst = match lst with
    [] -> []
  | first :: rest -> if p first then first :: filter p rest
                                else filter p rest


