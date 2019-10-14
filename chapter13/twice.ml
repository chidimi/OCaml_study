let add3 x = x + 3

let twice f = let g x = f (f x) in g

twice add3 7