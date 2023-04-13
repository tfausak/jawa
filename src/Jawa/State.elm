module Jawa.State exposing (State(..), decoder, encoder)

{-|

@docs State, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| This type is not documented.
-}
type State
    = Buffering
    | Complete
    | Error
    | Idle
    | Loading
    | Paused
    | Playing
    | Stalled


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder State
decoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\string ->
                case string of
                    "buffering" ->
                        Json.Decode.succeed Buffering

                    "complete" ->
                        Json.Decode.succeed Complete

                    "error" ->
                        Json.Decode.succeed Error

                    "idle" ->
                        Json.Decode.succeed Idle

                    "loading" ->
                        Json.Decode.succeed Loading

                    "paused" ->
                        Json.Decode.succeed Paused

                    "playing" ->
                        Json.Decode.succeed Playing

                    "stalled" ->
                        Json.Decode.succeed Stalled

                    _ ->
                        Json.Decode.fail <| "invalid State: " ++ string
            )


{-| A JSON encoder.
-}
encoder : State -> Json.Encode.Value
encoder viewable =
    case viewable of
        Buffering ->
            Json.Encode.string "buffering"

        Complete ->
            Json.Encode.string "complete"

        Error ->
            Json.Encode.string "error"

        Idle ->
            Json.Encode.string "idle"

        Loading ->
            Json.Encode.string "loading"

        Paused ->
            Json.Encode.string "paused"

        Playing ->
            Json.Encode.string "playing"

        Stalled ->
            Json.Encode.string "stalled"
