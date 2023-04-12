module Jawa.Event.UserActive exposing (UserActive(..), decoder, encoder)

{-|

@docs UserActive, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type UserActive
    = UserActive


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder UserActive
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always UserActive)


{-| A JSON encoder.
-}
encoder : UserActive -> Json.Encode.Value
encoder _ =
    Json.Encode.object
        []
