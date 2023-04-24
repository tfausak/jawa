module Jawa.Event.PlaylistItem exposing (PlaylistItem, decoder, encoder)

{-|

@docs PlaylistItem, decoder, encoder

-}

import Jawa.PlaylistItem as PI
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playlist-events#onplaylistitem>
-}
type alias PlaylistItem =
    { index : Int
    , item : PI.PlaylistItem
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder PlaylistItem
decoder =
    Json.Decode.map2 PlaylistItem
        (Json.Decode.field "index" Json.Decode.int)
        (Json.Decode.field "item" PI.decoder)


{-| A JSON encoder.
-}
encoder : PlaylistItem -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "index", Json.Encode.int x.index )
        , ( "item", PI.encoder x.item )
        ]
