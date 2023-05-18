module Jawa.Event.Fullscreen exposing (Fullscreen, decoder, encode, tag)

{-|

@docs Fullscreen, decoder, encode, tag

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
encode : Fullscreen -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "fullscreen", Json.Encode.bool x.fullscreen )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "fullscreen"
