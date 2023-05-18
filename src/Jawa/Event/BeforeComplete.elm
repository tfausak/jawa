module Jawa.Event.BeforeComplete exposing (BeforeComplete, decoder, encode, tag)

{-|

@docs BeforeComplete, decoder, encode, tag

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


{-| The tag that describes this type.
-}
tag : String
tag =
    "beforeComplete"
