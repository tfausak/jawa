module Jawa.QualityReason exposing (QualityReason(..), decoder, encoder)

{-|

@docs QualityReason, decoder, encoder

-}

import Json.Decode
import Json.Decode.Extra
import Json.Encode


{-| This type is not documented.
-}
type QualityReason
    = Api
    | Auto
    | InitialChoice


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder QualityReason
decoder =
    Json.Decode.string
        |> Json.Decode.andThen (fromString >> Json.Decode.Extra.fromResult)


fromString : String -> Result String QualityReason
fromString string =
    case string of
        "api" ->
            Ok Api

        "auto" ->
            Ok Auto

        "initial choice" ->
            Ok InitialChoice

        _ ->
            Err <| "invalid QualityReason: " ++ string


{-| A JSON encoder.
-}
encoder : QualityReason -> Json.Encode.Value
encoder =
    toString >> Json.Encode.string


toString : QualityReason -> String
toString x =
    case x of
        Api ->
            "api"

        Auto ->
            "auto"

        InitialChoice ->
            "initial choice"
