module Jawa.Event.PipLeave exposing (PipLeave, decoder, encode, tag)

{-|

@docs PipLeave, decoder, encode, tag

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


{-| The tag that describes this type.
-}
tag : String
tag =
    "pipLeave"
