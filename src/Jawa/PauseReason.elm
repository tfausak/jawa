module Jawa.PauseReason exposing (PauseReason(..), decoder, encode)

{-|

@docs PauseReason, decoder, encode

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
            Err <| "unknown PauseReason: " ++ string


{-| A JSON encoder.
-}
encode : PauseReason -> Json.Encode.Value
encode =
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
