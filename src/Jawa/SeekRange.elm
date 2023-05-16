module Jawa.SeekRange exposing (SeekRange, decoder, encoder)

{-|

@docs SeekRange, decoder, encoder

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
encoder : SeekRange -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "end", Json.Encode.float x.end )
        , ( "start", Json.Encode.float x.start )
        ]
