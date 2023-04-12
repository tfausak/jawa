module Jawa.Event.DisplayClick exposing (DisplayClick(..), decoder, encoder)

{-|

@docs DisplayClick, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/control-events#ondisplayclick>
-}
type DisplayClick
    = DisplayClick


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder DisplayClick
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always DisplayClick)


{-| A JSON encoder.
-}
encoder : DisplayClick -> Json.Encode.Value
encoder _ =
    Json.Encode.object
        []
