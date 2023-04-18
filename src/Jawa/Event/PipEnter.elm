module Jawa.Event.PipEnter exposing (PipEnter, decoder, encoder)

{-|

@docs PipEnter, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias PipEnter =
    {}


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder PipEnter
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always {})


{-| A JSON encoder.
-}
encoder : PipEnter -> Json.Encode.Value
encoder _ =
    Json.Encode.object
        []
