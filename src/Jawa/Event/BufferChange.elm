module Jawa.Event.BufferChange exposing (BufferChange, decoder, encode)

{-|

@docs BufferChange, decoder, encode

-}

import Jawa.SeekRange
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/buffer-events-1#onbufferchange>
-}
type alias BufferChange =
    { bufferPercent : Float
    , currentTime : Float
    , duration : Float
    , position : Float
    , seekRange : Jawa.SeekRange.SeekRange
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
        (Json.Decode.field "seekRange" Jawa.SeekRange.decoder)


{-| A JSON encoder.
-}
encode : BufferChange -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "bufferPercent", Json.Encode.float x.bufferPercent )
        , ( "currentTime", Json.Encode.float x.currentTime )
        , ( "duration", Json.Encode.float x.duration )
        , ( "position", Json.Encode.float x.position )
        , ( "seekRange", Jawa.SeekRange.encode x.seekRange )
        ]
