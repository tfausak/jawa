module Jawa.QualityReason exposing (QualityReason(..), decoder, encode)

{-|

@docs QualityReason, decoder, encode

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
            Err <| "unknown QualityReason: " ++ string


{-| A JSON encoder.
-}
encode : QualityReason -> Json.Encode.Value
encode =
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
