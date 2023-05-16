module Jawa.Event.Pause exposing (Pause, decoder, encoder)

{-|

@docs Pause, decoder, encoder

-}

import Jawa.PauseReason
import Jawa.State
import Jawa.Viewable
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playback-events-1#onpause>
-}
type alias Pause =
    { newstate : Jawa.State.State
    , oldstate : Jawa.State.State
    , pauseReason : Jawa.PauseReason.PauseReason
    , reason : Jawa.State.State
    , viewable : Jawa.Viewable.Viewable
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Pause
decoder =
    Json.Decode.map5 Pause
        (Json.Decode.field "newstate" Jawa.State.decoder)
        (Json.Decode.field "oldstate" Jawa.State.decoder)
        (Json.Decode.field "pauseReason" Jawa.PauseReason.decoder)
        (Json.Decode.field "reason" Jawa.State.decoder)
        (Json.Decode.field "viewable" Jawa.Viewable.decoder)


{-| A JSON encoder.
-}
encoder : Pause -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "newstate", Jawa.State.encoder x.newstate )
        , ( "oldstate", Jawa.State.encoder x.oldstate )
        , ( "pauseReason", Jawa.PauseReason.encoder x.pauseReason )
        , ( "reason", Jawa.State.encoder x.reason )
        , ( "viewable", Jawa.Viewable.encoder x.viewable )
        ]
