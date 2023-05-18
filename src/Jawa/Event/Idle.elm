module Jawa.Event.Idle exposing (Idle, decoder, encode, tag)

{-|

@docs Idle, decoder, encode, tag

-}

import Jawa.State
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playback-events-1#onidle>
-}
type alias Idle =
    { newstate : Jawa.State.State
    , oldstate : Jawa.State.State
    , reason : Jawa.State.State
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Idle
decoder =
    Json.Decode.map3 Idle
        (Json.Decode.field "newstate" Jawa.State.decoder)
        (Json.Decode.field "oldstate" Jawa.State.decoder)
        (Json.Decode.field "reason" Jawa.State.decoder)


{-| A JSON encoder.
-}
encode : Idle -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "newstate", Jawa.State.encode x.newstate )
        , ( "oldstate", Jawa.State.encode x.oldstate )
        , ( "reason", Jawa.State.encode x.reason )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "idle"
