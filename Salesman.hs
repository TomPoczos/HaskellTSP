module Salesman (shortestPath) where

import SalesmanTypes
import SalesmanData
import Data.List
--import Flow

--I was working with the Flow package but I didn't want to submit code that
--would require external packages to be installed, so...
--reimplementing (|>)

(|>) :: a -> (a -> b) -> b
(|>) a f = f a

shortestPath :: Mode -> [Town] -> Town -> (Distance, [TownName])
shortestPath BruteForce towns startPoint =
    getAllPaths (delete startPoint towns) startPoint [(0.0, [startPoint])] |> selectShortestPath |> namesOnly

    where getAllPaths :: [Town] -> Town -> [(Distance, [Town])] -> [[(Distance, [Town])]]
          getAllPaths ts currentTown [(distTravelled, townsVisited)] =
              if null ts
                  then [[(distTravelled + directDistanceFromStartingPoint currentTown startPoint, startPoint:townsVisited)]]
                  else currentTown |> routes
                                   |> filter (\(Route (town, _)) -> town `notElem` townsVisited)
                                   |> map (\(Route (town, distance)) ->
                                        concat $ getAllPaths (delete town ts) town [(distTravelled + distance, town:townsVisited)])

          selectShortestPath :: [[(Distance, [Town])]] -> (Distance, [Town]) -- could be more general but this is more readable
          selectShortestPath paths =
                 paths |> concat
                       |> minimumBy (\(dist1, _) (dist2, _) -> case () of
                            _  | abs (dist1 - dist2) <= 0.01 -> EQ
                               | dist1 > dist2               -> GT
                               | dist1 < dist2               -> LT)

          directDistanceFromStartingPoint :: Town -> Town -> Distance
          directDistanceFromStartingPoint t startingPoint =
              t |> routes
                |> filter (\(Route (t2, _)) -> t2 == startingPoint)
                |> minimum -- there's only going to be a single item in the list anyway, head would work just as fine (ensured by the data set)
                |> (\(Route (_, distance)) -> distance)

shortestPath Greedy towns startPoint =  namesOnly $ getShortestPath towns startPoint (0.0, [startPoint])

    where getShortestPath :: [Town] -> Town -> (Distance, [Town]) -> (Distance, [Town])
          getShortestPath ts currentTown (distTravelled, townsVisited) =
              if null ts
                  then (distTravelled, townsVisited)
                  else getShortestPath (delete currentTown ts)
                                       (currentShortestTown currentTown townsVisited)
                                       (distTravelled + currentShortestDist currentTown townsVisited, currentShortestTown currentTown townsVisited:townsVisited)

          currentShortestDist :: Town -> [Town] -> Distance
          currentShortestDist town townsVisited = town |> routes
                                                       |> selectShortestRoute townsVisited
                                                       |> (\(Route (_, dist)) -> dist)

          currentShortestTown :: Town -> [Town] -> Town
          currentShortestTown town townsVisited = town |> routes
                                                       |> selectShortestRoute townsVisited
                                                       |> (\(Route (t, _)) -> t)

          selectShortestRoute :: [Town] -> [Route] ->  Route
          selectShortestRoute townsVisited rs = rs
           |> filter (\(Route (town, _)) -> town `notElem` townsVisited)
           |> (\remainingRoutes ->
                if null remainingRoutes
                   then rs |> filter (\(Route (t2, _)) -> t2 == startPoint)
                           |> head
                   else flip minimumBy remainingRoutes -- flipped for readability
                                       (\(Route (_, dist1)) (Route (_, dist2)) ->
                                           case () of
                                               _  | abs (dist1 - dist2) <= 0.01 -> EQ
                                                  | dist1 > dist2               -> GT
                                                  | dist1 < dist2               -> LT))

namesOnly :: (Distance, [Town]) -> (Distance, [TownName])
namesOnly (d, ts) = (d, map name ts)
