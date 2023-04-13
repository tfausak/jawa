module Jawa.Event.Seek exposing (Seek, decoder, encoder)

{-|

@docs Seek, decoder, encoder

-}

import Jawa.Metadata as M
import Jawa.SeekRange as SR
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/seek-events-1#onseek>
-}
type alias Seek =
    { currentTime : Float
    , duration : Float
    , metadata : M.Metadata
    , offset : Float
    , position : Float
    , seekRange : SR.SeekRange
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Seek
decoder =
    Json.Decode.map6 Seek
        (Json.Decode.field "currentTime" Json.Decode.float)
        (Json.Decode.field "duration" Json.Decode.float)
        (Json.Decode.field "metadata" M.decoder)
        (Json.Decode.field "offset" Json.Decode.float)
        (Json.Decode.field "position" Json.Decode.float)
        (Json.Decode.field "seekRange" SR.decoder)


{-| A JSON encoder.
-}
encoder : Seek -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "currentTime", Json.Encode.float x.currentTime )
        , ( "duration", Json.Encode.float x.duration )
        , ( "metadata", M.encoder x.metadata )
        , ( "offset", Json.Encode.float x.offset )
        , ( "position", Json.Encode.float x.position )
        , ( "seekRange", SR.encoder x.seekRange )
        ]
