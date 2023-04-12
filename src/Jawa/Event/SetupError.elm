module Jawa.Event.SetupError exposing (SetupError, decoder, encoder)

{-|

@docs SetupError, decoder, encoder

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
encoder : SetupError -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "code", Json.Encode.int x.code )
        , ( "message", Json.Encode.string x.message )
        ]
