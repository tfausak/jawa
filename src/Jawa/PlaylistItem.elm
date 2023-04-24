module Jawa.PlaylistItem exposing (PlaylistItem, decoder, encoder)

{-|

@docs PlaylistItem, decoder, encoder

-}

import Jawa.Preload as P
import Jawa.Source as S
import Jawa.Track as T
import Json.Decode
import Json.Decode.Extra
import Json.Encode
import Json.Encode.Extra


{-| <https://docs.jwplayer.com/players/reference/playlist-events>
-}
type alias PlaylistItem =
    { allSources : List S.Source
    , description : Maybe String
    , file : String
    , image : Maybe String
    , mediaId : Maybe String
    , preload : P.Preload
    , sources : List S.Source
    , title : Maybe String
    , tracks : List T.Track
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder PlaylistItem
decoder =
    Json.Decode.succeed PlaylistItem
        |> Json.Decode.Extra.andMap (Json.Decode.field "allSources" (Json.Decode.list S.decoder))
        |> Json.Decode.Extra.andMap (Json.Decode.Extra.optionalNullableField "description" Json.Decode.string)
        |> Json.Decode.Extra.andMap (Json.Decode.field "file" Json.Decode.string)
        |> Json.Decode.Extra.andMap (Json.Decode.Extra.optionalNullableField "image" Json.Decode.string)
        |> Json.Decode.Extra.andMap (Json.Decode.Extra.optionalNullableField "mediaId" Json.Decode.string)
        |> Json.Decode.Extra.andMap (Json.Decode.field "preload" P.decoder)
        |> Json.Decode.Extra.andMap (Json.Decode.field "sources" (Json.Decode.list S.decoder))
        |> Json.Decode.Extra.andMap (Json.Decode.Extra.optionalNullableField "title" Json.Decode.string)
        |> Json.Decode.Extra.andMap (Json.Decode.field "tracks" (Json.Decode.list T.decoder))


{-| A JSON encoder.
-}
encoder : PlaylistItem -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "allSources", Json.Encode.list S.encoder x.allSources )
        , ( "description", Json.Encode.Extra.maybe Json.Encode.string x.description )
        , ( "file", Json.Encode.string x.file )
        , ( "image", Json.Encode.Extra.maybe Json.Encode.string x.image )
        , ( "mediaId", Json.Encode.Extra.maybe Json.Encode.string x.mediaId )
        , ( "preload", P.encoder x.preload )
        , ( "sources", Json.Encode.list S.encoder x.sources )
        , ( "title", Json.Encode.Extra.maybe Json.Encode.string x.title )
        , ( "tracks", Json.Encode.list T.encoder x.tracks )
        ]
