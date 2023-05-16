module Jawa.Event.AudioTracks exposing (AudioTracks, decoder, encoder)

{-|

@docs AudioTracks, decoder, encoder

-}

import Jawa.AudioTrack
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/audio-tracks-events#onaudiotracks>
-}
type alias AudioTracks =
    { currentTrack : Int
    , tracks : List Jawa.AudioTrack.AudioTrack
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder AudioTracks
decoder =
    Json.Decode.map2 AudioTracks
        (Json.Decode.field "currentTrack" Json.Decode.int)
        (Json.Decode.field "tracks" (Json.Decode.list Jawa.AudioTrack.decoder))


{-| A JSON encoder.
-}
encoder : AudioTracks -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "currentTrack", Json.Encode.int x.currentTrack )
        , ( "tracks", Json.Encode.list Jawa.AudioTrack.encoder x.tracks )
        ]
