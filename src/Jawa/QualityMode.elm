module Jawa.QualityMode exposing (QualityMode(..), decoder, encoder)

{-|

@docs QualityMode, decoder, encoder

-}

import Json.Decode
import Json.Decode.Extra
import Json.Encode


{-| This type is not documented.
-}
type QualityMode
    = Auto
    | Manual


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder QualityMode
decoder =
    Json.Decode.string
        |> Json.Decode.andThen (fromString >> Json.Decode.Extra.fromResult)


fromString : String -> Result String QualityMode
fromString string =
    case string of
        "auto" ->
            Ok Auto

        "manual" ->
            Ok Manual

        _ ->
            Err <| "invalid QualityMode: " ++ string


{-| A JSON encoder.
-}
encoder : QualityMode -> Json.Encode.Value
encoder =
    toString >> Json.Encode.string


toString : QualityMode -> String
toString x =
    case x of
        Auto ->
            "auto"

        Manual ->
            "manual"
