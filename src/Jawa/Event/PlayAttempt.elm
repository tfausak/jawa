module Jawa.Event.PlayAttempt exposing (PlayAttempt, decoder, encode, tag)

{-|

@docs PlayAttempt, decoder, encode, tag

-}

import Jawa.PlayReason
import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias PlayAttempt =
    { playReason : Jawa.PlayReason.PlayReason

    -- TODO: item
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder PlayAttempt
decoder =
    Json.Decode.map PlayAttempt
        (Json.Decode.field "playReason" Jawa.PlayReason.decoder)


{-| A JSON encoder.
-}
encode : PlayAttempt -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "playReason", Jawa.PlayReason.encode x.playReason )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "playAttempt"
