module Jawa.AudioTrack exposing (AudioTrack, decoder, encode)

{-|

@docs AudioTrack, decoder, encode

-}

import Json.Decode
import Json.Decode.Extra
import Json.Encode
import Maybe.Extra


{-| <https://docs.jwplayer.com/players/reference/getaudiotracks>
-}
type alias AudioTrack =
    { autoselect : Maybe Bool
    , defaulttrack : Bool
    , groupid : Maybe String
    , hlsjsIndex : Maybe Int
    , language : String
    , name : String
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder AudioTrack
decoder =
    Json.Decode.map6 AudioTrack
        (Json.Decode.Extra.optionalNullableField "autoselect" Json.Decode.bool)
        (Json.Decode.field "defaulttrack" Json.Decode.bool)
        (Json.Decode.Extra.optionalNullableField "groupid" Json.Decode.string)
        (Json.Decode.Extra.optionalNullableField "hlsjsIndex" Json.Decode.int)
        (Json.Decode.field "language" Json.Decode.string)
        (Json.Decode.field "name" Json.Decode.string)


{-| A JSON encoder.
-}
encode : AudioTrack -> Json.Encode.Value
encode x =
    [ Maybe.map (Json.Encode.bool >> Tuple.pair "autoselect") x.autoselect
    , Just ( "defaulttrack", Json.Encode.bool x.defaulttrack )
    , Maybe.map (Json.Encode.string >> Tuple.pair "groupid") x.groupid
    , Maybe.map (Json.Encode.int >> Tuple.pair "hlsjsIndex") x.hlsjsIndex
    , Just ( "language", Json.Encode.string x.language )
    , Just ( "name", Json.Encode.string x.name )
    ]
        |> Maybe.Extra.values
        |> Json.Encode.object
