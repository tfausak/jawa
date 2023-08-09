module Jawa.Event exposing (Event(..), decoder, encode, toTag)

{-|

@docs Event, decoder, encode, toTag

-}

import Dict
import Jawa.Event.AudioTracks
import Jawa.Event.BeforeComplete
import Jawa.Event.BeforePlay
import Jawa.Event.Breakpoint
import Jawa.Event.Buffer
import Jawa.Event.BufferChange
import Jawa.Event.BufferFull
import Jawa.Event.CaptionsChanged
import Jawa.Event.CaptionsList
import Jawa.Event.Click
import Jawa.Event.Complete
import Jawa.Event.Controls
import Jawa.Event.DisplayClick
import Jawa.Event.FirstFrame
import Jawa.Event.Fullscreen
import Jawa.Event.Idle
import Jawa.Event.Levels
import Jawa.Event.LevelsChanged
import Jawa.Event.MediaType
import Jawa.Event.Mute
import Jawa.Event.Pause
import Jawa.Event.PipEnter
import Jawa.Event.PipLeave
import Jawa.Event.Play
import Jawa.Event.PlayAttempt
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
import Jawa.Event.SubtitlesTrackChanged
import Jawa.Event.SubtitlesTracks
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
    | BeforePlay Jawa.Event.BeforePlay.BeforePlay
    | Breakpoint Jawa.Event.Breakpoint.Breakpoint
    | Buffer Jawa.Event.Buffer.Buffer
    | BufferChange Jawa.Event.BufferChange.BufferChange
    | BufferFull Jawa.Event.BufferFull.BufferFull
    | CaptionsChanged Jawa.Event.CaptionsChanged.CaptionsChanged
    | CaptionsList Jawa.Event.CaptionsList.CaptionsList
    | Click Jawa.Event.Click.Click
    | Complete Jawa.Event.Complete.Complete
    | Controls Jawa.Event.Controls.Controls
    | DisplayClick Jawa.Event.DisplayClick.DisplayClick
    | FirstFrame Jawa.Event.FirstFrame.FirstFrame
    | Fullscreen Jawa.Event.Fullscreen.Fullscreen
    | Idle Jawa.Event.Idle.Idle
    | Levels Jawa.Event.Levels.Levels
    | LevelsChanged Jawa.Event.LevelsChanged.LevelsChanged
    | MediaType Jawa.Event.MediaType.MediaType
    | Mute Jawa.Event.Mute.Mute
    | Pause Jawa.Event.Pause.Pause
    | PipEnter Jawa.Event.PipEnter.PipEnter
    | PipLeave Jawa.Event.PipLeave.PipLeave
    | Play Jawa.Event.Play.Play
    | PlayAttempt Jawa.Event.PlayAttempt.PlayAttempt
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
    | SubtitlesTrackChanged Jawa.Event.SubtitlesTrackChanged.SubtitlesTrackChanged
    | SubtitlesTracks Jawa.Event.SubtitlesTracks.SubtitlesTracks
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
    case Dict.get string decoders of
        Just eventDecoder ->
            eventDecoder

        Nothing ->
            Json.Decode.fail <| "unknown Event: " ++ string


