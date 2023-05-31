module Jawa.SubtitleTrack exposing (SubtitleTrack, decoder, encode)

{-|

@docs SubtitleTrack, decoder, encode

-}

import Jawa.Metadata
import Json.Decode
import Json.Decode.Extra
import Json.Encode
import Maybe.Extra


{-| This type is not documented.
-}
type alias SubtitleTrack =
    { data : List Jawa.Metadata.Metadata
    , default : Bool
    , id : String
    , kind : Maybe String
    , label : Maybe String
    , name : String
    , subtitleTrack : Jawa.Metadata.Metadata
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder SubtitleTrack
decoder =
    Json.Decode.map7 SubtitleTrack
        (Json.Decode.field "data" (Json.Decode.list Jawa.Metadata.decoder))
        (Json.Decode.field "default" Json.Decode.bool)
        (Json.Decode.field "_id" Json.Decode.string)
        (Json.Decode.Extra.optionalNullableField "kind" Json.Decode.string)
        (Json.Decode.Extra.optionalNullableField "label" Json.Decode.string)
        (Json.Decode.field "name" Json.Decode.string)
        (Json.Decode.field "subtitleTrack" Jawa.Metadata.decoder)


{-| A JSON encoder.
-}
encode : SubtitleTrack -> Json.Encode.Value
encode x =
    [ Just ( "data", Json.Encode.list Jawa.Metadata.encode x.data )
    , Just ( "default", Json.Encode.bool x.default )
    , Just ( "_id", Json.Encode.string x.id )
    , Maybe.map (Json.Encode.string >> Tuple.pair "kind") x.kind
    , Maybe.map (Json.Encode.string >> Tuple.pair "label") x.label
    , Just ( "name", Json.Encode.string x.name )
    , Just ( "subtitleTrack", Jawa.Metadata.encode x.subtitleTrack )
    ]
        |> Maybe.Extra.values
        |> Json.Encode.object
