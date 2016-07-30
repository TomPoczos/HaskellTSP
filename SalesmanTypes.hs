{--------------------------------------------------------------------------
Copyright 2016 Tom Poczos

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--------------------------------------------------------------------------}

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
