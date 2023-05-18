module Jawa.Event.Buffer exposing (Buffer, decoder, encoder)

{-|

@docs Buffer, decoder, encoder

-}

import Jawa.State
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/playback-events-1#onbuffer>
-}
type alias Buffer =
    { newstate : Jawa.State.State
    , oldstate : Jawa.State.State
    , reason : Jawa.State.State
    }


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Buffer
decoder =
    Json.Decode.map3 Buffer
        (Json.Decode.field "newstate" Jawa.State.decoder)
        (Json.Decode.field "oldstate" Jawa.State.decoder)
        (Json.Decode.field "reason" Jawa.State.decoder)


{-| A JSON encoder.
-}
encoder : Buffer -> Json.Encode.Value
encoder x =
    Json.Encode.object
        [ ( "newstate", Jawa.State.encoder x.newstate )
        , ( "oldstate", Jawa.State.encoder x.oldstate )
        , ( "reason", Jawa.State.encoder x.reason )
        ]
