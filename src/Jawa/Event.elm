module Jawa.Event exposing (Event(..), decoder, encoder)

{-|

@docs Event, decoder, encoder

-}

import Dict
import Jawa.Event.BeforeComplete as BeforeComplete
import Jawa.Event.Breakpoint as Breakpoint
import Jawa.Event.BufferChange as BufferChange
import Jawa.Event.BufferFull as BufferFull
import Jawa.Event.Click as Click
import Jawa.Event.Complete as Complete
import Jawa.Event.DisplayClick as DisplayClick
import Jawa.Event.FirstFrame as FirstFrame
import Jawa.Event.Fullscreen as Fullscreen
import Jawa.Event.Idle as Idle
import Jawa.Event.MediaType as MediaType
import Jawa.Event.Pause as Pause
import Jawa.Event.Play as Play
import Jawa.Event.PlaylistComplete as PlaylistComplete
import Jawa.Event.ProviderFirstFrame as ProviderFirstFrame
import Jawa.Event.Ready as Ready
import Jawa.Event.Remove as Remove
import Jawa.Event.Resize as Resize
import Jawa.Event.Seek as Seek
import Jawa.Event.Seeked as Seeked
import Jawa.Event.SetupError as SetupError
import Jawa.Event.Time as Time
import Jawa.Event.UserActive as UserActive
import Jawa.Event.UserInactive as UserInactive
import Jawa.Event.Viewable as Viewable
import Jawa.Event.VisualQuality as VisualQuality
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/onall>
-}
type Event
    = BeforeComplete BeforeComplete.BeforeComplete
    | Breakpoint Breakpoint.Breakpoint
    | BufferChange BufferChange.BufferChange
    | BufferFull BufferFull.BufferFull
    | Click Click.Click
    | Complete Complete.Complete
    | DisplayClick DisplayClick.DisplayClick
    | FirstFrame FirstFrame.FirstFrame
    | Fullscreen Fullscreen.Fullscreen
    | Idle Idle.Idle
    | MediaType MediaType.MediaType
    | Pause Pause.Pause
    | Play Play.Play
    | PlaylistComplete PlaylistComplete.PlaylistComplete
    | ProviderFirstFrame ProviderFirstFrame.ProviderFirstFrame
    | Ready Ready.Ready
    | Remove Remove.Remove
    | Resize Resize.Resize
    | Seek Seek.Seek
    | Seeked Seeked.Seeked
    | SetupError SetupError.SetupError
    | Time Time.Time
    | UserActive UserActive.UserActive
    | UserInactive UserInactive.UserInactive
    | Viewable Viewable.Viewable
    | VisualQuality VisualQuality.VisualQuality


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Event
decoder =
    Json.Decode.field "type" Json.Decode.string
        |> Json.Decode.andThen decoderWith


decoderWith : String -> Json.Decode.Decoder Event
decoderWith string =
    case string of
        "beforeComplete" ->
            Json.Decode.map BeforeComplete BeforeComplete.decoder

        "breakpoint" ->
            Json.Decode.map Breakpoint Breakpoint.decoder

        "bufferChange" ->
            Json.Decode.map BufferChange BufferChange.decoder

        "bufferFull" ->
            Json.Decode.map BufferFull BufferFull.decoder

        "click" ->
            Json.Decode.map Click Click.decoder

        "complete" ->
            Json.Decode.map Complete Complete.decoder

        "displayClick" ->
            Json.Decode.map DisplayClick DisplayClick.decoder

        "firstFrame" ->
            Json.Decode.map FirstFrame FirstFrame.decoder

        "fullscreen" ->
            Json.Decode.map Fullscreen Fullscreen.decoder

        "idle" ->
            Json.Decode.map Idle Idle.decoder

        "mediaType" ->
            Json.Decode.map MediaType MediaType.decoder

        "pause" ->
            Json.Decode.map Pause Pause.decoder

        "play" ->
            Json.Decode.map Play Play.decoder

        "playlistComplete" ->
            Json.Decode.map PlaylistComplete PlaylistComplete.decoder

        "providerFirstFrame" ->
            Json.Decode.map ProviderFirstFrame ProviderFirstFrame.decoder

        "ready" ->
            Json.Decode.map Ready Ready.decoder

        "remove" ->
            Json.Decode.map Remove Remove.decoder

        "resize" ->
            Json.Decode.map Resize Resize.decoder

        "seek" ->
            Json.Decode.map Seek Seek.decoder

        "seeked" ->
            Json.Decode.map Seeked Seeked.decoder

        "setupError" ->
            Json.Decode.map SetupError SetupError.decoder

        "time" ->
            Json.Decode.map Time Time.decoder

        "userActive" ->
            Json.Decode.map UserActive UserActive.decoder

        "userInactive" ->
            Json.Decode.map UserInactive UserInactive.decoder

        "viewable" ->
            Json.Decode.map Viewable Viewable.decoder

        "visualQuality" ->
            Json.Decode.map VisualQuality VisualQuality.decoder

        _ ->
            Json.Decode.fail <| "invalid Event: " ++ string


{-| A JSON encoder.
-}
encoder : Event -> Json.Encode.Value
encoder event =
    case event of
        BeforeComplete x ->
            encoderWith "beforeComplete" BeforeComplete.encoder x

        Breakpoint x ->
            encoderWith "breakpoint" Breakpoint.encoder x

        BufferFull x ->
            encoderWith "bufferFull" BufferFull.encoder x

        BufferChange x ->
            encoderWith "bufferChange" BufferChange.encoder x

        Click x ->
            encoderWith "click" Click.encoder x

        Complete x ->
            encoderWith "complete" Complete.encoder x

        DisplayClick x ->
            encoderWith "displayClick" DisplayClick.encoder x

        FirstFrame x ->
            encoderWith "firstFrame" FirstFrame.encoder x

        Fullscreen x ->
            encoderWith "fullscreen" Fullscreen.encoder x

        Idle x ->
            encoderWith "idle" Idle.encoder x

        MediaType x ->
            encoderWith "mediaType" MediaType.encoder x

        Pause x ->
            encoderWith "pause" Pause.encoder x

        Play x ->
            encoderWith "play" Play.encoder x

        PlaylistComplete x ->
            encoderWith "playlistComplete" PlaylistComplete.encoder x

        ProviderFirstFrame x ->
            encoderWith "providerFirstFrame" ProviderFirstFrame.encoder x

        Ready x ->
            encoderWith "ready" Ready.encoder x

        Remove x ->
            encoderWith "remove" Remove.encoder x

        Resize x ->
            encoderWith "resize" Resize.encoder x

        Seek x ->
            encoderWith "seek" Seek.encoder x

        Seeked x ->
            encoderWith "seeked" Seeked.encoder x

        SetupError x ->
            encoderWith "setupError" SetupError.encoder x

        Time x ->
            encoderWith "time" Time.encoder x

        UserActive x ->
            encoderWith "userActive" UserActive.encoder x

        UserInactive x ->
            encoderWith "userInactive" UserInactive.encoder x

        Viewable x ->
            encoderWith "viewable" Viewable.encoder x

        VisualQuality x ->
            encoderWith "visualQuality" VisualQuality.encoder x


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
