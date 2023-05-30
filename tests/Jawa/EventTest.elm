module Jawa.EventTest exposing (test)

import Fuzz
import Jawa.Event
import Jawa.Event.AudioTracksTest
import Jawa.Event.BeforeCompleteTest
import Jawa.Event.BeforePlayTest
import Jawa.Event.BreakpointTest
import Jawa.Event.BufferChangeTest
import Jawa.Event.BufferFullTest
import Jawa.Event.BufferTest
import Jawa.Event.CaptionsChangedTest
import Jawa.Event.CaptionsListTest
import Jawa.Event.ClickTest
import Jawa.Event.CompleteTest
import Jawa.Event.ControlsTest
import Jawa.Event.DisplayClickTest
import Jawa.Event.FirstFrameTest
import Jawa.Event.FullscreenTest
import Jawa.Event.IdleTest
import Jawa.Event.LevelsTest
import Jawa.Event.MediaTypeTest
import Jawa.Event.MuteTest
import Jawa.Event.PauseTest
import Jawa.Event.PipEnterTest
import Jawa.Event.PipLeaveTest
import Jawa.Event.PlayTest
import Jawa.Event.PlaybackRateChangedTest
import Jawa.Event.PlaylistCompleteTest
import Jawa.Event.PlaylistItemTest
import Jawa.Event.PlaylistTest
import Jawa.Event.ProviderFirstFrameTest
import Jawa.Event.ReadyTest
import Jawa.Event.RemoveTest
import Jawa.Event.ResizeTest
import Jawa.Event.SeekTest
import Jawa.Event.SeekedTest
import Jawa.Event.SetupErrorTest
import Jawa.Event.SubtitlesTracksTest
import Jawa.Event.TimeTest
import Jawa.Event.UserActiveTest
import Jawa.Event.UserInactiveTest
import Jawa.Event.ViewableTest
import Jawa.Event.VisualQualityTest
import Jawa.Event.VolumeTest
import Jawa.Extra.Test
import Jawa.MediaType
import Jawa.Metadata
import Jawa.PauseReason
import Jawa.PlayReason
import Jawa.Preload
import Jawa.QualityMode
import Jawa.QualityReason
import Jawa.State
import Jawa.Viewable
import Json.Encode
import Test


