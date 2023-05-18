module Jawa.Event.BufferFull exposing (BufferFull, decoder, encode, tag)

{-|

@docs BufferFull, decoder, encode, tag

-}

import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias BufferFull =
    {}


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder BufferFull
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always {})


{-| A JSON encoder.
-}
encode : BufferFull -> Json.Encode.Value
encode _ =
    Json.Encode.object
        []


{-| The tag that describes this type.
-}
tag : String
tag =
    "bufferFull"
