module Jawa.Event.BufferChange exposing (BufferChange, decoder, encoder)

{-|

@docs BufferChange, decoder, encoder

-}

import Jawa.SeekRange as SR
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/buffer-events-1#onbufferchange>
-}
type alias BufferChange =
    { bufferPercent : Float
    , currentTime : Float
    , duration : Float
    , position : Float
    , seekRange : SR.SeekRange
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder BufferChange
decoder =
    Json.Decode.map5 BufferChange
        (Json.Decode.field "bufferPercent" Json.Decode.float)
        (Json.Decode.field "currentTime" Json.Decode.float)
        (Json.Decode.field "duration" Json.Decode.float)
        (Json.Decode.field "position" Json.Decode.float)
        (Json.Decode.field "seekRange" SR.decoder)


{-| A JSON encoder.
-}
encoder : BufferChange -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "bufferPercent", Json.Encode.float x.bufferPercent )
        , ( "currentTime", Json.Encode.float x.currentTime )
        , ( "duration", Json.Encode.float x.duration )
        , ( "position", Json.Encode.float x.position )
        , ( "seekRange", SR.encoder x.seekRange )
        ]
