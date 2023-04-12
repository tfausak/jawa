module Jawa.Event.FirstFrame exposing (FirstFrame, decoder, encoder)

{-|

@docs FirstFrame, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playback-events-1#onfirstframe>
-}
type alias FirstFrame =
    { loadTime : Float
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder FirstFrame
decoder =
    Json.Decode.map FirstFrame
        (Json.Decode.field "loadTime" Json.Decode.float)


{-| A JSON encoder.
-}
encoder : FirstFrame -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "loadTime", Json.Encode.float x.loadTime )
        ]
