module Jawa.Event.Ready exposing (Ready, decoder, encode)

{-|

@docs Ready, decoder, encode

-}

import Jawa.Viewable
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/events-1#onready>
-}
type alias Ready =
    { setupTime : Float
    , viewable : Jawa.Viewable.Viewable
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Ready
decoder =
    Json.Decode.map2 Ready
        (Json.Decode.field "setupTime" Json.Decode.float)
        (Json.Decode.field "viewable" Jawa.Viewable.decoder)


{-| A JSON encoder.
-}
encode : Ready -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "setupTime", Json.Encode.float x.setupTime )
        , ( "viewable", Jawa.Viewable.encode x.viewable )
        ]
