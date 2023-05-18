module Jawa.Event.Mute exposing (Mute, decoder, encode, tag)

{-|

@docs Mute, decoder, encode, tag

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/volume-events-1#onmute>
-}
type alias Mute =
    { mute : Bool
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Mute
decoder =
    Json.Decode.map Mute
        (Json.Decode.field "mute" Json.Decode.bool)


{-| A JSON encoder.
-}
encode : Mute -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "mute", Json.Encode.bool x.mute )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "mute"
