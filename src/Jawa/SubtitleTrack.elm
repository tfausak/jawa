module Jawa.SubtitleTrack exposing (SubtitleTrack, decoder, encode)

{-|

@docs SubtitleTrack, decoder, encode

-}

import Jawa.Metadata
import Json.Decode
import Json.Encode


{-| This type is not documented.
-}
type alias SubtitleTrack =
    { data : List Jawa.Metadata.Metadata
    , default : Bool
    , id : String
    , kind : String
    , label : String
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
        (Json.Decode.field "kind" Json.Decode.string)
        (Json.Decode.field "label" Json.Decode.string)
        (Json.Decode.field "name" Json.Decode.string)
        (Json.Decode.field "subtitleTrack" Jawa.Metadata.decoder)


{-| A JSON encoder.
-}
encode : SubtitleTrack -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "data", Json.Encode.list Jawa.Metadata.encode x.data )
        , ( "default", Json.Encode.bool x.default )
        , ( "_id", Json.Encode.string x.id )
        , ( "kind", Json.Encode.string x.kind )
        , ( "label", Json.Encode.string x.label )
        , ( "name", Json.Encode.string x.name )
        , ( "subtitleTrack", Jawa.Metadata.encode x.subtitleTrack )
        ]
