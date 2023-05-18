module Jawa.Event.PlaylistItem exposing (PlaylistItem, decoder, encode)

{-|

@docs PlaylistItem, decoder, encode

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
encode : PlaylistItem -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "index", Json.Encode.int x.index )
        , ( "item", Jawa.PlaylistItem.encode x.item )
        ]