test : Test.Test
test =
    Test.describe "Jawa.Event"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Event.decoder Jawa.Event.encode fuzzer
        , Jawa.Extra.Test.testCodec "works with audioTracks"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "currentTrack": 0,
                "tracks": [],
                "type": "audioTracks"
            } """
            (Jawa.Event.AudioTracks
                { currentTrack = 0
                , tracks = []
                }
            )
        , Jawa.Extra.Test.testCodec "works with beforeComplete"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "type": "beforeComplete"
            } """
            (Jawa.Event.BeforeComplete {})
        , Jawa.Extra.Test.testCodec "works with beforePlay"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "playReason": "autostart",
                "type": "beforePlay",
                "viewable": 0
            } """
            (Jawa.Event.BeforePlay
                { playReason = Jawa.PlayReason.Autostart
                , viewable = Jawa.Viewable.Hidden
                }
            )
        , Jawa.Extra.Test.testCodec "works with breakpoint"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "breakpoint": 0,
                "type": "breakpoint"
            } """
            (Jawa.Event.Breakpoint
                { breakpoint = 0
                }
            )
        , Jawa.Extra.Test.testCodec "works with buffer"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "oldstate": "idle",
                "newstate": "buffering",
                "reason": "loading",
                "type": "buffer"
            } """
            (Jawa.Event.Buffer
                { oldstate = Jawa.State.Idle
                , newstate = Jawa.State.Buffering
                , reason = Jawa.State.Loading
                }
            )
        , Jawa.Extra.Test.testCodec "works with bufferChange"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "bufferPercent": 0.1,
                "currentTime": 0.2,
                "duration": 0.3,
                "position": 0.4,
                "seekRange": {
                    "end": 0.5,
                    "start": 0.6
                },
                "type": "bufferChange"
            } """
            (Jawa.Event.BufferChange
                { bufferPercent = 0.1
                , currentTime = 0.2
                , duration = 0.3
                , position = 0.4
                , seekRange =
                    { end = 0.5
                    , start = 0.6
                    }
                }
            )
        , Jawa.Extra.Test.testCodec "works with bufferFull"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "type": "bufferFull"
            } """
            (Jawa.Event.BufferFull {})
        , Jawa.Extra.Test.testCodec "works with captionsChanged"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "track": 0,
                "tracks": [],
                "type": "captionsChanged"
            } """
            (Jawa.Event.CaptionsChanged
                { track = 0
                , tracks = []
                }
            )
        , Jawa.Extra.Test.testCodec "works with captionsList"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "track": 0,
                "tracks": [],
                "type": "captionsList"
            } """
            (Jawa.Event.CaptionsList
                { track = 0
                , tracks = []
                }
            )
        , Jawa.Extra.Test.testCodec "works with click"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "isTrusted": false,
                "type": "click"
            } """
            (Jawa.Event.Click
                { isTrusted = False
                }
            )
        , Jawa.Extra.Test.testCodec "works with complete"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "type": "complete"
            } """
            (Jawa.Event.Complete {})
        , Jawa.Extra.Test.testCodec "works with controls"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "controls": false,
                "type": "controls"
            } """
            (Jawa.Event.Controls
                { controls = False
                }
            )
        , Jawa.Extra.Test.testCodec "works with displayClick"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "type": "displayClick"
            } """
            (Jawa.Event.DisplayClick {})
        , Jawa.Extra.Test.testCodec "works with firstFrame"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "loadTime": 0.1,
                "type": "firstFrame"
            } """
            (Jawa.Event.FirstFrame
                { loadTime = 0.1
                }
            )
        , Jawa.Extra.Test.testCodec "works with fullscreen"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "fullscreen": false,
                "type": "fullscreen"
            } """
            (Jawa.Event.Fullscreen
                { fullscreen = False
                }
            )
        , Jawa.Extra.Test.testCodec "works with idle"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "newstate": "buffering",
                "oldstate": "complete",
                "reason": "error",
                "type": "idle"
            } """
            (Jawa.Event.Idle
                { newstate = Jawa.State.Buffering
                , oldstate = Jawa.State.Complete
                , reason = Jawa.State.Error
                }
            )
        , Jawa.Extra.Test.testCodec "works with levels"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "currentQuality": 0,
                "levels": [],
                "type": "levels"
            } """
            (Jawa.Event.Levels
                { currentQuality = 0
                , levels = []
                }
            )
        , Jawa.Extra.Test.testCodec "works with mediaType"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "mediaType": "audio",
                "type": "mediaType"
            } """
            (Jawa.Event.MediaType
                { mediaType = Jawa.MediaType.Audio
                }
            )
        , Jawa.Extra.Test.testCodec "works with mute"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "mute": false,
                "type": "mute"
            } """
            (Jawa.Event.Mute
                { mute = False
                }
            )
        , Jawa.Extra.Test.testCodec "works with pause"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "newstate": "buffering",
                "oldstate": "complete",
                "pauseReason": "external",
                "reason": "error",
                "type": "pause",
                "viewable": 0
            } """
            (Jawa.Event.Pause
                { newstate = Jawa.State.Buffering
                , oldstate = Jawa.State.Complete
                , pauseReason = Jawa.PauseReason.External
                , reason = Jawa.State.Error
                , viewable = Jawa.Viewable.Hidden
                }
            )
        , Jawa.Extra.Test.testCodec "works with pipEnter"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "type": "pipEnter"
            } """
            (Jawa.Event.PipEnter {})
        , Jawa.Extra.Test.testCodec "works with pipLeave"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "type": "pipLeave"
            } """
            (Jawa.Event.PipLeave {})
        , Jawa.Extra.Test.testCodec "works with play"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "newstate": "buffering",
                "oldstate": "complete",
                "playReason": "autostart",
                "reason": "error",
                "type": "play",
                "viewable": 0
            } """
            (Jawa.Event.Play
                { newstate = Jawa.State.Buffering
                , oldstate = Jawa.State.Complete
                , playReason = Jawa.PlayReason.Autostart
                , reason = Jawa.State.Error
                , viewable = Jawa.Viewable.Hidden
                }
            )
        , Jawa.Extra.Test.testCodec "works with playbackRateChanged"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "playbackRate": 0.1,
                "type": "playbackRateChanged"
            } """
            (Jawa.Event.PlaybackRateChanged
                { playbackRate = 0.1
                }
            )
        , Jawa.Extra.Test.testCodec "works with playlist"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "playlist": [],
                "type": "playlist"
            } """
            (Jawa.Event.Playlist
                { playlist = []
                }
            )
        , Jawa.Extra.Test.testCodec "works with playlistComplete"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "type": "playlistComplete"
            } """
            (Jawa.Event.PlaylistComplete {})
        , Jawa.Extra.Test.testCodec "works with playlistItem"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "index": 0,
                "item": {
                    "allSources": [],
                    "file": "a",
                    "preload": "auto",
                    "sources": [],
                    "tracks": []
                },
                "type": "playlistItem"
            } """
            (Jawa.Event.PlaylistItem
                { index = 0
                , item =
                    { allSources = []
                    , description = Nothing
                    , file = "a"
                    , image = Nothing
                    , mediaId = Nothing
                    , preload = Jawa.Preload.Auto
                    , sources = []
                    , title = Nothing
                    , tracks = []
                    }
                }
            )
        , Jawa.Extra.Test.testCodec "works with providerFirstFrame"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "type": "providerFirstFrame"
            } """
            (Jawa.Event.ProviderFirstFrame {})
        , Jawa.Extra.Test.testCodec "works with ready"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "setupTime": 0.1,
                "viewable": 0,
                "type": "ready"
            } """
            (Jawa.Event.Ready
                { setupTime = 0.1
                , viewable = Jawa.Viewable.Hidden
                }
            )
        , Jawa.Extra.Test.testCodec "works with remove"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "type": "remove"
            } """
            (Jawa.Event.Remove {})
        , Jawa.Extra.Test.testCodec "works with resize"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "height": 0,
                "type": "resize",
                "width": 1
            } """
            (Jawa.Event.Resize
                { height = 0
                , width = 1
                }
            )
        , Jawa.Extra.Test.testCodec "works with seek"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "currentTime": 0.1,
                "duration": 0.2,
                "metadata": null,
                "offset": 0.3,
                "position": 0.4,
                "seekRange": {
                    "end": 0.5,
                    "start": 0.6
                },
                "type": "seek"
            } """
            (Jawa.Event.Seek
                { currentTime = 0.1
                , duration = 0.2
                , metadata = Jawa.Metadata.Metadata Json.Encode.null
                , offset = 0.3
                , position = 0.4
                , seekRange =
                    { end = 0.5
                    , start = 0.6
                    }
                }
            )
        , Jawa.Extra.Test.testCodec "works with seeked"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "type": "seeked"
            } """
            (Jawa.Event.Seeked {})
        , Jawa.Extra.Test.testCodec "works with setupError"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "code": 0,
                "message": "",
                "type": "setupError"
            } """
            (Jawa.Event.SetupError
                { code = 0
                , message = ""
                }
            )
        , Jawa.Extra.Test.testCodec "works with subtitlesTracks"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "tracks": [],
                "type": "subtitlesTracks"
            } """
            (Jawa.Event.SubtitlesTracks
                { tracks = []
                }
            )
        , Jawa.Extra.Test.testCodec "works with time"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "currentTime": 0.1,
                "duration": 0.2,
                "metadata": null,
                "position": 0.3,
                "seekRange": {
                    "end": 0.4,
                    "start": 0.5
                },
                "type": "time",
                "viewable": 0
            } """
            (Jawa.Event.Time
                { currentTime = 0.1
                , duration = 0.2
                , metadata = Jawa.Metadata.Metadata Json.Encode.null
                , position = 0.3
                , seekRange =
                    { end = 0.4
                    , start = 0.5
                    }
                , viewable = Jawa.Viewable.Hidden
                }
            )
        , Jawa.Extra.Test.testCodec "works with userActive"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "type": "userActive"
            } """
            (Jawa.Event.UserActive {})
        , Jawa.Extra.Test.testCodec "works with userInactive"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "type": "userInactive"
            } """
            (Jawa.Event.UserInactive {})
        , Jawa.Extra.Test.testCodec "works with viewable"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "viewable": 0,
                "type": "viewable"
            } """
            (Jawa.Event.Viewable
                { viewable = Jawa.Viewable.Hidden
                }
            )
        , Jawa.Extra.Test.testCodec "works with visualQuality"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "level": {
                    "bitrate": 0,
                    "height": 1,
                    "index": 2,
                    "label": "a",
                    "width": 3
                },
                "mode": "auto",
                "reason": "api",
                "type": "visualQuality"
            } """
            (Jawa.Event.VisualQuality
                { level =
                    { bitrate = 0
                    , height = 1
                    , index = Just 2
                    , label = "a"
                    , width = 3
                    }
                , mode = Jawa.QualityMode.Auto
                , reason = Jawa.QualityReason.Api
                }
            )
        , Jawa.Extra.Test.testCodec "works with volume"
            Jawa.Event.decoder
            Jawa.Event.encode
            """ {
                "type": "volume",
                "volume": 0.1
            } """
            (Jawa.Event.Volume
                { volume = 0.1
                }
            )
        ]


