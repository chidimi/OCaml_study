#use "../Data/global_ekimei_list.ml"

(* 駅名リストの例 *) 
 
let ekimei_list = [ 
{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
{kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}; 
{kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"}; 
{kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"}; 
{kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"}; 
{kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"} 
] 

let rec ekimei_insert ekimei_t_list ekimei0 = match ekimei_t_list with
    [] -> [ekimei0]
  | {kanji=kn; kana=ka; romaji=ro; shozoku=sh} as first :: rest -> match ekimei0 with
    {kanji=kn0; kana=ka0; romaji=ro0; shozoku=sh0} ->   if ka = ka0 then ekimei_insert rest ekimei0
                                                        else if ka < ka0 then first :: ekimei_insert rest ekimei0
                                                                  else ekimei0 :: ekimei_t_list
(* テスト *) 
let test1 = ekimei_insert [] {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"} 
	    = [{kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"}] 
let test2 = ekimei_insert [ 
	{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
	{kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"}; 
	{kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}; 
	{kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"}; 
	{kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"} 
	] 
	{kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"} 
= [ 
{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
{kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"}; 
{kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"}; 
{kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}; 
{kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"}; 
{kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"} 
] 

(* ekimei_t 型のリストを受け取ったら、それをひらがなの順に整列し、さらに駅の重複を取り除いたekimei_t 型のリストを返す *)
(* ekimei_t -> ekimei_t *)
let rec seiretsu ekimei_t_list = match ekimei_t_list with
    [] -> []
  | {kanji=kn; kana=ka; romaji=ro; shozoku=sh} as first :: rest -> ekimei_insert (seiretsu rest) first

(* テスト *) 
let test3 = seiretsu [] = [] 
let test4 = seiretsu ekimei_list = [ 
{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
{kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"}; 
{kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"}; 
{kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}; 
{kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"}; 
{kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"} 
] 