decoders : Dict.Dict String (Json.Decode.Decoder Event)
decoders =
    Dict.fromList
        [ ( Jawa.Event.AudioTracks.tag, Json.Decode.map AudioTracks Jawa.Event.AudioTracks.decoder )
        , ( Jawa.Event.BeforeComplete.tag, Json.Decode.map BeforeComplete Jawa.Event.BeforeComplete.decoder )
        , ( Jawa.Event.BeforePlay.tag, Json.Decode.map BeforePlay Jawa.Event.BeforePlay.decoder )
        , ( Jawa.Event.Breakpoint.tag, Json.Decode.map Breakpoint Jawa.Event.Breakpoint.decoder )
        , ( Jawa.Event.Buffer.tag, Json.Decode.map Buffer Jawa.Event.Buffer.decoder )
        , ( Jawa.Event.BufferChange.tag, Json.Decode.map BufferChange Jawa.Event.BufferChange.decoder )
        , ( Jawa.Event.BufferFull.tag, Json.Decode.map BufferFull Jawa.Event.BufferFull.decoder )
        , ( Jawa.Event.CaptionsChanged.tag, Json.Decode.map CaptionsChanged Jawa.Event.CaptionsChanged.decoder )
        , ( Jawa.Event.CaptionsList.tag, Json.Decode.map CaptionsList Jawa.Event.CaptionsList.decoder )
        , ( Jawa.Event.Click.tag, Json.Decode.map Click Jawa.Event.Click.decoder )
        , ( Jawa.Event.Complete.tag, Json.Decode.map Complete Jawa.Event.Complete.decoder )
        , ( Jawa.Event.Controls.tag, Json.Decode.map Controls Jawa.Event.Controls.decoder )
        , ( Jawa.Event.DisplayClick.tag, Json.Decode.map DisplayClick Jawa.Event.DisplayClick.decoder )
        , ( Jawa.Event.FirstFrame.tag, Json.Decode.map FirstFrame Jawa.Event.FirstFrame.decoder )
        , ( Jawa.Event.Fullscreen.tag, Json.Decode.map Fullscreen Jawa.Event.Fullscreen.decoder )
        , ( Jawa.Event.Idle.tag, Json.Decode.map Idle Jawa.Event.Idle.decoder )
        , ( Jawa.Event.Levels.tag, Json.Decode.map Levels Jawa.Event.Levels.decoder )
        , ( Jawa.Event.LevelsChanged.tag, Json.Decode.map LevelsChanged Jawa.Event.LevelsChanged.decoder )
        , ( Jawa.Event.MediaType.tag, Json.Decode.map MediaType Jawa.Event.MediaType.decoder )
        , ( Jawa.Event.Mute.tag, Json.Decode.map Mute Jawa.Event.Mute.decoder )
        , ( Jawa.Event.Pause.tag, Json.Decode.map Pause Jawa.Event.Pause.decoder )
        , ( Jawa.Event.PipEnter.tag, Json.Decode.map PipEnter Jawa.Event.PipEnter.decoder )
        , ( Jawa.Event.PipLeave.tag, Json.Decode.map PipLeave Jawa.Event.PipLeave.decoder )
        , ( Jawa.Event.Play.tag, Json.Decode.map Play Jawa.Event.Play.decoder )
        , ( Jawa.Event.PlayAttempt.tag, Json.Decode.map PlayAttempt Jawa.Event.PlayAttempt.decoder )
        , ( Jawa.Event.PlaybackRateChanged.tag, Json.Decode.map PlaybackRateChanged Jawa.Event.PlaybackRateChanged.decoder )
        , ( Jawa.Event.Playlist.tag, Json.Decode.map Playlist Jawa.Event.Playlist.decoder )
        , ( Jawa.Event.PlaylistComplete.tag, Json.Decode.map PlaylistComplete Jawa.Event.PlaylistComplete.decoder )
        , ( Jawa.Event.PlaylistItem.tag, Json.Decode.map PlaylistItem Jawa.Event.PlaylistItem.decoder )
        , ( Jawa.Event.ProviderFirstFrame.tag, Json.Decode.map ProviderFirstFrame Jawa.Event.ProviderFirstFrame.decoder )
        , ( Jawa.Event.Ready.tag, Json.Decode.map Ready Jawa.Event.Ready.decoder )
        , ( Jawa.Event.Remove.tag, Json.Decode.map Remove Jawa.Event.Remove.decoder )
        , ( Jawa.Event.Resize.tag, Json.Decode.map Resize Jawa.Event.Resize.decoder )
        , ( Jawa.Event.Seek.tag, Json.Decode.map Seek Jawa.Event.Seek.decoder )
        , ( Jawa.Event.Seeked.tag, Json.Decode.map Seeked Jawa.Event.Seeked.decoder )
        , ( Jawa.Event.SetupError.tag, Json.Decode.map SetupError Jawa.Event.SetupError.decoder )
        , ( Jawa.Event.SubtitlesTrackChanged.tag, Json.Decode.map SubtitlesTrackChanged Jawa.Event.SubtitlesTrackChanged.decoder )
        , ( Jawa.Event.SubtitlesTracks.tag, Json.Decode.map SubtitlesTracks Jawa.Event.SubtitlesTracks.decoder )
        , ( Jawa.Event.Time.tag, Json.Decode.map Time Jawa.Event.Time.decoder )
        , ( Jawa.Event.UserActive.tag, Json.Decode.map UserActive Jawa.Event.UserActive.decoder )
        , ( Jawa.Event.UserInactive.tag, Json.Decode.map UserInactive Jawa.Event.UserInactive.decoder )
        , ( Jawa.Event.Viewable.tag, Json.Decode.map Viewable Jawa.Event.Viewable.decoder )
        , ( Jawa.Event.VisualQuality.tag, Json.Decode.map VisualQuality Jawa.Event.VisualQuality.decoder )
        , ( Jawa.Event.Volume.tag, Json.Decode.map Volume Jawa.Event.Volume.decoder )
        ]


