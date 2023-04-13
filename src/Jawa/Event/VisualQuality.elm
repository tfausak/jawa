module Jawa.Event.VisualQuality exposing (VisualQuality, decoder, encoder)

{-|

@docs VisualQuality, decoder, encoder

-}

import Jawa.QualityLevel as QL
import Jawa.QualityMode as QM
import Jawa.QualityReason as QR
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/quality-events-1#onvisualquality>
-}
type alias VisualQuality =
    { level : QL.QualityLevel
    , mode : QM.QualityMode
    , reason : QR.QualityReason
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder VisualQuality
decoder =
    Json.Decode.map3 VisualQuality
        (Json.Decode.field "level" QL.decoder)
        (Json.Decode.field "mode" QM.decoder)
        (Json.Decode.field "reason" QR.decoder)


{-| A JSON encoder.
-}
encoder : VisualQuality -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "level", QL.encoder x.level )
        , ( "mode", QM.encoder x.mode )
        , ( "reason", QR.encoder x.reason )
        ]
