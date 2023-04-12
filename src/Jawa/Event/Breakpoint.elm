module Jawa.Event.Breakpoint exposing (Breakpoint, decoder, encoder)

{-|

@docs Breakpoint, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias Breakpoint =
    { breakpoint : Int
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Breakpoint
decoder =
    Json.Decode.map Breakpoint
        (Json.Decode.field "breakpoint" Json.Decode.int)


{-| A JSON encoder.
-}
encoder : Breakpoint -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "breakpoint", Json.Encode.int x.breakpoint )
        ]
