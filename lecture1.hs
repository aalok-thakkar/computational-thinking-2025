{-
    The Lodha Genius Programme, Continued Learning Module 2025
    
    Computational Thinking: When to Think, When to Compute



















    
    An LGP number is a positive perfect square number such that: 
    1. Increasing its first (leftmost) digit by 1 produces another perfect square, and
    2. Increasing each digit by 1 produces yet another perfect square (leading zeros are not allowed). 
    
    For instance, 576 is a perfect square, and so is 676. However, 687 isn't a perfect square. 
    
    Find the smallest LGP number.


    









    It’s about recognizing:
      - When to slow down and THINK — so you can avoid doing billions of 
        pointless steps that a single clever thought would replace.
      - When to just COMPUTE — because sometimes the thinking shortcut doesn’t 
        exist, and trying to be clever wastes more time than it saves.

    We’ll explore:
      - Problems where computation is the natural path.
      - Problems where thinking first turns hours into seconds.
      - How to train your brain to quickly spot which mode to use.

    By the end, you’ll be able to look at a problem and know whether to:
      - Think like a mathematician
      - Work like a machine

    And you’ll do both better.






    We will use the bank of problems called Project Euler: projecteuler.net

-}






























-- Problem 1: Find the sum of all the multiples of 3 or 5 below 1000


        -- So all multiples of 3 are 3, 6, 9, ... , 999
        -- They form arithmetic progressions. 
                -- 333 * 501

        -- Multiples of 5 are 5, 10, 15, ... 995
                -- 199 * 500

        -- Remove multiples of 15, 30, 45, ..., 990
                -- 995 * 33


-- Let's say we have (a), (a + d), (a + 2d), ... (a + (n-1).d)
   -- n* (2a + (n-1)d)/2 (which is: number of terms * avg of first and last term)












---------------------------------------------------------
-- 1. BASIC ARITHMETIC
---------------------------------------------------------

exampleAdd :: Int
exampleAdd = 2 + 3

exampleSubtract :: Int
exampleSubtract = 7 - 4

exampleMultiply :: Int
exampleMultiply = 6 * 8

exampleDivideFloat :: Double
exampleDivideFloat = 10 / 4

exampleDivideInt :: Int
exampleDivideInt = 10 `div` 4

exampleModulus :: Int
exampleModulus = 10 `mod` 4

exampleParens :: Int
exampleParens = (2 + 3) * 4












areaRectangle :: Int -> Int -> Int
areaRectangle width height = width * height



{- 

   

    myadd :: R -> R
    myadd x = add 5 x

    add :: R * R -> R

    add 5 3 = (add 5) 3 = myadd 3

    add :: R -> (R -> R)

    This is called currying

-}









power :: Int -> Int -> Int
power base exp
  | exp == 0  = 1
  | otherwise = base * power base (exp - 1)

-- x^n = x * (x^(n - 1))













-- How would you compute n! (n factorial)?


{-
power :: Int -> Int -> Int
power base exp
  | exp == 0  = 1
  | otherwise = base * power base (exp - 1) 
-}



factorial :: Int -> Int
factorial n
  | n <= 1    = 1
  | otherwise = n * factorial (n - 1)

{- 

factorial 6 = 6 * factorial (6 - 1)
            = 6 * factorial (5)
            = 6 * (5 * factorial (5 - 1))
            = 6 * (5 * factorial (4))
            = 6 * (5 * (4 * factorial (4 - 1)))
            = 6 * (5 * (4 * factorial (3)))
            = 6 * (5 * (4 * (3 * factorial 2)))
            = 6 * (5 * (4 * (3 * (2 * factorial 1))))
            = 6 * (5 * (4 * (3 * (2 * 1))))

-}












-- How would you sum up to n?




{- 

If n = 0, then answer is 0
Else sum n = 1 + 2 + 3 + ... (n - 1) + n
           = sum (n - 1) + n




-}





sumToN :: Int -> Int
sumToN n
  | n <= 0    = 0
  | otherwise = n + sumToN (n - 1)



sumMultiples3 :: Int -> Int
sumMultiples3 n
  | n <= 0             = 0
  | (n `mod` 3 == 0)   = n + sumMultiples3 (n-1)
  | otherwise          = sumMultiples3 (n-1)

{-

sumMultiples 1000 = 3 + 6 + 9 + ... + 990 + 993 + 996 + 999
                  = sumMultiples 999
                  = (sumMultiples 998) + 999
                  = (sumMultiples 997) + 999
                  = (sumMultiples 996) + 999
                  = ((sumMultiples 993) + 996) + 999

-}









sumMultiples3or5 :: Int -> Int
sumMultiples3or5 n
  | n <= 0                               = 0
  | (n `mod` 3 == 0)                     = n + sumMultiples3or5 (n-1)
  | (n `mod` 5 == 0)                     = n + sumMultiples3or5 (n-1)
  | otherwise                            = sumMultiples3or5 (n-1)

sumMultiples3or5' :: Int -> Int
sumMultiples3or5' n
  | n <= 0                               = 0
  | (n `mod` 3 == 0) || (n `mod` 5 == 0) = n + sumMultiples3or5' (n-1)
  | otherwise                            = sumMultiples3or5' (n-1)


-- Lists

listNumbers :: [Int]
listNumbers = [1, 2, 3, 4]

listRange1 :: [Int]
listRange1 = [1..5]

listRange2 :: [Int]
listRange2 = [2,4..10]

-- Make a list of all elements that are divisible by 3 and by 5.

multiples3 :: [Int]
multiples3 = [0,3..999]

multiples5 :: [Int]
multiples5 = [0,5..999]

-- Make a list of all 

multiples3' :: [Int]
multiples3' = [x | x <- [0..1000], x `mod` 3 == 0]

multiples3or5 :: [Int]
multiples3or5 = [x | x <- [0..1000], (x `mod` 3 == 0) || (x `mod` 5 == 0)]

-- Recursive Functions

sumList :: [Int] -> Int
sumList []      = 0
sumList (h : t) = h + sumList t

{-

 sumList [a1, a2, a3, ... an ] = a1 + a2 + a3 + ... an 
                               = a1 + sumList [a2, a3, ... an ]
-}