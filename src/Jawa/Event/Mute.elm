module Jawa.Event.Mute exposing (Mute, decoder, encoder)

{-|

@docs Mute, decoder, encoder

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
encoder : Mute -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "mute", Json.Encode.bool x.mute )
        ]
