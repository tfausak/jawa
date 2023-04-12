module Jawa.EventTest exposing (test)

import Fuzz
import Jawa.Event as Event
import Jawa.Event.ReadyTest as ReadyTest
import Jawa.Event.Remove as Remove
import Jawa.Event.RemoveTest as RemoveTest
import Jawa.Event.SetupErrorTest as SetupErrorTest
import Jawa.Event.UserActive as UserActive
import Jawa.Event.UserActiveTest as UserActiveTest
import Jawa.TestHelper as TestHelper
import Jawa.Visibility as Visibility
import Test


test : Test.Test
test =
    Test.concat
        [ TestHelper.fuzzCodec "round trips" Event.decoder Event.encoder fuzzer
        , TestHelper.testCodec "works with ready"
            Event.decoder
            Event.encoder
            """ {
                "setupTime": 0.1,
                "viewable": 0,
                "type": "ready"
            } """
            (Event.Ready
                { setupTime = 0.1
                , viewable = Visibility.Hidden
                }
            )
        , TestHelper.testCodec "works with remove"
            Event.decoder
            Event.encoder
            """ {
                "type": "remove"
            } """
            (Event.Remove Remove.Remove)
        , TestHelper.testCodec "works with setupError"
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
        , TestHelper.testCodec "works with userActive"
            Event.decoder
            Event.encoder
            """ {
                "type": "userActive"
            } """
            (Event.UserActive UserActive.UserActive)
        ]


fuzzer : Fuzz.Fuzzer Event.Event
fuzzer =
    Fuzz.oneOf
        [ Fuzz.map Event.Ready ReadyTest.fuzzer
        , Fuzz.map Event.Remove RemoveTest.fuzzer
        , Fuzz.map Event.SetupError SetupErrorTest.fuzzer
        , Fuzz.map Event.UserActive UserActiveTest.fuzzer
        ]
