module Jawa.Event.UserInactive exposing (UserInactive, decoder, encode)

{-|

@docs UserInactive, decoder, encode

-}

import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias UserInactive =
    {}


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder UserInactive
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always {})


{-| A JSON encoder.
-}
encode : UserInactive -> Json.Encode.Value
encode _ =
    Json.Encode.object
        []
