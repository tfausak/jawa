module Jawa.Event.BeforePlay exposing (BeforePlay, decoder, encode)

{-|

@docs BeforePlay, decoder, encode

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
encode : BeforePlay -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "playReason", Jawa.PlayReason.encode x.playReason )
        , ( "viewable", Jawa.Viewable.encode x.viewable )
        ]
