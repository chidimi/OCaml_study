#use "../Data/person.ml"

(* person_t list 型のデータの例 *) 
let lst = [person1; person2; person3] 
 


let count 


(* テスト *) 
let test1 = count_ketsueki [] "A" = 0 
let test2 = count_ketsueki lst "A" = 1 
let test3 = count_ketsueki lst "O" = 1 
let test4 = count_ketsueki lst "B" = 1 
let test5 = count_ketsueki lst "AB" = 0 