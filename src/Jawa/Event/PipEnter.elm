module Jawa.Event.PipEnter exposing (PipEnter, decoder, encode, tag)

{-|

@docs PipEnter, decoder, encode, tag

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


{-| The tag that describes this type.
-}
tag : String
tag =
    "pipEnter"
