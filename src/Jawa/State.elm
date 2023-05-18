module Jawa.State exposing (State(..), decoder, encode)

{-|

@docs State, decoder, encode

-}

import Json.Decode
import Json.Decode.Extra
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
        |> Json.Decode.andThen (fromString >> Json.Decode.Extra.fromResult)


fromString : String -> Result String State
fromString string =
    case string of
        "buffering" ->
            Ok Buffering

        "complete" ->
            Ok Complete

        "error" ->
            Ok Error

        "idle" ->
            Ok Idle

        "loading" ->
            Ok Loading

        "paused" ->
            Ok Paused

        "playing" ->
            Ok Playing

        "stalled" ->
            Ok Stalled

        _ ->
            Err <| "unknown State: " ++ string


{-| A JSON encoder.
-}
encode : State -> Json.Encode.Value
encode =
    toString >> Json.Encode.string


toString : State -> String
toString x =
    case x of
        Buffering ->
            "buffering"

        Complete ->
            "complete"

        Error ->
            "error"

        Idle ->
            "idle"

        Loading ->
            "loading"

        Paused ->
            "paused"

        Playing ->
            "playing"

        Stalled ->
            "stalled"