{-| A JSON encoder.
-}
encode : Event -> Json.Encode.Value
encode event =
    case event of
        AudioTracks x ->
            encodeWith Jawa.Event.AudioTracks.tag Jawa.Event.AudioTracks.encode x

        BeforeComplete x ->
            encodeWith Jawa.Event.BeforeComplete.tag Jawa.Event.BeforeComplete.encode x

        BeforePlay x ->
            encodeWith Jawa.Event.BeforePlay.tag Jawa.Event.BeforePlay.encode x

        Breakpoint x ->
            encodeWith Jawa.Event.Breakpoint.tag Jawa.Event.Breakpoint.encode x

        Buffer x ->
            encodeWith Jawa.Event.Buffer.tag Jawa.Event.Buffer.encode x

        BufferChange x ->
            encodeWith Jawa.Event.BufferChange.tag Jawa.Event.BufferChange.encode x

        BufferFull x ->
            encodeWith Jawa.Event.BufferFull.tag Jawa.Event.BufferFull.encode x

        CaptionsChanged x ->
            encodeWith Jawa.Event.CaptionsChanged.tag Jawa.Event.CaptionsChanged.encode x

        CaptionsList x ->
            encodeWith Jawa.Event.CaptionsList.tag Jawa.Event.CaptionsList.encode x

        Click x ->
            encodeWith Jawa.Event.Click.tag Jawa.Event.Click.encode x

        Complete x ->
            encodeWith Jawa.Event.Complete.tag Jawa.Event.Complete.encode x

        Controls x ->
            encodeWith Jawa.Event.Controls.tag Jawa.Event.Controls.encode x

        DisplayClick x ->
            encodeWith Jawa.Event.DisplayClick.tag Jawa.Event.DisplayClick.encode x

        FirstFrame x ->
            encodeWith Jawa.Event.FirstFrame.tag Jawa.Event.FirstFrame.encode x

        Fullscreen x ->
            encodeWith Jawa.Event.Fullscreen.tag Jawa.Event.Fullscreen.encode x

        Idle x ->
            encodeWith Jawa.Event.Idle.tag Jawa.Event.Idle.encode x

        Levels x ->
            encodeWith Jawa.Event.Levels.tag Jawa.Event.Levels.encode x

        LevelsChanged x ->
            encodeWith Jawa.Event.LevelsChanged.tag Jawa.Event.LevelsChanged.encode x

        MediaType x ->
            encodeWith Jawa.Event.MediaType.tag Jawa.Event.MediaType.encode x

        Mute x ->
            encodeWith Jawa.Event.Mute.tag Jawa.Event.Mute.encode x

        Pause x ->
            encodeWith Jawa.Event.Pause.tag Jawa.Event.Pause.encode x

        PipEnter x ->
            encodeWith Jawa.Event.PipEnter.tag Jawa.Event.PipEnter.encode x

        PipLeave x ->
            encodeWith Jawa.Event.PipLeave.tag Jawa.Event.PipLeave.encode x

        Play x ->
            encodeWith Jawa.Event.Play.tag Jawa.Event.Play.encode x

        PlayAttempt x ->
            encodeWith Jawa.Event.PlayAttempt.tag Jawa.Event.PlayAttempt.encode x

        PlaybackRateChanged x ->
            encodeWith Jawa.Event.PlaybackRateChanged.tag Jawa.Event.PlaybackRateChanged.encode x

        Playlist x ->
            encodeWith Jawa.Event.Playlist.tag Jawa.Event.Playlist.encode x

        PlaylistComplete x ->
            encodeWith Jawa.Event.PlaylistComplete.tag Jawa.Event.PlaylistComplete.encode x

        PlaylistItem x ->
            encodeWith Jawa.Event.PlaylistItem.tag Jawa.Event.PlaylistItem.encode x

        ProviderFirstFrame x ->
            encodeWith Jawa.Event.ProviderFirstFrame.tag Jawa.Event.ProviderFirstFrame.encode x

        Ready x ->
            encodeWith Jawa.Event.Ready.tag Jawa.Event.Ready.encode x

        Remove x ->
            encodeWith Jawa.Event.Remove.tag Jawa.Event.Remove.encode x

        Resize x ->
            encodeWith Jawa.Event.Resize.tag Jawa.Event.Resize.encode x

        Seek x ->
            encodeWith Jawa.Event.Seek.tag Jawa.Event.Seek.encode x

        Seeked x ->
            encodeWith Jawa.Event.Seeked.tag Jawa.Event.Seeked.encode x

        SetupError x ->
            encodeWith Jawa.Event.SetupError.tag Jawa.Event.SetupError.encode x

        SubtitlesTrackChanged x ->
            encodeWith Jawa.Event.SubtitlesTrackChanged.tag Jawa.Event.SubtitlesTrackChanged.encode x

        SubtitlesTracks x ->
            encodeWith Jawa.Event.SubtitlesTracks.tag Jawa.Event.SubtitlesTracks.encode x

        Time x ->
            encodeWith Jawa.Event.Time.tag Jawa.Event.Time.encode x

        UserActive x ->
            encodeWith Jawa.Event.UserActive.tag Jawa.Event.UserActive.encode x

        UserInactive x ->
            encodeWith Jawa.Event.UserInactive.tag Jawa.Event.UserInactive.encode x

        Viewable x ->
            encodeWith Jawa.Event.Viewable.tag Jawa.Event.Viewable.encode x

        VisualQuality x ->
            encodeWith Jawa.Event.VisualQuality.tag Jawa.Event.VisualQuality.encode x

        Volume x ->
            encodeWith Jawa.Event.Volume.tag Jawa.Event.Volume.encode x


