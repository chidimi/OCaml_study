#use "../Data/global_ekimei_list.ml"

(* ローマ字の駅名と駅名リストを受けとたら、その駅の漢字表記を文字列で返す *)
(* string -> ekimei_t list -> string *)
let rec romaji_to_kanji ekimei global_ekimei_lst = match global_ekimei_lst with
    [] -> ""
  | {kanji=kj; kana=kn; romaji=ro; shozoku=sh} as first :: rest -> if ro = ekimei then kj
                                                                                  else romaji_to_kanji ekimei rest

let test1 = romaji_to_kanji "myogadani" global_ekimei_list = "茗荷谷"
let test2 = romaji_to_kanji "aaa" global_ekimei_list = ""