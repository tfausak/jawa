module Jawa.TrackKind exposing (TrackKind(..), decoder, encoder)

{-|

@docs TrackKind, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| This type is not documented.
-}
type TrackKind
    = Captions
    | Chapters
    | Thumbnails


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder TrackKind
decoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\string ->
                case string of
                    "captions" ->
                        Json.Decode.succeed Captions

                    "chapters" ->
                        Json.Decode.succeed Chapters

                    "thumbnails" ->
                        Json.Decode.succeed Thumbnails

                    _ ->
                        Json.Decode.fail <| "invalid TrackKind: " ++ string
            )


{-| A JSON encoder.
-}
encoder : TrackKind -> Json.Encode.Value
encoder viewable =
    case viewable of
        Captions ->
            Json.Encode.string "captions"

        Chapters ->
            Json.Encode.string "chapters"

        Thumbnails ->
            Json.Encode.string "thumbnails"
