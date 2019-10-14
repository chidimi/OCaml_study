type gakusei_t = { 
  namae : string;       (* 名前 *) 
  tensuu : int;         (* 点数 *) 
  seiseki : string;     (* 成績 *) 
} 


let lst1 = [] 
let lst2 = [{namae = "asai"; tensuu = 70; seiseki = "B"}] 
let lst3 = [{namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}] 
let lst4 = [{namae = "yoshida"; tensuu = 80; seiseki = "A"}; 
            {namae = "asai"; tensuu = 70; seiseki = "B"}; 
            {namae = "kaneko"; tensuu = 85; seiseki = "A"}] 


let rec is_A gakusei = match gakusei with {namae=n; tensuu=t; seiseki=s} -> if s = "A" then true else false
let fl_count_A lst = List.length (List.filter is_A lst)


let test1 = fl_count_A lst1 = 0
let test2 = fl_count_A lst2 = 0
let test3 = fl_count_A lst3 = 1
let test4 = fl_count_A lst4 = 2
