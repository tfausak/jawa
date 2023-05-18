module Jawa.Event.Click exposing (Click, decoder, encode, tag)

{-|

@docs Click, decoder, encode, tag

-}

import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias Click =
    { isTrusted : Bool
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Click
decoder =
    Json.Decode.map Click
        (Json.Decode.field "isTrusted" Json.Decode.bool)


{-| A JSON encoder.
-}
encode : Click -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "isTrusted", Json.Encode.bool x.isTrusted )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "click"
