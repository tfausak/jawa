module Jawa.Event.SetupError exposing (SetupError, decoder, encode, tag)

{-|

@docs SetupError, decoder, encode, tag

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/events-1#onsetuperror>
-}
type alias SetupError =
    { code : Int
    , message : String
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder SetupError
decoder =
    Json.Decode.map2 SetupError
        (Json.Decode.field "code" Json.Decode.int)
        (Json.Decode.field "message" Json.Decode.string)


{-| A JSON encoder.
-}
encode : SetupError -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "code", Json.Encode.int x.code )
        , ( "message", Json.Encode.string x.message )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "setupError"
