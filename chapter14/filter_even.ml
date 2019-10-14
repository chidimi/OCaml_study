let is_even n = n mod 2 = 0

let filter_even lst = List.filter is_even lst



let test1 = filter_even [2; 3; 4; 5] = [2; 4]