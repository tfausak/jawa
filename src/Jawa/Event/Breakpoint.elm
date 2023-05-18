module Jawa.Event.Breakpoint exposing (Breakpoint, decoder, encode, tag)

{-|

@docs Breakpoint, decoder, encode, tag

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
encode : Breakpoint -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "breakpoint", Json.Encode.int x.breakpoint )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "breakpoint"
