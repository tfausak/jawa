module Jawa.Event.DisplayClick exposing (DisplayClick, decoder, encode, tag)

{-|

@docs DisplayClick, decoder, encode, tag

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/control-events#ondisplayclick>
-}
type alias DisplayClick =
    {}


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder DisplayClick
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always {})


{-| A JSON encoder.
-}
encode : DisplayClick -> Json.Encode.Value
encode _ =
    Json.Encode.object
        []


{-| The tag that describes this type.
-}
tag : String
tag =
    "displayClick"
