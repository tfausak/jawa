module Jawa.EventTest exposing (test)

import Fuzz
import Jawa.Event as Event
import Jawa.Event.BeforeComplete as BeforeComplete
import Jawa.Event.BeforeCompleteTest as BeforeComplete
import Jawa.Event.BreakpointTest as Breakpoint
import Jawa.Event.BufferChangeTest as BufferChange
import Jawa.Event.BufferFull as BufferFull
import Jawa.Event.BufferFullTest as BufferFull
import Jawa.Event.ClickTest as Click
import Jawa.Event.Complete as Complete
import Jawa.Event.CompleteTest as Complete
import Jawa.Event.DisplayClick as DisplayClick
import Jawa.Event.DisplayClickTest as DisplayClick
import Jawa.Event.FirstFrameTest as FirstFrame
import Jawa.Event.FullscreenTest as Fullscreen
import Jawa.Event.IdleTest as Idle
import Jawa.Event.MediaTypeTest as MediaType
import Jawa.Event.PauseTest as Pause
import Jawa.Event.PlayTest as Play
import Jawa.Event.PlaylistComplete as PlaylistComplete
import Jawa.Event.PlaylistCompleteTest as PlaylistComplete
import Jawa.Event.ProviderFirstFrame as ProviderFirstFrame
import Jawa.Event.ProviderFirstFrameTest as ProviderFirstFrame
import Jawa.Event.ReadyTest as Ready
import Jawa.Event.Remove as Remove
import Jawa.Event.RemoveTest as Remove
import Jawa.Event.ResizeTest as Resize
import Jawa.Event.SeekTest as Seek
import Jawa.Event.Seeked as Seeked
import Jawa.Event.SeekedTest as Seeked
import Jawa.Event.SetupErrorTest as SetupError
import Jawa.Event.TimeTest as Time
import Jawa.Event.UserActive as UserActive
import Jawa.Event.UserActiveTest as UserActive
import Jawa.Event.UserInactive as UserInactive
import Jawa.Event.UserInactiveTest as UserInactive
import Jawa.Event.ViewableTest as Viewable
import Jawa.Event.VisualQualityTest as VisualQuality
import Jawa.MediaType as MT
import Jawa.Metadata as M
import Jawa.PauseReason as PaR
import Jawa.PlayReason as PlR
import Jawa.QualityMode as QM
import Jawa.QualityReason as QR
import Jawa.State as S
import Jawa.Test.Extra as TestExtra
import Jawa.Viewable as V
import Json.Encode
import Test


