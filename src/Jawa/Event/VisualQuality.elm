module Jawa.Event.VisualQuality exposing (VisualQuality, decoder, encode, tag)

{-|

@docs VisualQuality, decoder, encode, tag

-}

import Jawa.QualityLevel
import Jawa.QualityMode
import Jawa.QualityReason
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/quality-events-1#onvisualquality>
-}
type alias VisualQuality =
    { level : Jawa.QualityLevel.QualityLevel
    , mode : Jawa.QualityMode.QualityMode
    , reason : Jawa.QualityReason.QualityReason
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder VisualQuality
decoder =
    Json.Decode.map3 VisualQuality
        (Json.Decode.field "level" Jawa.QualityLevel.decoder)
        (Json.Decode.field "mode" Jawa.QualityMode.decoder)
        (Json.Decode.field "reason" Jawa.QualityReason.decoder)


{-| A JSON encoder.
-}
encode : VisualQuality -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "level", Jawa.QualityLevel.encode x.level )
        , ( "mode", Jawa.QualityMode.encode x.mode )
        , ( "reason", Jawa.QualityReason.encode x.reason )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "visualQuality"
