module Jawa.Event.Meta exposing (Meta, decoder, encoder)

{-|

@docs Meta, decoder, encoder

-}

import Jawa.Metadata
import Json.Decode
import Json.Encode


{-| <https://docs.jwplayer.com/players/reference/metadata-events#onmeta>
-}
type alias Meta =
    Jawa.Metadata.Metadata


{-| A JSON decoder.
-}
decoder : Json.Decode.Decoder Meta
decoder =
    Jawa.Metadata.decoder


{-| A JSON encoder.
-}
encoder : Meta -> Json.Encode.Value
encoder =
    Jawa.Metadata.encoder
