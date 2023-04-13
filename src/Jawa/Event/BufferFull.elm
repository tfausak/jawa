module Jawa.Event.BufferFull exposing (BufferFull(..), decoder, encoder)

{-|

@docs BufferFull, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type BufferFull
    = BufferFull


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder BufferFull
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always BufferFull)


{-| A JSON encoder.
-}
encoder : BufferFull -> Json.Encode.Value
encoder _ =
    Json.Encode.object
        []
