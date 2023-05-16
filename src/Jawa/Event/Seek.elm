module Jawa.Event.Seek exposing (Seek, decoder, encoder)

{-|

@docs Seek, decoder, encoder

-}

import Jawa.Metadata
import Jawa.SeekRange
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/seek-events-1#onseek>
-}
type alias Seek =
    { currentTime : Float
    , duration : Float
    , metadata : Jawa.Metadata.Metadata
    , offset : Float
    , position : Float
    , seekRange : Jawa.SeekRange.SeekRange
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Seek
decoder =
    Json.Decode.map6 Seek
        (Json.Decode.field "currentTime" Json.Decode.float)
        (Json.Decode.field "duration" Json.Decode.float)
        (Json.Decode.field "metadata" Jawa.Metadata.decoder)
        (Json.Decode.field "offset" Json.Decode.float)
        (Json.Decode.field "position" Json.Decode.float)
        (Json.Decode.field "seekRange" Jawa.SeekRange.decoder)


{-| A JSON encoder.
-}
encoder : Seek -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "currentTime", Json.Encode.float x.currentTime )
        , ( "duration", Json.Encode.float x.duration )
        , ( "metadata", Jawa.Metadata.encoder x.metadata )
        , ( "offset", Json.Encode.float x.offset )
        , ( "position", Json.Encode.float x.position )
        , ( "seekRange", Jawa.SeekRange.encoder x.seekRange )
        ]
