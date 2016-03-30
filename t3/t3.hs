--exercicio 1
funcRecur :: [Int] -> [Int]
funcRecur [] = []
funcRecur x = (head x) ^ 2 : funcRecur(tail x)

--exercicio 2
adcSr :: [String] -> [String]
adcSr [] = []
adcSr a = ("Sr " ++ head a) : adcSr (tail a)

--exercicio 3
contEsp :: String -> Int
contEsp [] = 0
contEsp a = if (head a == ' ')
	then 1 + contEsp(tail a)
	else contEsp (tail a)

--exercicio 4
multList :: [Double] -> [Double]
multList [] = []
multList n = ((\n -> 3*n^2 + 2/n + 1)(head n)) : multList (tail n)

--exercicio 5
listNeg :: [Int] -> [Int]
listNeg [] = []
listNeg x = if (head x < 0)
	then (head x) : listNeg (tail x)
	else listNeg (tail x)

--exercicio 6
semVogal :: String -> String
semVogal s = filter (\s ->notElem s "aeiouAEIOU") s


--exercicio 7
semVogal2 :: String -> String
semVogal2 "" = ""
semVogal2 a = if (elem (head a) "aeiouAEIOU")
	then semVogal2 (tail a)
	else (head a) : semVogal2 (tail a)

--exercicio 8
codifica :: String -> String
codifica s = map (\s -> if s /= ' ' then '-' else s) s

--exercicio 9
codifica2 :: String -> String
codifica2 "" = ""
codifica2 a = if (a /= "")
	then if (head a /= ' ')
		then '-': codifica2(tail a)
		else ' ': codifica2(tail a)
	else ""

--exercicio 10
charFound :: Char -> String -> Bool
charFound _ "" = False
charFound c a = if (c == head a)
	then True
	else charFound c (tail a)

--exercicio 11
translate :: [(Double, Double)] -> [(Double, Double)]
translate [] = []
translate x = (fst(head x) + 2, snd (head x) + 2) : translate (tail x)

--exercicio 12
prodVet :: [Int] -> [Int] -> [Int]
prodVet [] _ = []
prodVet x y = ((head x) * (head y)) : prodVet (tail x) (tail y)

--exercicio 13
prodVet2 :: [Int] -> [Int] -> [Int]
prodVet2 x y= zipWith (*) x y

--exercicio 14
geraTabela :: Int -> [(Int, Int)]
geraTabela n = aux 0 n

aux :: Int -> Int -> [(Int, Int)]
aux x y = if x <= y
	then (x, x ^ 2) : aux (x+1) y
	else []

