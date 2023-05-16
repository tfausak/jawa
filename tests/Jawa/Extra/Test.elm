module Jawa.Extra.Test exposing
    ( fuzzCodec
    , testCodec
    )

import Expect
import Fuzz
import Json.Decode
import Json.Encode
import Test


expectCodec : Json.Decode.Decoder a -> (a -> Json.Encode.Value) -> String -> a -> Expect.Expectation
expectCodec decoder encoder string =
    Expect.all
        [ expectDecoder decoder string
        , expectEncoder encoder string
        ]


expectDecoder : Json.Decode.Decoder a -> String -> a -> Expect.Expectation
expectDecoder decoder string value =
    Expect.equal
        (Json.Decode.decodeString decoder string)
        (Ok value)


expectEncoder : (a -> Json.Encode.Value) -> String -> a -> Expect.Expectation
expectEncoder encoder string value =
    case Json.Decode.decodeString Json.Decode.value string of
        Err message ->
            Expect.fail (Json.Decode.errorToString message)

        Ok json ->
            Expect.equal
                (encoder value)
                json


fuzzCodec : String -> Json.Decode.Decoder a -> (a -> Json.Encode.Value) -> Fuzz.Fuzzer a -> Test.Test
fuzzCodec label decoder encoder fuzzer =
    Test.fuzz fuzzer label <|
        \value ->
            expectCodec
                decoder
                encoder
                (Json.Encode.encode 0 (encoder value))
                value


testCodec : String -> Json.Decode.Decoder a -> (a -> Json.Encode.Value) -> String -> a -> Test.Test
testCodec label decoder encoder string value =
    Test.test label <| \_ -> expectCodec decoder encoder string value
