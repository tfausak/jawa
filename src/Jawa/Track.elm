module Jawa.Track exposing (Track, decoder, encode)

{-|

@docs Track, decoder, encode

-}

import Jawa.TrackKind
import Json.Decode
import Json.Decode.Extra
import Json.Encode
import Maybe.Extra


{-| This type is not documented.
-}
type alias Track =
    { file : String
    , kind : Jawa.TrackKind.TrackKind
    , label : Maybe String
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Track
decoder =
    Json.Decode.map3 Track
        (Json.Decode.field "file" Json.Decode.string)
        (Json.Decode.field "kind" Jawa.TrackKind.decoder)
        (Json.Decode.Extra.optionalNullableField "label" Json.Decode.string)


{-| A JSON encoder.
-}
encode : Track -> Json.Encode.Value
encode x =
    [ Just ( "file", Json.Encode.string x.file )
    , Just ( "kind", Jawa.TrackKind.encode x.kind )
    , Maybe.map (Json.Encode.string >> Tuple.pair "label") x.label
    ]
        |> Maybe.Extra.values
        |> Json.Encode.object
