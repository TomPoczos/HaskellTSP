module SalesmanTypes
    ( Mode (..)
    , Route (..)
    , Town (..)
    , TownName(..)
    , Distance
    , Path
    ) where



data Mode = BruteForce
          | Heuristic
          | Greedy deriving Show

data TownName = Birmingham
               | Lancaster
               | Leeds
               | Leicerster
               | Lincoln
               | Liverpool
               | Manchester
               | Nottingham
               | Sheffield
               | Stoke
               | A
               | B
               | C
               | D
               deriving (Show, Eq)

type Distance = Double

type Path = [(Distance, [Town])]

newtype Route = Route (Town, Distance) deriving Show

data Town = Town { name   :: TownName
                 , routes :: [Route]
                 } deriving (Show, Eq)

--making sure eroutes associated with town are not compared
--as it would lead to evaluation of the whole graph
instance Eq Route where
    Route (t1, a1) == Route (t2, b1) =
        abs (a1 - b1) <= 0.01
        && name t1 == name t2

instance Ord Route where
    compare (Route (_, a1)) (Route (_, b1))
        | abs (a1 - b1) <= 0.01 = EQ
        | a1 > b1               = GT
        | a1 < b1               = LT
