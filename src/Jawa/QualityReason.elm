module Jawa.QualityReason exposing (QualityReason(..), decoder, encoder)

{-|

@docs QualityReason, decoder, encoder

-}

import Json.Decode
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
        |> Json.Decode.andThen
            (\string ->
                case string of
                    "api" ->
                        Json.Decode.succeed Api

                    "auto" ->
                        Json.Decode.succeed Auto

                    "initial choice" ->
                        Json.Decode.succeed InitialChoice

                    _ ->
                        Json.Decode.fail <| "invalid QualityReason: " ++ string
            )


{-| A JSON encoder.
-}
encoder : QualityReason -> Json.Encode.Value
encoder viewable =
    case viewable of
        Api ->
            Json.Encode.string "api"

        Auto ->
            Json.Encode.string "auto"

        InitialChoice ->
            Json.Encode.string "initial choice"
