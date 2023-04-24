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
import Jawa.Event.Controls as Controls
import Jawa.Event.DisplayClick as DisplayClick
import Jawa.Event.FirstFrame as FirstFrame
import Jawa.Event.Fullscreen as Fullscreen
import Jawa.Event.Idle as Idle
import Jawa.Event.MediaType as MediaType
import Jawa.Event.Mute as Mute
import Jawa.Event.Pause as Pause
import Jawa.Event.PipEnter as PipEnter
import Jawa.Event.PipLeave as PipLeave
import Jawa.Event.Play as Play
import Jawa.Event.PlaybackRateChanged as PlaybackRateChanged
import Jawa.Event.Playlist as Playlist
import Jawa.Event.PlaylistComplete as PlaylistComplete
import Jawa.Event.PlaylistItem as PlaylistItem
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
import Jawa.Event.Volume as Volume
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
    | Controls Controls.Controls
    | DisplayClick DisplayClick.DisplayClick
    | FirstFrame FirstFrame.FirstFrame
    | Fullscreen Fullscreen.Fullscreen
    | Idle Idle.Idle
    | MediaType MediaType.MediaType
    | Mute Mute.Mute
    | Pause Pause.Pause
    | PipEnter PipEnter.PipEnter
    | PipLeave PipLeave.PipLeave
    | Play Play.Play
    | PlaybackRateChanged PlaybackRateChanged.PlaybackRateChanged
    | Playlist Playlist.Playlist
    | PlaylistComplete PlaylistComplete.PlaylistComplete
    | PlaylistItem PlaylistItem.PlaylistItem
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
    | Volume Volume.Volume


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

        "controls" ->
            Json.Decode.map Controls Controls.decoder

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

        "mute" ->
            Json.Decode.map Mute Mute.decoder

        "pause" ->
            Json.Decode.map Pause Pause.decoder

        "pipEnter" ->
            Json.Decode.map PipEnter PipEnter.decoder

        "pipLeave" ->
            Json.Decode.map PipLeave PipLeave.decoder

        "play" ->
            Json.Decode.map Play Play.decoder

        "playbackRateChanged" ->
            Json.Decode.map PlaybackRateChanged PlaybackRateChanged.decoder

        "playlist" ->
            Json.Decode.map Playlist Playlist.decoder

        "playlistComplete" ->
            Json.Decode.map PlaylistComplete PlaylistComplete.decoder

        "playlistItem" ->
            Json.Decode.map PlaylistItem PlaylistItem.decoder

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

        "volume" ->
            Json.Decode.map Volume Volume.decoder

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

        BufferChange x ->
            encoderWith "bufferChange" BufferChange.encoder x

        BufferFull x ->
            encoderWith "bufferFull" BufferFull.encoder x

        Click x ->
            encoderWith "click" Click.encoder x

        Complete x ->
            encoderWith "complete" Complete.encoder x

        Controls x ->
            encoderWith "controls" Controls.encoder x

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

        Mute x ->
            encoderWith "mute" Mute.encoder x

        Pause x ->
            encoderWith "pause" Pause.encoder x

        PipEnter x ->
            encoderWith "pipEnter" PipEnter.encoder x

        PipLeave x ->
            encoderWith "pipLeave" PipLeave.encoder x

        Play x ->
            encoderWith "play" Play.encoder x

        PlaybackRateChanged x ->
            encoderWith "playbackRateChanged" PlaybackRateChanged.encoder x

        Playlist x ->
            encoderWith "playlist" Playlist.encoder x

        PlaylistComplete x ->
            encoderWith "playlistComplete" PlaylistComplete.encoder x

        PlaylistItem x ->
            encoderWith "playlistItem" PlaylistItem.encoder x

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

        Volume x ->
            encoderWith "volume" Volume.encoder x


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
