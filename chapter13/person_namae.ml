#use "../Data/person.ml"

let lst = [person1; person2; person3]

let take_name person = match person with
  {name=n; shincho=s; taiju=t; tsuki=ts; hi=h; ketsueki=k} -> n

(* テスト *) 
let test1 = take_name person1 = "浅井" 
let test2 = take_name person2 = "宮原" 
let test3 = take_name person3 = "中村" 

let person_name person_t_list = List.map take_name person_t_list

(* テスト *) 
let test4 = person_name [] = [] 
let test5 = person_name lst = ["浅井"; "宮原"; "中村"] 