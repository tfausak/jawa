module Jawa.QualityMode exposing (QualityMode(..), decoder, encoder)

{-|

@docs QualityMode, decoder, encoder

-}

import Json.Decode
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
        |> Json.Decode.andThen
            (\string ->
                case string of
                    "auto" ->
                        Json.Decode.succeed Auto

                    "manual" ->
                        Json.Decode.succeed Manual

                    _ ->
                        Json.Decode.fail <| "invalid QualityMode: " ++ string
            )


{-| A JSON encoder.
-}
encoder : QualityMode -> Json.Encode.Value
encoder viewable =
    case viewable of
        Auto ->
            Json.Encode.string "auto"

        Manual ->
            Json.Encode.string "manual"
