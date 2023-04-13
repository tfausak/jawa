module Jawa.Event.Play exposing (Play, decoder, encoder)

{-|

@docs Play, decoder, encoder

-}

import Jawa.PlayReason as PlR
import Jawa.State as S
import Jawa.Viewable as V
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playback-events-1#onpause>
-}
type alias Play =
    { newstate : S.State
    , oldstate : S.State
    , playReason : PlR.PlayReason
    , reason : S.State
    , viewable : V.Viewable
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Play
decoder =
    Json.Decode.map5 Play
        (Json.Decode.field "newstate" S.decoder)
        (Json.Decode.field "oldstate" S.decoder)
        (Json.Decode.field "playReason" PlR.decoder)
        (Json.Decode.field "reason" S.decoder)
        (Json.Decode.field "viewable" V.decoder)


{-| A JSON encoder.
-}
encoder : Play -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "newstate", S.encoder x.newstate )
        , ( "oldstate", S.encoder x.oldstate )
        , ( "playReason", PlR.encoder x.playReason )
        , ( "reason", S.encoder x.reason )
        , ( "viewable", V.encoder x.viewable )
        ]
