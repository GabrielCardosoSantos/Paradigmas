import Data.Char

--EXERCICIO 1
addSuffix :: String -> [String] -> [String]
addSuffix s1 s2 = [x++s1 | x <- s2]

--EXERCICIO 2
countShorts :: [String] -> Int
countShorts [] = 0
countShorts s = if (length (head s) < 5)
	then 1 + countShorts (tail s)
	else countShorts (tail s)

--EXERCICIO 3
countShorts1 :: [String] -> Int
countShorts1 s = length [x | x<- s, (length x) < 5]

--EXERCICIO 4
ciclo :: Int -> [Int] -> [Int]
ciclo 0 _ = []
ciclo _ [] = []
ciclo i x = x ++ ciclo (i-1) x

--EXERCICIO 5
numera :: [String] -> [(Int,String)]
numera [] = []
numera s = auxNumera 1 s

auxNumera :: Int -> [String] -> [(Int, String)]
auxNumera _ [] = []
auxNumera i s= (i, head s) : auxNumera (i+1) (tail s)


--EXERCICIO 6
	-- A) [(2,3),(2,5),(4,5)]	-- pega os pares para posição X e impares na posição acima do X+1 para o Y
	-- B) ["lazyfrog","lazydog","bigfrog","bigdog"]     -- faz todas possibilidades de pares
	-- C) "p-r-l-l-p-p-d-"    -- substitui vogais por '-'


--EXERCICIO 7
crossProduct :: [Int] -> [Int] -> [(Int, Int)]
crossProduct _ [] = []
crossProduct [] _ = []
crossProduct x l = (pairWithAll (head x) l) ++ crossProduct (tail x) l

pairWithAll :: Int -> [Int] -> [(Int, Int)]
pairWithAll _ [] = []
pairWithAll i x = (i, head x) : pairWithAll i (tail x)

--EXERCICIO 8
genRects :: Int -> (Int, Int) -> [(Float, Float, Float, Float)]
genRects n (ix,jy) = 
	[((fromIntegral ix) + x, fromIntegral jy, 5.5, 5.5) 
	| x <- [0.0, 5.5.. 5.5 * (fromIntegral (n - 1))]]


--EXERCICIO 9
func :: [(Int, Int)] -> ([Int], [Int])
func []  =  ([], [])
func x = (fst (head x) : (fst (func (tail x))), snd (head x): (snd (func (tail x))))


--EXERCICIO 10
func1 :: [(Int, Int)] -> ([Int], [Int])
func1 l = ([fst x | x <- l] ,[snd x| x <- l])

--EXERCICIO 11
func2 :: [(Int, Int)] -> ([Int], [Int])
func2 l = (map fst l, map snd l)

--EXERCICIO 12
isCpfOk :: [Int] -> Bool
isCpfOk cpf = 
  let -- calcula primeiro digito
      digitos1 = take 9 cpf
      --expr1 = (sum $ zipWith (*) digitos1 [10,9..2]) `mod` 11
      --dv1 = if expr1 < 2 then 0 else 11-expr1
      dv1 = calcCpf 10 digitos1

      -- calcula segundo digito
      digitos2 = digitos1 ++ [dv1]
      --expr2 = (sum $ zipWith (*) digitos2 [11,10..2]) `mod` 11
      --dv2 = if expr2 < 2 then 0 else 11-expr2
      dv2 = calcCpf 11 digitos2
   in dv1 == cpf !! 9 && dv2 == cpf !! 10

main = do
  let cpf = "12345678909"
      digitos = (map digitToInt cpf)
      result = isCpfOk digitos
  putStrLn (show result)

calcCpf :: Int -> [Int] -> Bool
calcCpf x y
	| expr1 <= (sum $ zipWith (*) y [x, x-1..2]) `mod` 11
	where num <= if expr1 < 2 then 0 else 11-expr1