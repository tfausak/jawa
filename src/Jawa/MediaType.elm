module Jawa.MediaType exposing (MediaType(..), decoder, encoder)

{-|

@docs MediaType, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| This type is not documented.
-}
type MediaType
    = Audio
    | Video


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder MediaType
decoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\string ->
                case string of
                    "audio" ->
                        Json.Decode.succeed Audio

                    "video" ->
                        Json.Decode.succeed Video

                    _ ->
                        Json.Decode.fail <| "invalid MediaType: " ++ string
            )


{-| A JSON encoder.
-}
encoder : MediaType -> Json.Encode.Value
encoder viewable =
    case viewable of
        Audio ->
            Json.Encode.string "audio"

        Video ->
            Json.Encode.string "video"
