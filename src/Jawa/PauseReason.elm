module Jawa.PauseReason exposing (PauseReason(..), decoder, encoder)

{-|

@docs PauseReason, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| This type is not documented.
-}
type PauseReason
    = External
    | Interaction
    | Viewable


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder PauseReason
decoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\string ->
                case string of
                    "external" ->
                        Json.Decode.succeed External

                    "interaction" ->
                        Json.Decode.succeed Interaction

                    "viewable" ->
                        Json.Decode.succeed Viewable

                    _ ->
                        Json.Decode.fail <| "invalid PauseReason: " ++ string
            )


{-| A JSON encoder.
-}
encoder : PauseReason -> Json.Encode.Value
encoder viewable =
    case viewable of
        External ->
            Json.Encode.string "external"

        Interaction ->
            Json.Encode.string "interaction"

        Viewable ->
            Json.Encode.string "viewable"
