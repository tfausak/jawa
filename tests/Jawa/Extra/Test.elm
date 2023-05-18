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
expectCodec decoder encode string =
    Expect.all
        [ expectDecoder decoder string
        , expectEncode encode string
        ]


expectDecoder : Json.Decode.Decoder a -> String -> a -> Expect.Expectation
expectDecoder decoder string value =
    Expect.equal
        (Json.Decode.decodeString decoder string)
        (Ok value)


expectEncode : (a -> Json.Encode.Value) -> String -> a -> Expect.Expectation
expectEncode encode string value =
    case Json.Decode.decodeString Json.Decode.value string of
        Err message ->
            Expect.fail (Json.Decode.errorToString message)

        Ok json ->
            Expect.equal
                (encode value)
                json


fuzzCodec : String -> Json.Decode.Decoder a -> (a -> Json.Encode.Value) -> Fuzz.Fuzzer a -> Test.Test
fuzzCodec label decoder encode fuzzer =
    Test.fuzz fuzzer label <|
        \value ->
            expectCodec
                decoder
                encode
                (Json.Encode.encode 0 (encode value))
                value


testCodec : String -> Json.Decode.Decoder a -> (a -> Json.Encode.Value) -> String -> a -> Test.Test
testCodec label decoder encode string value =
    Test.test label <| \_ -> expectCodec decoder encode string value
