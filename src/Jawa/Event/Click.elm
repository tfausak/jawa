module Jawa.Event.Click exposing (Click, decoder, encoder)

{-|

@docs Click, decoder, encoder

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
encoder : Click -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "isTrusted", Json.Encode.bool x.isTrusted )
        ]
