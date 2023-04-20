module Jawa.Source exposing (Source, decoder, encoder)

{-|

@docs Source, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| This type is not documented.
-}
type alias Source =
    { default : Bool
    , file : String
    , label : String
    , type_ : String
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Source
decoder =
    Json.Decode.map4 Source
        (Json.Decode.field "default" Json.Decode.bool)
        (Json.Decode.field "file" Json.Decode.string)
        (Json.Decode.field "label" Json.Decode.string)
        (Json.Decode.field "type" Json.Decode.string)


{-| A JSON encoder.
-}
encoder : Source -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "default", Json.Encode.bool x.default )
        , ( "file", Json.Encode.string x.file )
        , ( "label", Json.Encode.string x.label )
        , ( "type", Json.Encode.string x.type_ )
        ]
