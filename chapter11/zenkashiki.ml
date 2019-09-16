let rec zenkashiki n = 
    if n = 0 then 3
             else 2 * zenkashiki(n - 1) - 1

let test1 = zenkashiki 0 = 3
let test2 = zenkashiki 1 = 5
let test3 = zenkashiki 2 = 9