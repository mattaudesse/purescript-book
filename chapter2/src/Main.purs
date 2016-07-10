module Main where

import Prelude                   ((+), (*), Unit, bind)
import Control.Monad.Eff         (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow)
import Math                      (sqrt)

diagonal :: Number -> Number -> Number
diagonal w h = sqrt (w * w + h * h)

main :: forall t4. Eff ( console :: CONSOLE | t4 ) Unit
main = do
    logShow (diagonal 3.0   4.0)
    logShow (diagonal 2.0   6.0)
    logShow (diagonal 100.1 4.3)
    logShow (diagonal 8.34  0.9)
