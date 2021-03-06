module Main where

import Prelude

import AnpanEditor.Renderer.App (app)
import AnpanEditor.Renderer.Monad (runAppM)
import AnpanEditor.Renderer.Route (Route(..))
import Effect (Effect)
import Halogen.Aff (awaitBody, runHalogenAff)
import Halogen.VDom.Driver (runUI)

main :: Effect Unit
main = runHalogenAff do
  body <- awaitBody

  let
    initialStore =
      { currentView: TitleEditor
      }
  
  rootComponent <- runAppM initialStore app
  runUI rootComponent {} body
