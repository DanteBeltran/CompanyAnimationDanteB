-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Dante B
-- Special thanks to Wal Wal for helping in the design of this framework.
-- Date: 2018-04-10
-- Description: This calls the splash screen of the app to load itself.
-----------------------------------------------------------------------------------------

--- hide the staus bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "splash_screen" )
