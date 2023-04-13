module Jawa.Event.Pause exposing (Pause, decoder, encoder)

{-|

@docs Pause, decoder, encoder

-}

import Jawa.Viewable as V
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playback-events-1#onpause>
-}
type alias Pause =
    { newstate : String
    , oldstate : String
    , pauseReason : String
    , reason : String
    , viewable : V.Viewable
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Pause
decoder =
    Json.Decode.map5 Pause
        (Json.Decode.field "newstate" Json.Decode.string)
        (Json.Decode.field "oldstate" Json.Decode.string)
        (Json.Decode.field "pauseReason" Json.Decode.string)
        (Json.Decode.field "reason" Json.Decode.string)
        (Json.Decode.field "viewable" V.decoder)


{-| A JSON encoder.
-}
encoder : Pause -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "newstate", Json.Encode.string x.newstate )
        , ( "oldstate", Json.Encode.string x.oldstate )
        , ( "pauseReason", Json.Encode.string x.pauseReason )
        , ( "reason", Json.Encode.string x.reason )
        , ( "viewable", V.encoder x.viewable )
        ]
