module Jawa.Event.PipLeave exposing (PipLeave, decoder, encode)

{-|

@docs PipLeave, decoder, encode

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
encode : PipLeave -> Json.Encode.Value
encode _ =
    Json.Encode.object
        []
