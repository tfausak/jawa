module Jawa.Event.Playlist exposing (Playlist, decoder, encode)

{-|

@docs Playlist, decoder, encode

-}

import Jawa.PlaylistItem
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playlist-events#onplaylist>
-}
type alias Playlist =
    { playlist : List Jawa.PlaylistItem.PlaylistItem
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Playlist
decoder =
    Json.Decode.map Playlist
        (Json.Decode.field "playlist" (Json.Decode.list Jawa.PlaylistItem.decoder))


{-| A JSON encoder.
-}
encode : Playlist -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "playlist", Json.Encode.list Jawa.PlaylistItem.encode x.playlist )
        ]
