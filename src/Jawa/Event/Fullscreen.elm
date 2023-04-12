module Jawa.Event.Fullscreen exposing (Fullscreen, decoder, encoder)

{-|

@docs Fullscreen, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/resize-eventsd#onfullscreen>
-}
type alias Fullscreen =
    { fullscreen : Bool
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Fullscreen
decoder =
    Json.Decode.map Fullscreen
        (Json.Decode.field "fullscreen" Json.Decode.bool)


{-| A JSON encoder.
-}
encoder : Fullscreen -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "fullscreen", Json.Encode.bool x.fullscreen )
        ]
