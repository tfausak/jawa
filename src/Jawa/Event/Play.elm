module Jawa.Event.Play exposing (Play, decoder, encode, tag)

{-|

@docs Play, decoder, encode, tag

-}

import Jawa.PlayReason
import Jawa.State
import Jawa.Viewable
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playback-events-1#onpause>
-}
type alias Play =
    { newstate : Jawa.State.State
    , oldstate : Jawa.State.State
    , playReason : Jawa.PlayReason.PlayReason
    , reason : Jawa.State.State
    , viewable : Jawa.Viewable.Viewable
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Play
decoder =
    Json.Decode.map5 Play
        (Json.Decode.field "newstate" Jawa.State.decoder)
        (Json.Decode.field "oldstate" Jawa.State.decoder)
        (Json.Decode.field "playReason" Jawa.PlayReason.decoder)
        (Json.Decode.field "reason" Jawa.State.decoder)
        (Json.Decode.field "viewable" Jawa.Viewable.decoder)


{-| A JSON encoder.
-}
encode : Play -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "newstate", Jawa.State.encode x.newstate )
        , ( "oldstate", Jawa.State.encode x.oldstate )
        , ( "playReason", Jawa.PlayReason.encode x.playReason )
        , ( "reason", Jawa.State.encode x.reason )
        , ( "viewable", Jawa.Viewable.encode x.viewable )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "play"
