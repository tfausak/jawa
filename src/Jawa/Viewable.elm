module Jawa.Viewable exposing (Viewable(..), decoder, encoder)

{-|

@docs Viewable, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/viewability-events-1#onviewable>
-}
type Viewable
    = Hidden
    | Visible


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Viewable
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
                        Json.Decode.fail <| "invalid Viewable: " ++ String.fromInt int
            )


{-| A JSON encoder.
-}
encoder : Viewable -> Json.Encode.Value
encoder viewable =
    case viewable of
        Hidden ->
            Json.Encode.int 0

        Visible ->
            Json.Encode.int 1
