module Jawa.Event.PlaylistComplete exposing (PlaylistComplete, decoder, encoder)

{-|

@docs PlaylistComplete, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/advertising-events#onbeforecomplete>
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
encoder : PlaylistComplete -> Json.Encode.Value
encoder _ =
    Json.Encode.object
        []
