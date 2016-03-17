--exercicio 1
someSquad :: Int -> Int -> Int
someSquad x y = (x^2 + y^2)


--exercicio 2
hasEqHeads :: [Int] -> [Int] -> Bool
hasEqHeads x y = if head x == head y then True else False


--exercicio 3
adcSr :: [String] -> [String]
adcSr x = map ("Sr " ++) x

--exercicio 4
buscEsp :: String -> Int
buscEsp x = length ((filter(==' ')) x)

--exercicio 5
calcLista :: [Float] -> [Float]
calcLista num = map (\ n-> 3*n^2 + 2/n + 1) num

--exercicio 6
listNegat :: [Integer] -> [Integer]
listNegat num = filter(< 0) num

--exercicio 7
umEcem :: [Integer] -> [Integer]
umEcem num = map ((filter (< 100) num) && (filter(> 1) num)) num