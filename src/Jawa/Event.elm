module Jawa.Event exposing (Event(..), decoder, encoder)

{-|

@docs Event, decoder, encoder

-}

import Dict
import Jawa.Event.AudioTracks
import Jawa.Event.BeforeComplete
import Jawa.Event.Breakpoint
import Jawa.Event.BufferChange
import Jawa.Event.BufferFull
import Jawa.Event.Click
import Jawa.Event.Complete
import Jawa.Event.Controls
import Jawa.Event.DisplayClick
import Jawa.Event.FirstFrame
import Jawa.Event.Fullscreen
import Jawa.Event.Idle
import Jawa.Event.MediaType
import Jawa.Event.Meta
import Jawa.Event.Mute
import Jawa.Event.Pause
import Jawa.Event.PipEnter
import Jawa.Event.PipLeave
import Jawa.Event.Play
import Jawa.Event.PlaybackRateChanged
import Jawa.Event.Playlist
import Jawa.Event.PlaylistComplete
import Jawa.Event.PlaylistItem
import Jawa.Event.ProviderFirstFrame
import Jawa.Event.Ready
import Jawa.Event.Remove
import Jawa.Event.Resize
import Jawa.Event.Seek
import Jawa.Event.Seeked
import Jawa.Event.SetupError
import Jawa.Event.Time
import Jawa.Event.UserActive
import Jawa.Event.UserInactive
import Jawa.Event.Viewable
import Jawa.Event.VisualQuality
import Jawa.Event.Volume
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/onall>
-}
type Event
    = AudioTracks Jawa.Event.AudioTracks.AudioTracks
    | BeforeComplete Jawa.Event.BeforeComplete.BeforeComplete
    | Breakpoint Jawa.Event.Breakpoint.Breakpoint
    | BufferChange Jawa.Event.BufferChange.BufferChange
    | BufferFull Jawa.Event.BufferFull.BufferFull
    | Click Jawa.Event.Click.Click
    | Complete Jawa.Event.Complete.Complete
    | Controls Jawa.Event.Controls.Controls
    | DisplayClick Jawa.Event.DisplayClick.DisplayClick
    | FirstFrame Jawa.Event.FirstFrame.FirstFrame
    | Fullscreen Jawa.Event.Fullscreen.Fullscreen
    | Idle Jawa.Event.Idle.Idle
    | MediaType Jawa.Event.MediaType.MediaType
    | Meta Jawa.Event.Meta.Meta
    | Mute Jawa.Event.Mute.Mute
    | Pause Jawa.Event.Pause.Pause
    | PipEnter Jawa.Event.PipEnter.PipEnter
    | PipLeave Jawa.Event.PipLeave.PipLeave
    | Play Jawa.Event.Play.Play
    | PlaybackRateChanged Jawa.Event.PlaybackRateChanged.PlaybackRateChanged
    | Playlist Jawa.Event.Playlist.Playlist
    | PlaylistComplete Jawa.Event.PlaylistComplete.PlaylistComplete
    | PlaylistItem Jawa.Event.PlaylistItem.PlaylistItem
    | ProviderFirstFrame Jawa.Event.ProviderFirstFrame.ProviderFirstFrame
    | Ready Jawa.Event.Ready.Ready
    | Remove Jawa.Event.Remove.Remove
    | Resize Jawa.Event.Resize.Resize
    | Seek Jawa.Event.Seek.Seek
    | Seeked Jawa.Event.Seeked.Seeked
    | SetupError Jawa.Event.SetupError.SetupError
    | Time Jawa.Event.Time.Time
    | UserActive Jawa.Event.UserActive.UserActive
    | UserInactive Jawa.Event.UserInactive.UserInactive
    | Viewable Jawa.Event.Viewable.Viewable
    | VisualQuality Jawa.Event.VisualQuality.VisualQuality
    | Volume Jawa.Event.Volume.Volume


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Event
decoder =
    Json.Decode.field "type" Json.Decode.string
        |> Json.Decode.andThen decoderWith


