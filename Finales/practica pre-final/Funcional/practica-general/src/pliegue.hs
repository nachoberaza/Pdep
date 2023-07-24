inversa :: [a] -> [a]
inversa = foldl (\ xs' x -> x : xs') []