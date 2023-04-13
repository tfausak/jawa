module Jawa.PlayReason exposing (PlayReason(..), decoder, encoder)

{-|

@docs PlayReason, decoder, encoder

-}

import Json.Decode
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
        |> Json.Decode.andThen
            (\string ->
                case string of
                    "autostart" ->
                        Json.Decode.succeed Autostart

                    "external" ->
                        Json.Decode.succeed External

                    "interaction" ->
                        Json.Decode.succeed Interaction

                    "playlist" ->
                        Json.Decode.succeed Playlist

                    "related-auto" ->
                        Json.Decode.succeed RelatedAuto

                    "related-interaction" ->
                        Json.Decode.succeed RelatedInteraction

                    _ ->
                        Json.Decode.fail <| "invalid PlayReason: " ++ string
            )


{-| A JSON encoder.
-}
encoder : PlayReason -> Json.Encode.Value
encoder viewable =
    case viewable of
        Autostart ->
            Json.Encode.string "autostart"

        External ->
            Json.Encode.string "external"

        Interaction ->
            Json.Encode.string "interaction"

        Playlist ->
            Json.Encode.string "playlist"

        RelatedAuto ->
            Json.Encode.string "related-auto"

        RelatedInteraction ->
            Json.Encode.string "related-interaction"
