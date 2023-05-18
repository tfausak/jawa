module Jawa.SeekRange exposing (SeekRange, decoder, encode)

{-|

@docs SeekRange, decoder, encode

-}

import Json.Decode
import Json.Encode


{-| This type is not documented.
-}
type alias SeekRange =
    { end : Float
    , start : Float
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder SeekRange
decoder =
    Json.Decode.map2 SeekRange
        (Json.Decode.field "end" Json.Decode.float)
        (Json.Decode.field "start" Json.Decode.float)


{-| A JSON encoder.
-}
encode : SeekRange -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "end", Json.Encode.float x.end )
        , ( "start", Json.Encode.float x.start )
        ]
