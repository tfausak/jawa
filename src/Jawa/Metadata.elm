module Jawa.Metadata exposing (Metadata(..), decoder, encoder)

{-|

@docs Metadata, decoder, encoder

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
encoder : Metadata -> Json.Encode.Value
encoder (Metadata value) =
    value
