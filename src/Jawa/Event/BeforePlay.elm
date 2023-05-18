module Jawa.Event.BeforePlay exposing (BeforePlay, decoder, encoder)

{-|

@docs BeforePlay, decoder, encoder

-}

import Jawa.PlayReason
import Jawa.Viewable
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/advertising-events#onbeforeplay>
-}
type alias BeforePlay =
    { playReason : Jawa.PlayReason.PlayReason
    , viewable : Jawa.Viewable.Viewable
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder BeforePlay
decoder =
    Json.Decode.map2 BeforePlay
        (Json.Decode.field "playReason" Jawa.PlayReason.decoder)
        (Json.Decode.field "viewable" Jawa.Viewable.decoder)


{-| A JSON encoder.
-}
encoder : BeforePlay -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "playReason", Jawa.PlayReason.encoder x.playReason )
        , ( "viewable", Jawa.Viewable.encoder x.viewable )
        ]
