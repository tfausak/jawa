module Jawa.Event.SubtitlesTrackChanged exposing (SubtitlesTrackChanged, decoder, encode, tag)

{-|

@docs SubtitlesTrackChanged, decoder, encode, tag

-}

import Jawa.SubtitleTrack
import Json.Decode
import Json.Encode


{-| This event is not documented.
-}
type alias SubtitlesTrackChanged =
    { currentTrack : Int
    , tracks : List Jawa.SubtitleTrack.SubtitleTrack
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder SubtitlesTrackChanged
decoder =
    Json.Decode.map2 SubtitlesTrackChanged
        (Json.Decode.field "currentTrack" Json.Decode.int)
        (Json.Decode.field "tracks" (Json.Decode.list Jawa.SubtitleTrack.decoder))


{-| A JSON encoder.
-}
encode : SubtitlesTrackChanged -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "currentTrack", Json.Encode.int x.currentTrack )
        , ( "tracks", Json.Encode.list Jawa.SubtitleTrack.encode x.tracks )
        ]


{-| The tag that describes this type.
-}
tag : String
tag =
    "subtitlesTrackChanged"
