module Jawa.Event.Resize exposing (Resize, decoder, encoder)

{-|

@docs Resize, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/resize-eventsd#onresize>
-}
type alias Resize =
    { height : Int
    , width : Int
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Resize
decoder =
    Json.Decode.map2 Resize
        (Json.Decode.field "height" Json.Decode.int)
        (Json.Decode.field "width" Json.Decode.int)


{-| A JSON encoder.
-}
encoder : Resize -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "height", Json.Encode.int x.height )
        , ( "width", Json.Encode.int x.width )
        ]
