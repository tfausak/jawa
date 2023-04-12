module Jawa.Event exposing (Event(..), decoder, encoder)

{-|

@docs Event, decoder, encoder

-}

import Dict
import Jawa.Event.Ready as Ready
import Jawa.Event.Remove as Remove
import Jawa.Event.SetupError as SetupError
import Jawa.Event.UserActive as UserActive
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/onall>
-}
type Event
    = Ready Ready.Ready
    | Remove Remove.Remove
    | SetupError SetupError.SetupError
    | UserActive UserActive.UserActive


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Event
decoder =
    Json.Decode.field "type" Json.Decode.string
        |> Json.Decode.andThen decoderWith


decoderWith : String -> Json.Decode.Decoder Event
decoderWith string =
    case string of
        "ready" ->
            Json.Decode.map Ready Ready.decoder

        "remove" ->
            Json.Decode.map Remove Remove.decoder

        "setupError" ->
            Json.Decode.map SetupError SetupError.decoder

        "userActive" ->
            Json.Decode.map UserActive UserActive.decoder

        _ ->
            Json.Decode.fail <| "invalid Event: " ++ string


{-| A JSON encoder.
-}
encoder : Event -> Json.Encode.Value
encoder event =
    case event of
        Ready x ->
            encoderWith "ready" Ready.encoder x

        Remove x ->
            encoderWith "remove" Remove.encoder x

        SetupError x ->
            encoderWith "setupError" SetupError.encoder x

        UserActive x ->
            encoderWith "userActive" UserActive.encoder x


encoderWith : String -> (a -> Json.Decode.Value) -> a -> Json.Encode.Value
encoderWith t f x =
    let
        json : Json.Encode.Value
        json =
            f x

        key : String
        key =
            "type"

        value : Json.Encode.Value
        value =
            Json.Encode.string t
    in
    case Json.Decode.decodeValue (Json.Decode.dict Json.Decode.value) json of
        Ok dict ->
            Json.Encode.dict identity identity (Dict.insert key value dict)

        Err _ ->
            Json.Encode.object
                [ ( key, value )
                , ( "value", json )
                ]
