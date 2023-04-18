module Jawa.Event.Playlist exposing (Playlist, decoder, encoder)

{-|

@docs Playlist, decoder, encoder

-}

import Jawa.PlaylistItem as PI
import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias Playlist =
    { playlist : List PI.PlaylistItem
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Playlist
decoder =
    Json.Decode.map Playlist
        (Json.Decode.field "playlist" (Json.Decode.list PI.decoder))


{-| A JSON encoder.
-}
encoder : Playlist -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "playlist", Json.Encode.list PI.encoder x.playlist )
        ]
