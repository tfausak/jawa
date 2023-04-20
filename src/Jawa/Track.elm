module Jawa.Track exposing (Track, decoder, encoder)

{-|

@docs Track, decoder, encoder

-}

import Jawa.TrackKind as TK
import Json.Decode
import Json.Encode


{-| This type is not documented.
-}
type alias Track =
    { file : String
    , kind : TK.TrackKind
    , label : String
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Track
decoder =
    Json.Decode.map3 Track
        (Json.Decode.field "file" Json.Decode.string)
        (Json.Decode.field "kind" TK.decoder)
        (Json.Decode.field "label" Json.Decode.string)


{-| A JSON encoder.
-}
encoder : Track -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "file", Json.Encode.string x.file )
        , ( "kind", TK.encoder x.kind )
        , ( "label", Json.Encode.string x.label )
        ]
