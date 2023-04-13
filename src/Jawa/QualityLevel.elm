module Jawa.QualityLevel exposing (QualityLevel, decoder, encoder)

{-|

@docs QualityLevel, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/getqualitylevels>
-}
type alias QualityLevel =
    { bitrate : Int
    , height : Int
    , index : Int
    , label : String
    , width : Int
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder QualityLevel
decoder =
    Json.Decode.map5 QualityLevel
        (Json.Decode.field "bitrate" Json.Decode.int)
        (Json.Decode.field "height" Json.Decode.int)
        (Json.Decode.field "index" Json.Decode.int)
        (Json.Decode.field "label" Json.Decode.string)
        (Json.Decode.field "width" Json.Decode.int)


{-| A JSON encoder.
-}
encoder : QualityLevel -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "bitrate", Json.Encode.int x.bitrate )
        , ( "height", Json.Encode.int x.height )
        , ( "index", Json.Encode.int x.index )
        , ( "label", Json.Encode.string x.label )
        , ( "width", Json.Encode.int x.width )
        ]
