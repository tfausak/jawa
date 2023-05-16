module Jawa.Event.Play exposing (Play, decoder, encoder)

{-|

@docs Play, decoder, encoder

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
encoder : Play -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "newstate", Jawa.State.encoder x.newstate )
        , ( "oldstate", Jawa.State.encoder x.oldstate )
        , ( "playReason", Jawa.PlayReason.encoder x.playReason )
        , ( "reason", Jawa.State.encoder x.reason )
        , ( "viewable", Jawa.Viewable.encoder x.viewable )
        ]
