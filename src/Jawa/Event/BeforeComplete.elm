module Jawa.Event.BeforeComplete exposing (BeforeComplete(..), decoder, encoder)

{-|

@docs BeforeComplete, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/advertising-events#onbeforecomplete>
-}
type BeforeComplete
    = BeforeComplete


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder BeforeComplete
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always BeforeComplete)


{-| A JSON encoder.
-}
encoder : BeforeComplete -> Json.Encode.Value
encoder _ =
    Json.Encode.object
        []
