#use "./get_ekikan_kyori.ml"
#use "./romaji_to_kanji.ml"

(* ローマ字の駅名を２つうけとったら、その間の距離を調べ、直接つながっている場合は *)
(* string -> string -> string *)
let kyori_wo_hyoji ekimei1 ekimei2 = 
let ekimei1_kn = romaji_to_kanji ekimei1 global_ekimei_list in 
    if ekimei1_kn = "" then ekimei1 ^ " という駅は存在しません"
else let ekimei2_kn = romaji_to_kanji ekimei2 global_ekimei_list in
    if ekimei2_kn = "" then ekimei2 ^ " という駅は存在しません"
else let kyori = get_ekikan_kyori ekimei1_kn ekimei2_kn global_ekikan_list in
  if kyori = infinity then ekimei1_kn ^ "と" ^ ekimei2_kn ^ "はつながっていません"
                      else ekimei1_kn ^ "から" ^ ekimei2_kn ^ "までは " ^ string_of_float kyori ^ " キロです"





let test1 = kyori_wo_hyoji "myougadani" "shinotsuka" 
	    = "myougadani という駅は存在しません" 
let test1 = kyori_wo_hyoji "myogadani" "shinotsuka" 
	    = "茗荷谷から新大塚までは 1.2 キロです" 
let test1 = kyori_wo_hyoji "myogadani" "ikebukuro" 
	    = "茗荷谷と池袋はつながっていません" 
let test1 = kyori_wo_hyoji "tokyo" "ootemachi" 
	    = "ootemachi という駅は存在しません" 
let test1 = kyori_wo_hyoji "tokyo" "otemachi" 
	    = "東京から大手町までは 0.6 キロです" 