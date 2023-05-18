module Jawa.Event.BeforeComplete exposing (BeforeComplete, decoder, encode)

{-|

@docs BeforeComplete, decoder, encode

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/advertising-events#onbeforecomplete>
-}
type alias BeforeComplete =
    {}


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder BeforeComplete
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always {})


{-| A JSON encoder.
-}
encode : BeforeComplete -> Json.Encode.Value
encode _ =
    Json.Encode.object
        []
