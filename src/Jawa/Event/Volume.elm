module Jawa.Event.Volume exposing (Volume, decoder, encode)

{-|

@docs Volume, decoder, encode

-}

import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/volume-events-1#onvolume>
-}
type alias Volume =
    { volume : Float
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Volume
decoder =
    Json.Decode.map Volume
        (Json.Decode.field "volume" Json.Decode.float)


{-| A JSON encoder.
-}
encode : Volume -> Json.Encode.Value
encode x =
    Json.Encode.object
        [ ( "volume", Json.Encode.float x.volume )
        ]
