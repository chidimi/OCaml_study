#use "../Data/eki_t.ml"
#use "../chapter10/get_ekikan_kyori.ml"

(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]} 
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]} 
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []} 
 
(* 目的：未確定の駅 q を必要に応じて更新した駅を返す *) 
(* koushin1 : eki_t -> eki_t -> eki_t *) 
let koushin1 p q = match (p, q) with 
  ({namae = pn; saitan_kyori = ps; temae_list = pt}, 
   {namae = qn; saitan_kyori = qs; temae_list = qt}) -> 
    let kyori = get_ekikan_kyori pn qn global_ekikan_list in 
    if kyori = infinity 
    then q 
    else if ps +. kyori < qs 
    then {namae = qn; saitan_kyori = ps +. kyori; temae_list = qn :: pt} 
    else q 
 
(* テスト *) 
let test1 = koushin1 eki3 eki1 = eki1 
let test2 = koushin1 eki3 eki2 = eki2 
let test3 = koushin1 eki3 eki3 = eki3 
let test4 = koushin1 eki3 eki4 = 
	{namae="後楽園"; saitan_kyori = 1.8; temae_list = ["後楽園"; "茗荷谷"]} 
let test5 = koushin1 eki2 eki1 = 
	{namae="池袋"; saitan_kyori = 3.0; temae_list = ["池袋"; "新大塚"; "茗荷谷"]} 
let test6 = koushin1 eki2 eki2 = eki2 
let test7 = koushin1 eki2 eki3 = eki3 
let test8 = koushin1 eki2 eki4 = eki4 