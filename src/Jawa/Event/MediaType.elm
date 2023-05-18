module Jawa.Event.MediaType exposing (MediaType, decoder, encode)

{-|

@docs MediaType, decoder, encode

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
encode : MediaType -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "mediaType", Jawa.MediaType.encode x.mediaType )
        ]
