module Jawa.Preload exposing (Preload(..), decoder, encoder)

{-|

@docs Preload, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/platform/docs/players-customize-player-behaviors#media-preloading-options>
-}
type Preload
    = Auto
    | Metadata
    | None


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Preload
decoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\string ->
                case string of
                    "auto" ->
                        Json.Decode.succeed Auto

                    "metadata" ->
                        Json.Decode.succeed Metadata

                    "none" ->
                        Json.Decode.succeed None

                    _ ->
                        Json.Decode.fail <| "invalid Preload: " ++ string
            )


{-| A JSON encoder.
-}
encoder : Preload -> Json.Encode.Value
encoder viewable =
    case viewable of
        Auto ->
            Json.Encode.string "auto"

        Metadata ->
            Json.Encode.string "metadata"

        None ->
            Json.Encode.string "none"
