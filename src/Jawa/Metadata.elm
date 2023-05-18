module Jawa.Metadata exposing (Metadata(..), decoder, encode)

{-|

@docs Metadata, decoder, encode

-}

import Json.Decode
import Json.Encode


{-| This type is not documented.
-}
type Metadata
    = Metadata Json.Encode.Value


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Metadata
decoder =
    Json.Decode.map Metadata Json.Decode.value


{-| A JSON encoder.
-}
encode : Metadata -> Json.Encode.Value
encode (Metadata value) =
    value
