module Jawa.Event.Seeked exposing (Seeked, decoder, encode)

{-|

@docs Seeked, decoder, encode

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/seek-events-1#onseeked>
-}
type alias Seeked =
    {}


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Seeked
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always {})


{-| A JSON encoder.
-}
encode : Seeked -> Json.Encode.Value
encode _ =
    Json.Encode.object
        []
