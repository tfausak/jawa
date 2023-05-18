module Jawa.Event.ProviderFirstFrame exposing (ProviderFirstFrame, decoder, encode, tag)

{-|

@docs ProviderFirstFrame, decoder, encode, tag

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


{-| The tag that describes this type.
-}
tag : String
tag =
    "providerFirstFrame"
