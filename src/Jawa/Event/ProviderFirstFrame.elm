module Jawa.Event.ProviderFirstFrame exposing (ProviderFirstFrame, decoder, encode)

{-|

@docs ProviderFirstFrame, decoder, encode

-}

import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias ProviderFirstFrame =
    {}


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder ProviderFirstFrame
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always {})


{-| A JSON encoder.
-}
encode : ProviderFirstFrame -> Json.Encode.Value
encode _ =
    Json.Encode.object
        []
