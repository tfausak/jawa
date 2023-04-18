module Jawa.MetadataTest exposing (fuzzer, test)

import Fuzz
import Jawa.Metadata as M
import Jawa.Test.Extra as TestExtra
import Json.Encode
import Test


test : Test.Test
test =
    Test.describe "Jawa.Metadata"
        [ TestExtra.fuzzCodec "round trips" M.decoder M.encoder fuzzer
        , TestExtra.testCodec "works"
            M.decoder
            M.encoder
            "null"
            (M.Metadata Json.Encode.null)
        ]


fuzzer : Fuzz.Fuzzer M.Metadata
fuzzer =
    Fuzz.map M.Metadata (fuzzerWith 32)


fuzzerWith : Int -> Fuzz.Fuzzer Json.Encode.Value
fuzzerWith n =
    Fuzz.oneOf
        [ Fuzz.constant Json.Encode.null
        , Fuzz.map Json.Encode.bool Fuzz.bool
        , Fuzz.map Json.Encode.int Fuzz.int
        , Fuzz.map Json.Encode.float Fuzz.niceFloat
        , Fuzz.map Json.Encode.string Fuzz.string
        , Fuzz.map (Json.Encode.list identity) <|
            Fuzz.lazy <|
                \_ ->
                    Fuzz.listOfLengthBetween 0 n <| fuzzerWith <| n // 2
        , Fuzz.map Json.Encode.object <|
            Fuzz.lazy <|
                \_ ->
                    Fuzz.listOfLengthBetween 0 n <| Fuzz.pair Fuzz.string <| fuzzerWith <| n // 2
        ]
