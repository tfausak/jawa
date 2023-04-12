module Jawa.Event exposing (Event(..), decoder, encoder)

{-|

@docs Event, decoder, encoder

-}

import Dict
import Jawa.Event.Breakpoint as Breakpoint
import Jawa.Event.BufferFull as BufferFull
import Jawa.Event.Click as Click
import Jawa.Event.DisplayClick as DisplayClick
import Jawa.Event.FirstFrame as FirstFrame
import Jawa.Event.Fullscreen as Fullscreen
import Jawa.Event.ProviderFirstFrame as ProviderFirstFrame
import Jawa.Event.Ready as Ready
import Jawa.Event.Remove as Remove
import Jawa.Event.Seeked as Seeked
import Jawa.Event.SetupError as SetupError
import Jawa.Event.UserActive as UserActive
import Jawa.Event.UserInactive as UserInactive
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/onall>
-}
type Event
    = Breakpoint Breakpoint.Breakpoint
    | BufferFull BufferFull.BufferFull
    | Click Click.Click
    | DisplayClick DisplayClick.DisplayClick
    | FirstFrame FirstFrame.FirstFrame
    | Fullscreen Fullscreen.Fullscreen
    | ProviderFirstFrame ProviderFirstFrame.ProviderFirstFrame
    | Ready Ready.Ready
    | Remove Remove.Remove
    | Seeked Seeked.Seeked
    | SetupError SetupError.SetupError
    | UserActive UserActive.UserActive
    | UserInactive UserInactive.UserInactive


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Event
decoder =
    Json.Decode.field "type" Json.Decode.string
        |> Json.Decode.andThen decoderWith


decoderWith : String -> Json.Decode.Decoder Event
decoderWith string =
    case string of
        "bufferFull" ->
            Json.Decode.map BufferFull BufferFull.decoder

        "breakpoint" ->
            Json.Decode.map Breakpoint Breakpoint.decoder

        "click" ->
            Json.Decode.map Click Click.decoder

        "displayClick" ->
            Json.Decode.map DisplayClick DisplayClick.decoder

        "firstFrame" ->
            Json.Decode.map FirstFrame FirstFrame.decoder

        "fullscreen" ->
            Json.Decode.map Fullscreen Fullscreen.decoder

        "providerFirstFrame" ->
            Json.Decode.map ProviderFirstFrame ProviderFirstFrame.decoder

        "ready" ->
            Json.Decode.map Ready Ready.decoder

        "remove" ->
            Json.Decode.map Remove Remove.decoder

        "seeked" ->
            Json.Decode.map Seeked Seeked.decoder

        "setupError" ->
            Json.Decode.map SetupError SetupError.decoder

        "userActive" ->
            Json.Decode.map UserActive UserActive.decoder

        "userInactive" ->
            Json.Decode.map UserInactive UserInactive.decoder

        _ ->
            Json.Decode.fail <| "invalid Event: " ++ string


{-| A JSON encoder.
-}
encoder : Event -> Json.Encode.Value
encoder event =
    case event of
        Breakpoint x ->
            encoderWith "breakpoint" Breakpoint.encoder x

        BufferFull x ->
            encoderWith "bufferFull" BufferFull.encoder x

        Click x ->
            encoderWith "click" Click.encoder x

        DisplayClick x ->
            encoderWith "displayClick" DisplayClick.encoder x

        FirstFrame x ->
            encoderWith "firstFrame" FirstFrame.encoder x

        Fullscreen x ->
            encoderWith "fullscreen" Fullscreen.encoder x

        ProviderFirstFrame x ->
            encoderWith "providerFirstFrame" ProviderFirstFrame.encoder x

        Ready x ->
            encoderWith "ready" Ready.encoder x

        Remove x ->
            encoderWith "remove" Remove.encoder x

        Seeked x ->
            encoderWith "seeked" Seeked.encoder x

        SetupError x ->
            encoderWith "setupError" SetupError.encoder x

        UserActive x ->
            encoderWith "userActive" UserActive.encoder x

        UserInactive x ->
            encoderWith "userInactive" UserInactive.encoder x


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
