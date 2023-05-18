module Jawa.Event.Seek exposing (Seek, decoder, encode, tag)

{-|

@docs Seek, decoder, encode, tag

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
encode : Seek -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "currentTime", Json.Encode.float x.currentTime )
        , ( "duration", Json.Encode.float x.duration )
        , ( "metadata", Jawa.Metadata.encode x.metadata )
        , ( "offset", Json.Encode.float x.offset )
        , ( "position", Json.Encode.float x.position )
        , ( "seekRange", Jawa.SeekRange.encode x.seekRange )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "seek"
