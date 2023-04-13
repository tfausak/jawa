module Jawa.Event.Pause exposing (Pause, decoder, encoder)

{-|

@docs Pause, decoder, encoder

-}

import Jawa.PauseReason as PR
import Jawa.State as S
import Jawa.Viewable as V
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playback-events-1#onpause>
-}
type alias Pause =
    { newstate : S.State
    , oldstate : S.State
    , pauseReason : PR.PauseReason
    , reason : S.State
    , viewable : V.Viewable
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Pause
decoder =
    Json.Decode.map5 Pause
        (Json.Decode.field "newstate" S.decoder)
        (Json.Decode.field "oldstate" S.decoder)
        (Json.Decode.field "pauseReason" PR.decoder)
        (Json.Decode.field "reason" S.decoder)
        (Json.Decode.field "viewable" V.decoder)


{-| A JSON encoder.
-}
encoder : Pause -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "newstate", S.encoder x.newstate )
        , ( "oldstate", S.encoder x.oldstate )
        , ( "pauseReason", PR.encoder x.pauseReason )
        , ( "reason", S.encoder x.reason )
        , ( "viewable", V.encoder x.viewable )
        ]
