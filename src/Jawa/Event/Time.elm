module Jawa.Event.Time exposing (Time, decoder, encoder)

{-|

@docs Time, decoder, encoder

-}

import Jawa.SeekRange as SR
import Jawa.Viewable as V
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/seek-events-1#ontime>
-}
type alias Time =
    { currentTime : Float
    , duration : Float
    , position : Float
    , seekRange : SR.SeekRange
    , viewable : V.Viewable
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Time
decoder =
    Json.Decode.map5 Time
        (Json.Decode.field "currentTime" Json.Decode.float)
        (Json.Decode.field "duration" Json.Decode.float)
        (Json.Decode.field "position" Json.Decode.float)
        (Json.Decode.field "seekRange" SR.decoder)
        (Json.Decode.field "viewable" V.decoder)


{-| A JSON encoder.
-}
encoder : Time -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "currentTime", Json.Encode.float x.currentTime )
        , ( "duration", Json.Encode.float x.duration )
        , ( "position", Json.Encode.float x.position )
        , ( "seekRange", SR.encoder x.seekRange )
        , ( "viewable", V.encoder x.viewable )
        ]
