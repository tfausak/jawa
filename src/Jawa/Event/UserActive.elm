module Jawa.Event.UserActive exposing (UserActive, decoder, encode)

{-|

@docs UserActive, decoder, encode

-}

import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias UserActive =
    {}


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder UserActive
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always {})


{-| A JSON encoder.
-}
encode : UserActive -> Json.Encode.Value
encode _ =
    Json.Encode.object
        []
