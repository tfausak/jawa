module Jawa.Event.Idle exposing (Idle, decoder, encoder)

{-|

@docs Idle, decoder, encoder

-}

import Jawa.State as S
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playback-events-1#onidle>
-}
type alias Idle =
    { newstate : S.State
    , oldstate : S.State
    , reason : S.State
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Idle
decoder =
    Json.Decode.map3 Idle
        (Json.Decode.field "newstate" S.decoder)
        (Json.Decode.field "oldstate" S.decoder)
        (Json.Decode.field "reason" S.decoder)


{-| A JSON encoder.
-}
encoder : Idle -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "newstate", S.encoder x.newstate )
        , ( "oldstate", S.encoder x.oldstate )
        , ( "reason", S.encoder x.reason )
        ]
