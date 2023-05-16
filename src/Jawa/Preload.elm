module Jawa.Preload exposing (Preload(..), decoder, encoder)

{-|

@docs Preload, decoder, encoder

-}

import Json.Decode
import Json.Decode.Extra
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
        |> Json.Decode.andThen (fromString >> Json.Decode.Extra.fromResult)


fromString : String -> Result String Preload
fromString string =
    case string of
        "auto" ->
            Ok Auto

        "metadata" ->
            Ok Metadata

        "none" ->
            Ok None

        _ ->
            Err <| "invalid Preload: " ++ string


{-| A JSON encoder.
-}
encoder : Preload -> Json.Encode.Value
encoder =
    toString >> Json.Encode.string


toString : Preload -> String
toString x =
    case x of
        Auto ->
            "auto"

        Metadata ->
            "metadata"

        None ->
            "none"
