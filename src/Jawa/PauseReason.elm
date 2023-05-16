module Jawa.PauseReason exposing (PauseReason(..), decoder, encoder)

{-|

@docs PauseReason, decoder, encoder

-}

import Json.Decode
import Json.Decode.Extra
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
        |> Json.Decode.andThen (fromString >> Json.Decode.Extra.fromResult)


fromString : String -> Result String PauseReason
fromString string =
    case string of
        "external" ->
            Ok External

        "interaction" ->
            Ok Interaction

        "viewable" ->
            Ok Viewable

        _ ->
            Err <| "invalid PauseReason: " ++ string


{-| A JSON encoder.
-}
encoder : PauseReason -> Json.Encode.Value
encoder =
    toString >> Json.Encode.string


toString : PauseReason -> String
toString x =
    case x of
        External ->
            "external"

        Interaction ->
            "interaction"

        Viewable ->
            "viewable"
