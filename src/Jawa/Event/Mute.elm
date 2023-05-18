module Jawa.Event.Mute exposing (Mute, decoder, encode)

{-|

@docs Mute, decoder, encode

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
