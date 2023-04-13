module Jawa.Event.Seeked exposing (Seeked(..), decoder, encoder)

{-|

@docs Seeked, decoder, encoder

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/seek-events-1#onseeked>
-}
type Seeked
    = Seeked


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Seeked
decoder =
    Json.Decode.dict Json.Decode.value
        |> Json.Decode.map (always Seeked)


{-| A JSON encoder.
-}
encoder : Seeked -> Json.Encode.Value
encoder _ =
    Json.Encode.object
        []
