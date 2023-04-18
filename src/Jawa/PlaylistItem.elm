module Jawa.PlaylistItem exposing (PlaylistItem, decoder, encoder)

{-|

@docs PlaylistItem, decoder, encoder

-}

import Jawa.Preload as P
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playlist-events>
-}
type alias PlaylistItem =
    { preload : P.Preload

    -- , allSources : List Source -- { file, label, type, default (bool) }
    -- , description : Maybe String
    -- , feedData : {} -- is anything ever in this?
    -- , file : String
    -- , image : Maybe String
    -- , mediaId : Maybe String
    -- , sources : List Source -- singleton?
    -- , title : Maybe String
    -- , tracks : List Track -- { file, label, kind (captions, chapters, thumbnails) }
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder PlaylistItem
decoder =
    Json.Decode.map PlaylistItem
        (Json.Decode.field "preload" P.decoder)


{-| A JSON encoder.
-}
encoder : PlaylistItem -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "preload", P.encoder x.preload )
        ]
