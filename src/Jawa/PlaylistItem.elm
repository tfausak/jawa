module Jawa.PlaylistItem exposing (PlaylistItem, decoder, encoder)

{-|

@docs PlaylistItem, decoder, encoder

-}

import Jawa.Preload
import Jawa.Source
import Jawa.Track
import Json.Decode
import Json.Decode.Extra
import Json.Encode
import Json.Encode.Extra


{-| <https://docs.jwplayer.com/players/reference/playlist-events>
-}
type alias PlaylistItem =
    { allSources : List Jawa.Source.Source
    , description : Maybe String
    , file : String
    , image : Maybe String
    , mediaId : Maybe String
    , preload : Jawa.Preload.Preload
    , sources : List Jawa.Source.Source
    , title : Maybe String
    , tracks : List Jawa.Track.Track
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder PlaylistItem
decoder =
    Json.Decode.succeed PlaylistItem
        |> Json.Decode.Extra.andMap (Json.Decode.field "allSources" (Json.Decode.list Jawa.Source.decoder))
        |> Json.Decode.Extra.andMap (Json.Decode.Extra.optionalNullableField "description" Json.Decode.string)
        |> Json.Decode.Extra.andMap (Json.Decode.field "file" Json.Decode.string)
        |> Json.Decode.Extra.andMap (Json.Decode.Extra.optionalNullableField "image" Json.Decode.string)
        |> Json.Decode.Extra.andMap (Json.Decode.Extra.optionalNullableField "mediaId" Json.Decode.string)
        |> Json.Decode.Extra.andMap (Json.Decode.field "preload" Jawa.Preload.decoder)
        |> Json.Decode.Extra.andMap (Json.Decode.field "sources" (Json.Decode.list Jawa.Source.decoder))
        |> Json.Decode.Extra.andMap (Json.Decode.Extra.optionalNullableField "title" Json.Decode.string)
        |> Json.Decode.Extra.andMap (Json.Decode.field "tracks" (Json.Decode.list Jawa.Track.decoder))


{-| A JSON encoder.
-}
encoder : PlaylistItem -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "allSources", Json.Encode.list Jawa.Source.encoder x.allSources )
        , ( "description", Json.Encode.Extra.maybe Json.Encode.string x.description )
        , ( "file", Json.Encode.string x.file )
        , ( "image", Json.Encode.Extra.maybe Json.Encode.string x.image )
        , ( "mediaId", Json.Encode.Extra.maybe Json.Encode.string x.mediaId )
        , ( "preload", Jawa.Preload.encoder x.preload )
        , ( "sources", Json.Encode.list Jawa.Source.encoder x.sources )
        , ( "title", Json.Encode.Extra.maybe Json.Encode.string x.title )
        , ( "tracks", Json.Encode.list Jawa.Track.encoder x.tracks )
        ]
