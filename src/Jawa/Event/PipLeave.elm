module Jawa.Event.PipLeave exposing (PipLeave, decoder, encoder)

{-|

@docs PipLeave, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias PipLeave =
    {}


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder PipLeave
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always {})


{-| A JSON encoder.
-}
encoder : PipLeave -> Json.Encode.Value
encoder _ =
    Json.Encode.object
        []
