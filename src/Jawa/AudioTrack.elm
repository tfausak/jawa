module Jawa.AudioTrack exposing (AudioTrack, decoder, encode)

{-|

@docs AudioTrack, decoder, encode

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/getaudiotracks>
-}
type alias AudioTrack =
    { autoselect : Bool
    , defaulttrack : Bool
    , language : String
    , name : String
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder AudioTrack
decoder =
    Json.Decode.map4 AudioTrack
        (Json.Decode.field "autoselect" Json.Decode.bool)
        (Json.Decode.field "defaulttrack" Json.Decode.bool)
        (Json.Decode.field "language" Json.Decode.string)
        (Json.Decode.field "name" Json.Decode.string)


{-| A JSON encoder.
-}
encode : AudioTrack -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "autoselect", Json.Encode.bool x.autoselect )
        , ( "defaulttrack", Json.Encode.bool x.defaulttrack )
        , ( "language", Json.Encode.string x.language )
        , ( "name", Json.Encode.string x.name )
        ]
