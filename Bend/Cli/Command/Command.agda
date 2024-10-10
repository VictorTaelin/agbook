module Bend.Cli.Command.Command where

-- The main Bend CLI commands
data Command : Set where
  GenBend : Command
  GenCore : Command
  GenHvm  : Command