test : Test.Test
test =
    Test.concat
        [ TestExtra.fuzzCodec "round trips" Event.decoder Event.encoder fuzzer
        , TestExtra.testCodec "works with beforeComplete"
            Event.decoder
            Event.encoder
            """ {
                "type": "beforeComplete"
            } """
            (Event.BeforeComplete BeforeComplete.BeforeComplete)
        , TestExtra.testCodec "works with breakpoint"
            Event.decoder
            Event.encoder
            """ {
                "breakpoint": 0,
                "type": "breakpoint"
            } """
            (Event.Breakpoint
                { breakpoint = 0
                }
            )
        , TestExtra.testCodec "works with bufferChange"
            Event.decoder
            Event.encoder
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
            (Event.BufferChange
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
        , TestExtra.testCodec "works with bufferFull"
            Event.decoder
            Event.encoder
            """ {
                "type": "bufferFull"
            } """
            (Event.BufferFull BufferFull.BufferFull)
        , TestExtra.testCodec "works with click"
            Event.decoder
            Event.encoder
            """ {
                "isTrusted": false,
                "type": "click"
            } """
            (Event.Click
                { isTrusted = False
                }
            )
        , TestExtra.testCodec "works with complete"
            Event.decoder
            Event.encoder
            """ {
                "type": "complete"
            } """
            (Event.Complete Complete.Complete)
        , TestExtra.testCodec "works with displayClick"
            Event.decoder
            Event.encoder
            """ {
                "type": "displayClick"
            } """
            (Event.DisplayClick DisplayClick.DisplayClick)
        , TestExtra.testCodec "works with firstFrame"
            Event.decoder
            Event.encoder
            """ {
                "loadTime": 0.1,
                "type": "firstFrame"
            } """
            (Event.FirstFrame
                { loadTime = 0.1
                }
            )
        , TestExtra.testCodec "works with fullscreen"
            Event.decoder
            Event.encoder
            """ {
                "fullscreen": false,
                "type": "fullscreen"
            } """
            (Event.Fullscreen
                { fullscreen = False
                }
            )
        , TestExtra.testCodec "works with idle"
            Event.decoder
            Event.encoder
            """ {
                "newstate": "buffering",
                "oldstate": "complete",
                "reason": "error",
                "type": "idle"
            } """
            (Event.Idle
                { newstate = S.Buffering
                , oldstate = S.Complete
                , reason = S.Error
                }
            )
        , TestExtra.testCodec "works with mediaType"
            Event.decoder
            Event.encoder
            """ {
                "mediaType": "audio",
                "type": "mediaType"
            } """
            (Event.MediaType
                { mediaType = MT.Audio
                }
            )
        , TestExtra.testCodec "works with pause"
            Event.decoder
            Event.encoder
            """ {
                "newstate": "buffering",
                "oldstate": "complete",
                "pauseReason": "external",
                "reason": "error",
                "type": "pause",
                "viewable": 0
            } """
            (Event.Pause
                { newstate = S.Buffering
                , oldstate = S.Complete
                , pauseReason = PaR.External
                , reason = S.Error
                , viewable = V.Hidden
                }
            )
        , TestExtra.testCodec "works with play"
            Event.decoder
            Event.encoder
            """ {
                "newstate": "buffering",
                "oldstate": "complete",
                "playReason": "autostart",
                "reason": "error",
                "type": "play",
                "viewable": 0
            } """
            (Event.Play
                { newstate = S.Buffering
                , oldstate = S.Complete
                , playReason = PlR.Autostart
                , reason = S.Error
                , viewable = V.Hidden
                }
            )
        , TestExtra.testCodec "works with playlistComplete"
            Event.decoder
            Event.encoder
            """ {
                "type": "playlistComplete"
            } """
            (Event.PlaylistComplete PlaylistComplete.PlaylistComplete)
        , TestExtra.testCodec "works with providerFirstFrame"
            Event.decoder
            Event.encoder
            """ {
                "type": "providerFirstFrame"
            } """
            (Event.ProviderFirstFrame ProviderFirstFrame.ProviderFirstFrame)
        , TestExtra.testCodec "works with ready"
            Event.decoder
            Event.encoder
            """ {
                "setupTime": 0.1,
                "viewable": 0,
                "type": "ready"
            } """
            (Event.Ready
                { setupTime = 0.1
                , viewable = V.Hidden
                }
            )
        , TestExtra.testCodec "works with remove"
            Event.decoder
            Event.encoder
            """ {
                "type": "remove"
            } """
            (Event.Remove Remove.Remove)
        , TestExtra.testCodec "works with resize"
            Event.decoder
            Event.encoder
            """ {
                "height": 0,
                "type": "resize",
                "width": 1
            } """
            (Event.Resize
                { height = 0
                , width = 1
                }
            )
        , TestExtra.testCodec "works with seek"
            Event.decoder
            Event.encoder
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
            (Event.Seek
                { currentTime = 0.1
                , duration = 0.2
                , metadata = M.Metadata Json.Encode.null
                , offset = 0.3
                , position = 0.4
                , seekRange =
                    { end = 0.5
                    , start = 0.6
                    }
                }
            )
        , TestExtra.testCodec "works with seeked"
            Event.decoder
            Event.encoder
            """ {
                "type": "seeked"
            } """
            (Event.Seeked Seeked.Seeked)
        , TestExtra.testCodec "works with setupError"
            Event.decoder
            Event.encoder
            """ {
                "code": 0,
                "message": "",
                "type": "setupError"
            } """
            (Event.SetupError
                { code = 0
                , message = ""
                }
            )
        , TestExtra.testCodec "works with time"
            Event.decoder
            Event.encoder
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
            (Event.Time
                { currentTime = 0.1
                , duration = 0.2
                , metadata = M.Metadata Json.Encode.null
                , position = 0.3
                , seekRange =
                    { end = 0.4
                    , start = 0.5
                    }
                , viewable = V.Hidden
                }
            )
        , TestExtra.testCodec "works with userActive"
            Event.decoder
            Event.encoder
            """ {
                "type": "userActive"
            } """
            (Event.UserActive UserActive.UserActive)
        , TestExtra.testCodec "works with userInactive"
            Event.decoder
            Event.encoder
            """ {
                "type": "userInactive"
            } """
            (Event.UserInactive UserInactive.UserInactive)
        , TestExtra.testCodec "works with viewable"
            Event.decoder
            Event.encoder
            """ {
                "viewable": 0,
                "type": "viewable"
            } """
            (Event.Viewable
                { viewable = V.Hidden }
            )
        , TestExtra.testCodec "works with visualQuality"
            Event.decoder
            Event.encoder
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
            (Event.VisualQuality
                { level =
                    { bitrate = 0
                    , height = 1
                    , index = 2
                    , label = "a"
                    , width = 3
                    }
                , mode = QM.Auto
                , reason = QR.Api
                }
            )
        ]


fuzzer : Fuzz.Fuzzer Event.Event
fuzzer =
    Fuzz.oneOf
        [ Fuzz.map Event.BeforeComplete BeforeComplete.fuzzer
        , Fuzz.map Event.Breakpoint Breakpoint.fuzzer
        , Fuzz.map Event.BufferChange BufferChange.fuzzer
        , Fuzz.map Event.BufferFull BufferFull.fuzzer
        , Fuzz.map Event.Click Click.fuzzer
        , Fuzz.map Event.Complete Complete.fuzzer
        , Fuzz.map Event.DisplayClick DisplayClick.fuzzer
        , Fuzz.map Event.FirstFrame FirstFrame.fuzzer
        , Fuzz.map Event.Fullscreen Fullscreen.fuzzer
        , Fuzz.map Event.Idle Idle.fuzzer
        , Fuzz.map Event.MediaType MediaType.fuzzer
        , Fuzz.map Event.Pause Pause.fuzzer
        , Fuzz.map Event.Play Play.fuzzer
        , Fuzz.map Event.PlaylistComplete PlaylistComplete.fuzzer
        , Fuzz.map Event.ProviderFirstFrame ProviderFirstFrame.fuzzer
        , Fuzz.map Event.Ready Ready.fuzzer
        , Fuzz.map Event.Remove Remove.fuzzer
        , Fuzz.map Event.Resize Resize.fuzzer
        , Fuzz.map Event.Seek Seek.fuzzer
        , Fuzz.map Event.Seeked Seeked.fuzzer
        , Fuzz.map Event.SetupError SetupError.fuzzer
        , Fuzz.map Event.Time Time.fuzzer
        , Fuzz.map Event.UserActive UserActive.fuzzer
        , Fuzz.map Event.UserInactive UserInactive.fuzzer
        , Fuzz.map Event.Viewable Viewable.fuzzer
        , Fuzz.map Event.VisualQuality VisualQuality.fuzzer
        ]
