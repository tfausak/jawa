module Jawa.Event.MediaType exposing (MediaType, decoder, encoder)

{-|

@docs MediaType, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias MediaType =
    { mediaType : String
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder MediaType
decoder =
    Json.Decode.map MediaType
        (Json.Decode.field "mediaType" Json.Decode.string)


{-| A JSON encoder.
-}
encoder : MediaType -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "mediaType", Json.Encode.string x.mediaType )
        ]
