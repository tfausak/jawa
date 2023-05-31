module Jawa.Event.PlayAttempt exposing (PlayAttempt, decoder, encode, tag)

{-|

@docs PlayAttempt, decoder, encode, tag

-}

import Jawa.PlayReason
import Jawa.PlaylistItem
import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias PlayAttempt =
    { item : Jawa.PlaylistItem.PlaylistItem
    , playReason : Jawa.PlayReason.PlayReason
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder PlayAttempt
decoder =
    Json.Decode.map2 PlayAttempt
        (Json.Decode.field "item" Jawa.PlaylistItem.decoder)
        (Json.Decode.field "playReason" Jawa.PlayReason.decoder)


{-| A JSON encoder.
-}
encode : PlayAttempt -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "item", Jawa.PlaylistItem.encode x.item )
        , ( "playReason", Jawa.PlayReason.encode x.playReason )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "playAttempt"
