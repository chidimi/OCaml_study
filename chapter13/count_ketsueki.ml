#use "../Data/person.ml"

(* person_t list 型のデータの例 *) 
let lst = [person1; person2; person3] 
 
(* person1, person2, person3 の定義については ex08_3.ml を参照 *) 
let rec count_ketsueki person_lst ketsueki0 = match person_lst with
    [] -> 0
  | {name = n; shincho = s; taiju = t; tsuki = ts; hi = h; 
     ketsueki = k} :: rest -> if k = ketsueki0 then 1 + count_ketsueki rest ketsueki0
                                               else count_ketsueki rest ketsueki0

(* テスト *) 
let test1 = count_ketsueki [] "A" = 0 
let test2 = count_ketsueki lst "A" = 1 
let test3 = count_ketsueki lst "O" = 1 
let test4 = count_ketsueki lst "B" = 1 
let test5 = count_ketsueki lst "AB" = 0 