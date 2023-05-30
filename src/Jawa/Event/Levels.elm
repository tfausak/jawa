module Jawa.Event.Levels exposing (Levels, decoder, encode, tag)

{-|

@docs Levels, decoder, encode, tag

-}

import Jawa.QualityLevel
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/quality-events-1#onlevels>
-}
type alias Levels =
    { currentQuality : Int
    , levels : List Jawa.QualityLevel.QualityLevel
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Levels
decoder =
    Json.Decode.map2 Levels
        (Json.Decode.field "currentQuality" Json.Decode.int)
        (Json.Decode.field "levels" (Json.Decode.list Jawa.QualityLevel.decoder))


{-| A JSON encoder.
-}
encode : Levels -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "currentQuality", Json.Encode.int x.currentQuality )
        , ( "levels", Json.Encode.list Jawa.QualityLevel.encode x.levels )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "levels"
