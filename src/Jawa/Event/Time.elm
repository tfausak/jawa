module Jawa.Event.Time exposing (Time, decoder, encode, tag)

{-|

@docs Time, decoder, encode, tag

-}

import Jawa.Metadata
import Jawa.SeekRange
import Jawa.Viewable
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/seek-events-1#ontime>
-}
type alias Time =
    { currentTime : Float
    , duration : Float
    , metadata : Jawa.Metadata.Metadata
    , position : Float
    , seekRange : Jawa.SeekRange.SeekRange
    , viewable : Jawa.Viewable.Viewable
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Time
decoder =
    Json.Decode.map6 Time
        (Json.Decode.field "currentTime" Json.Decode.float)
        (Json.Decode.field "duration" Json.Decode.float)
        (Json.Decode.field "metadata" Jawa.Metadata.decoder)
        (Json.Decode.field "position" Json.Decode.float)
        (Json.Decode.field "seekRange" Jawa.SeekRange.decoder)
        (Json.Decode.field "viewable" Jawa.Viewable.decoder)


{-| A JSON encoder.
-}
encode : Time -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "currentTime", Json.Encode.float x.currentTime )
        , ( "duration", Json.Encode.float x.duration )
        , ( "metadata", Jawa.Metadata.encode x.metadata )
        , ( "position", Json.Encode.float x.position )
        , ( "seekRange", Jawa.SeekRange.encode x.seekRange )
        , ( "viewable", Jawa.Viewable.encode x.viewable )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "time"
