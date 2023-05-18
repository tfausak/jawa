module Jawa.Event.PipEnter exposing (PipEnter, decoder, encode)

{-|

@docs PipEnter, decoder, encode

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
encode : PipEnter -> Json.Encode.Value
encode _ =
    Json.Encode.object
        []
