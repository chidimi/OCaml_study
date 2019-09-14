#use "../Data/global_ekikan_list.ml"

(* 漢字の駅名を２つと駅間リストを受け取ったら、駅間リストの中からその２つの距離を返す *)
(* string -> string -> ekikan_t list -> int *)
let rec get_ekikan_kyori ekimei1 ekimei2 ekikan_list = match ekikan_list with
    [] -> infinity
  | {kiten=kt; shuten=sh; keiyu=ky; kyori=kr; jikan=jk} as first :: rest ->
      if (ekimei1 = kt && ekimei2 = sh) || (ekimei2 = kt && ekimei1 = sh) then kr
                                                                           else get_ekikan_kyori ekimei1 ekimei2 rest
  

(* テスト *) 
let test1 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list = 1.2
let test2 = get_ekikan_kyori "茗荷谷" "池袋" global_ekikan_list = infinity
let test3 = get_ekikan_kyori "東京" "大手町" global_ekikan_list = 0.6