module Jawa.MetadataTest exposing (fuzzer, test)

import Fuzz
import Jawa.Extra.Test
import Jawa.Metadata
import Json.Encode
import Test


test : Test.Test
test =
    Test.describe "Jawa.Metadata"
        [ Jawa.Extra.Test.fuzzCodec "round trips" Jawa.Metadata.decoder Jawa.Metadata.encoder fuzzer
        , Jawa.Extra.Test.testCodec "works"
            Jawa.Metadata.decoder
            Jawa.Metadata.encoder
            "null"
            (Jawa.Metadata.Metadata Json.Encode.null)
        ]


fuzzer : Fuzz.Fuzzer Jawa.Metadata.Metadata
fuzzer =
    Fuzz.map Jawa.Metadata.Metadata (fuzzerWith 32)


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
