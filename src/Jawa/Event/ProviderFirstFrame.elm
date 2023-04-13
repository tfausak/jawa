module Jawa.Event.ProviderFirstFrame exposing (ProviderFirstFrame(..), decoder, encoder)

{-|

@docs ProviderFirstFrame, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type ProviderFirstFrame
    = ProviderFirstFrame


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder ProviderFirstFrame
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always ProviderFirstFrame)


{-| A JSON encoder.
-}
encoder : ProviderFirstFrame -> Json.Encode.Value
encoder _ =
    Json.Encode.object
        []
