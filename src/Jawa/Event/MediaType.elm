module Jawa.Event.MediaType exposing (MediaType, decoder, encoder)

{-|

@docs MediaType, decoder, encoder

-}

import Jawa.MediaType
import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias MediaType =
    { mediaType : Jawa.MediaType.MediaType
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder MediaType
decoder =
    Json.Decode.map MediaType
        (Json.Decode.field "mediaType" Jawa.MediaType.decoder)


{-| A JSON encoder.
-}
encoder : MediaType -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "mediaType", Jawa.MediaType.encoder x.mediaType )
        ]
