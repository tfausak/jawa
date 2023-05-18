module Jawa.Event.Controls exposing (Controls, decoder, encode)

{-|

@docs Controls, decoder, encode

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/control-events#oncontrols>
-}
type alias Controls =
    { controls : Bool
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Controls
decoder =
    Json.Decode.map Controls
        (Json.Decode.field "controls" Json.Decode.bool)


{-| A JSON encoder.
-}
encode : Controls -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "controls", Json.Encode.bool x.controls )
        ]
