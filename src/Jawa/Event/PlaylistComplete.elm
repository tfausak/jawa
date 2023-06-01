module Jawa.Event.PlaylistComplete exposing (PlaylistComplete, decoder, encode, tag)

{-|

@docs PlaylistComplete, decoder, encode, tag

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playlist-events#onplaylistcomplete>
-}
type alias PlaylistComplete =
    {}


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder PlaylistComplete
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always {})


{-| A JSON encoder.
-}
encode : PlaylistComplete -> Json.Encode.Value
encode _ =
    Json.Encode.object
        []


{-| The tag that describes this type.
-}
tag : String
tag =
    "playlistComplete"
