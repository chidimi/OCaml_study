(* あらかじめ sect08_6/hyouka.ml を読み込んでおく必要あり *) 
#use "../Data/hyouka.ml" 
 
(* 学生のデータの例 *) 
let gakusei1 = {namae="nakamura"; tensuu=90; seiseki="A"} 
let gakusei2 = {namae="miyahara"; tensuu=80; seiseki="A"} 
let gakusei3 = {namae="sato"; tensuu=75; seiseki="B"} 
let gakusei4 = {namae="idehara"; tensuu=70; seiseki="B"} 
let gakusei5 = {namae="tsubata"; tensuu=65; seiseki="C"} 
let gakusei6 = {namae="asai"; tensuu=60; seiseki="C"} 
 
(* 学生のリストの例 *) 
let lst1 = [] 
let lst2 = [gakusei2] 
let lst3 = [gakusei3; gakusei4] 
let lst4 = [gakusei4; gakusei3] 
let lst5 = [gakusei4; gakusei1; gakusei6; gakusei5; gakusei2; gakusei3] 

(* gakusei_t 型のデータを受け取ったら、それを tensuu フィールドの順に整列したリストを返す *)
(* gakusei_t -> gakusei_t *)
let rec gakusei_insert lst gakusei0 = match lst with
    [] -> [gakusei0]
  | {namae = n; tensuu = t; seiseki = s} as gakusei1 :: rest -> match gakusei0 with {namae = n0; tensuu = t0; seiseki = s0}
              -> if t < t0 then gakusei1 :: gakusei_insert rest gakusei0
                           else gakusei0 :: lst

(* テスト *) 
let test1 = gakusei_insert [] gakusei2 = [gakusei2] 
let test2 = gakusei_insert [gakusei4] gakusei3 = [gakusei4; gakusei3] 
let test3 = gakusei_insert [gakusei3] gakusei4 = [gakusei4; gakusei3] 
let test4 = gakusei_insert [gakusei6; gakusei5; gakusei3; gakusei2; gakusei1] 
			   gakusei4 
      = [gakusei6; gakusei5; gakusei4; gakusei3; gakusei2; gakusei1] 
      
let rec gakusei_ins_sort lst = match lst with
    [] -> []
  | {namae = n; tensuu = t; seiseki = s} as first :: rest -> gakusei_insert (gakusei_ins_sort rest) first 
 
(* テスト *) 
let test5 = gakusei_ins_sort lst1 = [] 
let test6 = gakusei_ins_sort lst2 = [gakusei2] 
let test7 = gakusei_ins_sort lst3 = [gakusei4; gakusei3] 
let test8 = gakusei_ins_sort lst4 = [gakusei4; gakusei3] 
let test9 = gakusei_ins_sort lst5 
	    = [gakusei6; gakusei5; gakusei4; gakusei3; gakusei2; gakusei1] 