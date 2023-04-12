module Jawa.Visibility exposing (Visibility(..), decoder, encoder)

{-|

@docs Visibility, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/viewability-events-1#onviewable>
-}
type Visibility
    = Hidden
    | Visible


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Visibility
decoder =
    Json.Decode.int
        |> Json.Decode.andThen
            (\int ->
                case int of
                    0 ->
                        Json.Decode.succeed Hidden

                    1 ->
                        Json.Decode.succeed Visible

                    _ ->
                        Json.Decode.fail <| "invalid Visibility: " ++ String.fromInt int
            )


{-| A JSON encoder.
-}
encoder : Visibility -> Json.Encode.Value
encoder visibility =
    case visibility of
        Hidden ->
            Json.Encode.int 0

        Visible ->
            Json.Encode.int 1