fuzzer : Fuzz.Fuzzer Jawa.Event.Event
fuzzer =
    Fuzz.oneOf
        [ Fuzz.map Jawa.Event.AudioTracks Jawa.Event.AudioTracksTest.fuzzer
        , Fuzz.map Jawa.Event.BeforeComplete Jawa.Event.BeforeCompleteTest.fuzzer
        , Fuzz.map Jawa.Event.BeforePlay Jawa.Event.BeforePlayTest.fuzzer
        , Fuzz.map Jawa.Event.Breakpoint Jawa.Event.BreakpointTest.fuzzer
        , Fuzz.map Jawa.Event.Buffer Jawa.Event.BufferTest.fuzzer
        , Fuzz.map Jawa.Event.BufferChange Jawa.Event.BufferChangeTest.fuzzer
        , Fuzz.map Jawa.Event.BufferFull Jawa.Event.BufferFullTest.fuzzer
        , Fuzz.map Jawa.Event.CaptionsChanged Jawa.Event.CaptionsChangedTest.fuzzer
        , Fuzz.map Jawa.Event.CaptionsList Jawa.Event.CaptionsListTest.fuzzer
        , Fuzz.map Jawa.Event.Click Jawa.Event.ClickTest.fuzzer
        , Fuzz.map Jawa.Event.Complete Jawa.Event.CompleteTest.fuzzer
        , Fuzz.map Jawa.Event.Controls Jawa.Event.ControlsTest.fuzzer
        , Fuzz.map Jawa.Event.DisplayClick Jawa.Event.DisplayClickTest.fuzzer
        , Fuzz.map Jawa.Event.FirstFrame Jawa.Event.FirstFrameTest.fuzzer
        , Fuzz.map Jawa.Event.Fullscreen Jawa.Event.FullscreenTest.fuzzer
        , Fuzz.map Jawa.Event.Idle Jawa.Event.IdleTest.fuzzer
        , Fuzz.map Jawa.Event.Levels Jawa.Event.LevelsTest.fuzzer
        , Fuzz.map Jawa.Event.MediaType Jawa.Event.MediaTypeTest.fuzzer
        , Fuzz.map Jawa.Event.Mute Jawa.Event.MuteTest.fuzzer
        , Fuzz.map Jawa.Event.Pause Jawa.Event.PauseTest.fuzzer
        , Fuzz.map Jawa.Event.PipEnter Jawa.Event.PipEnterTest.fuzzer
        , Fuzz.map Jawa.Event.PipLeave Jawa.Event.PipLeaveTest.fuzzer
        , Fuzz.map Jawa.Event.Play Jawa.Event.PlayTest.fuzzer
        , Fuzz.map Jawa.Event.PlaybackRateChanged Jawa.Event.PlaybackRateChangedTest.fuzzer
        , Fuzz.map Jawa.Event.Playlist Jawa.Event.PlaylistTest.fuzzer
        , Fuzz.map Jawa.Event.PlaylistComplete Jawa.Event.PlaylistCompleteTest.fuzzer
        , Fuzz.map Jawa.Event.PlaylistItem Jawa.Event.PlaylistItemTest.fuzzer
        , Fuzz.map Jawa.Event.ProviderFirstFrame Jawa.Event.ProviderFirstFrameTest.fuzzer
        , Fuzz.map Jawa.Event.Ready Jawa.Event.ReadyTest.fuzzer
        , Fuzz.map Jawa.Event.Remove Jawa.Event.RemoveTest.fuzzer
        , Fuzz.map Jawa.Event.Resize Jawa.Event.ResizeTest.fuzzer
        , Fuzz.map Jawa.Event.Seek Jawa.Event.SeekTest.fuzzer
        , Fuzz.map Jawa.Event.Seeked Jawa.Event.SeekedTest.fuzzer
        , Fuzz.map Jawa.Event.SetupError Jawa.Event.SetupErrorTest.fuzzer
        , Fuzz.map Jawa.Event.SubtitlesTracks Jawa.Event.SubtitlesTracksTest.fuzzer
        , Fuzz.map Jawa.Event.Time Jawa.Event.TimeTest.fuzzer
        , Fuzz.map Jawa.Event.UserActive Jawa.Event.UserActiveTest.fuzzer
        , Fuzz.map Jawa.Event.UserInactive Jawa.Event.UserInactiveTest.fuzzer
        , Fuzz.map Jawa.Event.Viewable Jawa.Event.ViewableTest.fuzzer
        , Fuzz.map Jawa.Event.VisualQuality Jawa.Event.VisualQualityTest.fuzzer
        , Fuzz.map Jawa.Event.Volume Jawa.Event.VolumeTest.fuzzer
        ]