decoderWith : String -> Json.Decode.Decoder Event
decoderWith string =
    case string of
        "audioTracks" ->
            Json.Decode.map AudioTracks Jawa.Event.AudioTracks.decoder

        "beforeComplete" ->
            Json.Decode.map BeforeComplete Jawa.Event.BeforeComplete.decoder

        "breakpoint" ->
            Json.Decode.map Breakpoint Jawa.Event.Breakpoint.decoder

        "bufferChange" ->
            Json.Decode.map BufferChange Jawa.Event.BufferChange.decoder

        "bufferFull" ->
            Json.Decode.map BufferFull Jawa.Event.BufferFull.decoder

        "click" ->
            Json.Decode.map Click Jawa.Event.Click.decoder

        "complete" ->
            Json.Decode.map Complete Jawa.Event.Complete.decoder

        "controls" ->
            Json.Decode.map Controls Jawa.Event.Controls.decoder

        "displayClick" ->
            Json.Decode.map DisplayClick Jawa.Event.DisplayClick.decoder

        "firstFrame" ->
            Json.Decode.map FirstFrame Jawa.Event.FirstFrame.decoder

        "fullscreen" ->
            Json.Decode.map Fullscreen Jawa.Event.Fullscreen.decoder

        "idle" ->
            Json.Decode.map Idle Jawa.Event.Idle.decoder

        "mediaType" ->
            Json.Decode.map MediaType Jawa.Event.MediaType.decoder

        "meta" ->
            Json.Decode.map Meta Jawa.Event.Meta.decoder

        "mute" ->
            Json.Decode.map Mute Jawa.Event.Mute.decoder

        "pause" ->
            Json.Decode.map Pause Jawa.Event.Pause.decoder

        "pipEnter" ->
            Json.Decode.map PipEnter Jawa.Event.PipEnter.decoder

        "pipLeave" ->
            Json.Decode.map PipLeave Jawa.Event.PipLeave.decoder

        "play" ->
            Json.Decode.map Play Jawa.Event.Play.decoder

        "playbackRateChanged" ->
            Json.Decode.map PlaybackRateChanged Jawa.Event.PlaybackRateChanged.decoder

        "playlist" ->
            Json.Decode.map Playlist Jawa.Event.Playlist.decoder

        "playlistComplete" ->
            Json.Decode.map PlaylistComplete Jawa.Event.PlaylistComplete.decoder

        "playlistItem" ->
            Json.Decode.map PlaylistItem Jawa.Event.PlaylistItem.decoder

        "providerFirstFrame" ->
            Json.Decode.map ProviderFirstFrame Jawa.Event.ProviderFirstFrame.decoder

        "ready" ->
            Json.Decode.map Ready Jawa.Event.Ready.decoder

        "remove" ->
            Json.Decode.map Remove Jawa.Event.Remove.decoder

        "resize" ->
            Json.Decode.map Resize Jawa.Event.Resize.decoder

        "seek" ->
            Json.Decode.map Seek Jawa.Event.Seek.decoder

        "seeked" ->
            Json.Decode.map Seeked Jawa.Event.Seeked.decoder

        "setupError" ->
            Json.Decode.map SetupError Jawa.Event.SetupError.decoder

        "time" ->
            Json.Decode.map Time Jawa.Event.Time.decoder

        "userActive" ->
            Json.Decode.map UserActive Jawa.Event.UserActive.decoder

        "userInactive" ->
            Json.Decode.map UserInactive Jawa.Event.UserInactive.decoder

        "viewable" ->
            Json.Decode.map Viewable Jawa.Event.Viewable.decoder

        "visualQuality" ->
            Json.Decode.map VisualQuality Jawa.Event.VisualQuality.decoder

        "volume" ->
            Json.Decode.map Volume Jawa.Event.Volume.decoder

        _ ->
            Json.Decode.fail <| "invalid Event: " ++ string


{-| A JSON encoder.
-}
encoder : Event -> Json.Encode.Value
encoder event =
    case event of
        AudioTracks x ->
            encoderWith "audioTracks" Jawa.Event.AudioTracks.encoder x

        BeforeComplete x ->
            encoderWith "beforeComplete" Jawa.Event.BeforeComplete.encoder x

        Breakpoint x ->
            encoderWith "breakpoint" Jawa.Event.Breakpoint.encoder x

        BufferChange x ->
            encoderWith "bufferChange" Jawa.Event.BufferChange.encoder x

        BufferFull x ->
            encoderWith "bufferFull" Jawa.Event.BufferFull.encoder x

        Click x ->
            encoderWith "click" Jawa.Event.Click.encoder x

        Complete x ->
            encoderWith "complete" Jawa.Event.Complete.encoder x

        Controls x ->
            encoderWith "controls" Jawa.Event.Controls.encoder x

        DisplayClick x ->
            encoderWith "displayClick" Jawa.Event.DisplayClick.encoder x

        FirstFrame x ->
            encoderWith "firstFrame" Jawa.Event.FirstFrame.encoder x

        Fullscreen x ->
            encoderWith "fullscreen" Jawa.Event.Fullscreen.encoder x

        Idle x ->
            encoderWith "idle" Jawa.Event.Idle.encoder x

        MediaType x ->
            encoderWith "mediaType" Jawa.Event.MediaType.encoder x

        Meta x ->
            encoderWith "meta" Jawa.Event.Meta.encoder x

        Mute x ->
            encoderWith "mute" Jawa.Event.Mute.encoder x

        Pause x ->
            encoderWith "pause" Jawa.Event.Pause.encoder x

        PipEnter x ->
            encoderWith "pipEnter" Jawa.Event.PipEnter.encoder x

        PipLeave x ->
            encoderWith "pipLeave" Jawa.Event.PipLeave.encoder x

        Play x ->
            encoderWith "play" Jawa.Event.Play.encoder x

        PlaybackRateChanged x ->
            encoderWith "playbackRateChanged" Jawa.Event.PlaybackRateChanged.encoder x

        Playlist x ->
            encoderWith "playlist" Jawa.Event.Playlist.encoder x

        PlaylistComplete x ->
            encoderWith "playlistComplete" Jawa.Event.PlaylistComplete.encoder x

        PlaylistItem x ->
            encoderWith "playlistItem" Jawa.Event.PlaylistItem.encoder x

        ProviderFirstFrame x ->
            encoderWith "providerFirstFrame" Jawa.Event.ProviderFirstFrame.encoder x

        Ready x ->
            encoderWith "ready" Jawa.Event.Ready.encoder x

        Remove x ->
            encoderWith "remove" Jawa.Event.Remove.encoder x

        Resize x ->
            encoderWith "resize" Jawa.Event.Resize.encoder x

        Seek x ->
            encoderWith "seek" Jawa.Event.Seek.encoder x

        Seeked x ->
            encoderWith "seeked" Jawa.Event.Seeked.encoder x

        SetupError x ->
            encoderWith "setupError" Jawa.Event.SetupError.encoder x

        Time x ->
            encoderWith "time" Jawa.Event.Time.encoder x

        UserActive x ->
            encoderWith "userActive" Jawa.Event.UserActive.encoder x

        UserInactive x ->
            encoderWith "userInactive" Jawa.Event.UserInactive.encoder x

        Viewable x ->
            encoderWith "viewable" Jawa.Event.Viewable.encoder x

        VisualQuality x ->
            encoderWith "visualQuality" Jawa.Event.VisualQuality.encoder x

        Volume x ->
            encoderWith "volume" Jawa.Event.Volume.encoder x


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
