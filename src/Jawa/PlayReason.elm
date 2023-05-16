module Jawa.PlayReason exposing (PlayReason(..), decoder, encoder)

{-|

@docs PlayReason, decoder, encoder

-}

import Json.Decode
import Json.Decode.Extra
import Json.Encode


{-| This type is not documented.
-}
type PlayReason
    = Autostart
    | External
    | Interaction
    | Playlist
    | RelatedAuto
    | RelatedInteraction


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder PlayReason
decoder =
    Json.Decode.string
        |> Json.Decode.andThen (fromString >> Json.Decode.Extra.fromResult)


fromString : String -> Result String PlayReason
fromString string =
    case string of
        "autostart" ->
            Ok Autostart

        "external" ->
            Ok External

        "interaction" ->
            Ok Interaction

        "playlist" ->
            Ok Playlist

        "related-auto" ->
            Ok RelatedAuto

        "related-interaction" ->
            Ok RelatedInteraction

        _ ->
            Err <| "invalid PlayReason: " ++ string


{-| A JSON encoder.
-}
encoder : PlayReason -> Json.Encode.Value
encoder =
    toString >> Json.Encode.string


toString : PlayReason -> String
toString x =
    case x of
        Autostart ->
            "autostart"

        External ->
            "external"

        Interaction ->
            "interaction"

        Playlist ->
            "playlist"

        RelatedAuto ->
            "related-auto"

        RelatedInteraction ->
            "related-interaction"
