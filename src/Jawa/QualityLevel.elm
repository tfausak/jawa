module Jawa.QualityLevel exposing (QualityLevel, decoder, encode)

{-|

@docs QualityLevel, decoder, encode

-}

import Json.Decode
import Json.Decode.Extra
import Json.Encode
import Maybe.Extra


{-| <https://docs.jwplayer.com/players/reference/getqualitylevels>
-}
type alias QualityLevel =
    { bitrate : Int
    , height : Int
    , index : Maybe Int
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
        (Json.Decode.Extra.optionalNullableField "index" Json.Decode.int)
        (Json.Decode.field "label" Json.Decode.string)
        (Json.Decode.field "width" Json.Decode.int)


{-| A JSON encoder.
-}
encode : QualityLevel -> Json.Encode.Value
encode x =
    [ Just ( "bitrate", Json.Encode.int x.bitrate )
    , Just ( "height", Json.Encode.int x.height )
    , Maybe.map (Json.Encode.int >> Tuple.pair "index") x.index
    , Just ( "label", Json.Encode.string x.label )
    , Just ( "width", Json.Encode.int x.width )
    ]
        |> Maybe.Extra.values
        |> Json.Encode.object
