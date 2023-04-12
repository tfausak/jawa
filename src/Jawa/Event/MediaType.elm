module Jawa.Event.MediaType exposing (MediaType, decoder, encoder)

{-|

@docs MediaType, decoder, encoder

-}

import Jawa.MediaType as MediaType
import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias MediaType =
    { mediaType : MediaType.MediaType
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder MediaType
decoder =
    Json.Decode.map MediaType
        (Json.Decode.field "mediaType" MediaType.decoder)


{-| A JSON encoder.
-}
encoder : MediaType -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "mediaType", MediaType.encoder x.mediaType )
        ]
