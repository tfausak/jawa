module Jawa.Event.Ready exposing (Ready, decoder, encoder)

{-|

@docs Ready, decoder, encoder

-}

import Jawa.Visibility as Visibility
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/events-1#onready>
-}
type alias Ready =
    { setupTime : Float
    , viewable : Visibility.Visibility
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Ready
decoder =
    Json.Decode.map2 Ready
        (Json.Decode.field "setupTime" Json.Decode.float)
        (Json.Decode.field "viewable" Visibility.decoder)


{-| A JSON encoder.
-}
encoder : Ready -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "setupTime", Json.Encode.float x.setupTime )
        , ( "viewable", Visibility.encoder x.viewable )
        ]
