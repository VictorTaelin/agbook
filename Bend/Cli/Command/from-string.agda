module Bend.Cli.Command.from-string where

open import Base.String.String
open import Base.Maybe.Maybe
open import Bend.Cli.Command.Command

-- Converts a string representation of a command to the corresponding Command value.
-- - cmd: The string representation of the command.
-- = Some Command if the string matches a valid command, None otherwise.
from-string : String → Maybe Command
from-string "gen-bend" = Some GenBend
from-string "gen-core" = Some GenCore
from-string "gen-hvm"  = Some GenHvm
from-string _          = None

