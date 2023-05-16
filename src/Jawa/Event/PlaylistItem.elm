module Jawa.Event.PlaylistItem exposing (PlaylistItem, decoder, encoder)

{-|

@docs PlaylistItem, decoder, encoder

-}

import Jawa.PlaylistItem
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playlist-events#onplaylistitem>
-}
type alias PlaylistItem =
    { index : Int
    , item : Jawa.PlaylistItem.PlaylistItem
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder PlaylistItem
decoder =
    Json.Decode.map2 PlaylistItem
        (Json.Decode.field "index" Json.Decode.int)
        (Json.Decode.field "item" Jawa.PlaylistItem.decoder)


{-| A JSON encoder.
-}
encoder : PlaylistItem -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "index", Json.Encode.int x.index )
        , ( "item", Jawa.PlaylistItem.encoder x.item )
        ]
