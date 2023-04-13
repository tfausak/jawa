module Jawa.Event.UserInactive exposing (UserInactive(..), decoder, encoder)

{-|

@docs UserInactive, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type UserInactive
    = UserInactive


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder UserInactive
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always UserInactive)


{-| A JSON encoder.
-}
encoder : UserInactive -> Json.Encode.Value
encoder _ =
    Json.Encode.object
        []
