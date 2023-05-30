module Jawa.Event.LevelsChanged exposing (LevelsChanged, decoder, encode, tag)

{-|

@docs LevelsChanged, decoder, encode, tag

-}

import Jawa.QualityLevel
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/quality-events-1#onlevelschanged>
-}
type alias LevelsChanged =
    { currentQuality : Int
    , levels : List Jawa.QualityLevel.QualityLevel
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder LevelsChanged
decoder =
    Json.Decode.map2 LevelsChanged
        (Json.Decode.field "currentQuality" Json.Decode.int)
        (Json.Decode.field "levels" (Json.Decode.list Jawa.QualityLevel.decoder))


{-| A JSON encoder.
-}
encode : LevelsChanged -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "currentQuality", Json.Encode.int x.currentQuality )
        , ( "levels", Json.Encode.list Jawa.QualityLevel.encode x.levels )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "levelsChanged"
