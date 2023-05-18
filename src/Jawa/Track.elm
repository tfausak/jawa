module Jawa.Track exposing (Track, decoder, encode)

{-|

@docs Track, decoder, encode

-}

import Jawa.TrackKind
import Json.Decode
import Json.Encode


{-| This type is not documented.
-}
type alias Track =
    { file : String
    , kind : Jawa.TrackKind.TrackKind
    , label : String
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Track
decoder =
    Json.Decode.map3 Track
        (Json.Decode.field "file" Json.Decode.string)
        (Json.Decode.field "kind" Jawa.TrackKind.decoder)
        (Json.Decode.field "label" Json.Decode.string)


{-| A JSON encoder.
-}
encode : Track -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "file", Json.Encode.string x.file )
        , ( "kind", Jawa.TrackKind.encode x.kind )
        , ( "label", Json.Encode.string x.label )
        ]