encodeWith : String -> (a -> Json.Decode.Value) -> a -> Json.Encode.Value
encodeWith t f x =
    let
        json : Json.Encode.Value
        json =
            f x

        typeKey : String
        typeKey =
            "type"

        typeValue : Json.Encode.Value
        typeValue =
            Json.Encode.string t
    in
    case Json.Decode.decodeValue (Json.Decode.dict Json.Decode.value) json of
        Ok dict ->
            Json.Encode.dict identity identity (Dict.insert typeKey typeValue dict)

        Err _ ->
            Json.Encode.object
                [ ( typeKey, typeValue )
                , ( "value", json )
                ]


{-| Converts an event into a tag describing which type it is.
-}
toTag : Event -> String
toTag event =
    case event of
        AudioTracks _ ->
            Jawa.Event.AudioTracks.tag

        BeforeComplete _ ->
            Jawa.Event.BeforeComplete.tag

        BeforePlay _ ->
            Jawa.Event.BeforePlay.tag

        Breakpoint _ ->
            Jawa.Event.Breakpoint.tag

        Buffer _ ->
            Jawa.Event.Buffer.tag

        BufferChange _ ->
            Jawa.Event.BufferChange.tag

        BufferFull _ ->
            Jawa.Event.BufferFull.tag

        CaptionsChanged _ ->
            Jawa.Event.CaptionsChanged.tag

        CaptionsList _ ->
            Jawa.Event.CaptionsList.tag

        Click _ ->
            Jawa.Event.Click.tag

        Complete _ ->
            Jawa.Event.Complete.tag

        Controls _ ->
            Jawa.Event.Controls.tag

        DisplayClick _ ->
            Jawa.Event.DisplayClick.tag

        FirstFrame _ ->
            Jawa.Event.FirstFrame.tag

        Fullscreen _ ->
            Jawa.Event.Fullscreen.tag

        Idle _ ->
            Jawa.Event.Idle.tag

        Levels _ ->
            Jawa.Event.Levels.tag

        LevelsChanged _ ->
            Jawa.Event.LevelsChanged.tag

        MediaType _ ->
            Jawa.Event.MediaType.tag

        Mute _ ->
            Jawa.Event.Mute.tag

        Pause _ ->
            Jawa.Event.Pause.tag

        PipEnter _ ->
            Jawa.Event.PipEnter.tag

        PipLeave _ ->
            Jawa.Event.PipLeave.tag

        Play _ ->
            Jawa.Event.Play.tag

        PlayAttempt _ ->
            Jawa.Event.PlayAttempt.tag

        PlaybackRateChanged _ ->
            Jawa.Event.PlaybackRateChanged.tag

        Playlist _ ->
            Jawa.Event.Playlist.tag

        PlaylistComplete _ ->
            Jawa.Event.PlaylistComplete.tag

        PlaylistItem _ ->
            Jawa.Event.PlaylistItem.tag

        ProviderFirstFrame _ ->
            Jawa.Event.ProviderFirstFrame.tag

        Ready _ ->
            Jawa.Event.Ready.tag

        Remove _ ->
            Jawa.Event.Remove.tag

        Resize _ ->
            Jawa.Event.Resize.tag

        Seek _ ->
            Jawa.Event.Seek.tag

        Seeked _ ->
            Jawa.Event.Seeked.tag

        SetupError _ ->
            Jawa.Event.SetupError.tag

        SubtitlesTrackChanged _ ->
            Jawa.Event.SubtitlesTrackChanged.tag

        SubtitlesTracks _ ->
            Jawa.Event.SubtitlesTracks.tag

        Time _ ->
            Jawa.Event.Time.tag

        UserActive _ ->
            Jawa.Event.UserActive.tag

        UserInactive _ ->
            Jawa.Event.UserInactive.tag

        Viewable _ ->
            Jawa.Event.Viewable.tag

        VisualQuality _ ->
            Jawa.Event.VisualQuality.tag

        Volume _ ->
            Jawa.Event.Volume.tag
