module Jawa.PlaylistItem exposing (PlaylistItem, decoder, encoder)

{-|

@docs PlaylistItem, decoder, encoder

-}

import Jawa.Preload as P
import Json.Decode
import Json.Decode.Extra
import Json.Encode
import Json.Encode.Extra


{-| <https://docs.jwplayer.com/players/reference/playlist-events>
-}
type alias PlaylistItem =
    { description : Maybe String
    , file : String
    , image : Maybe String
    , mediaId : Maybe String
    , preload : P.Preload
    , title : Maybe String

    -- , allSources : List Source -- { file, label, type, default (bool) }
    -- , feedData : {} -- is anything ever in this?
    -- , sources : List Source -- singleton?
    -- , tracks : List Track -- { file, label, kind (captions, chapters, thumbnails) }
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder PlaylistItem
decoder =
    Json.Decode.map6 PlaylistItem
        (Json.Decode.Extra.optionalNullableField "description" Json.Decode.string)
        (Json.Decode.field "file" Json.Decode.string)
        (Json.Decode.Extra.optionalNullableField "image" Json.Decode.string)
        (Json.Decode.Extra.optionalNullableField "mediaId" Json.Decode.string)
        (Json.Decode.field "preload" P.decoder)
        (Json.Decode.Extra.optionalNullableField "title" Json.Decode.string)


{-| A JSON encoder.
-}
encoder : PlaylistItem -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "description", Json.Encode.Extra.maybe Json.Encode.string x.description )
        , ( "file", Json.Encode.string x.file )
        , ( "image", Json.Encode.Extra.maybe Json.Encode.string x.image )
        , ( "mediaId", Json.Encode.Extra.maybe Json.Encode.string x.mediaId )
        , ( "preload", P.encoder x.preload )
        , ( "title", Json.Encode.Extra.maybe Json.Encode.string x.title )
        ]
