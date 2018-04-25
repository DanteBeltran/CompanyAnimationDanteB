-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Dante B
-- Special thanks to Wal Wal for helping in the design of this framework.
-- Date: 2018-04-10
-- Description: This is the splash screen of the game. It displays the 
-- company logo that...
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local lSeparate
local eSeparate
local gamesSeparate
local hyphenSeperate
local scrollXSpeed = 5
local scrollXSpeed2 = -5
local scrollYSpeed = 5
local scrollYSpeed2 = -3
local splSound = audio.loadSound("Sounds/Splashscreen Music.mp3")
local splSoundsChannel


--play audio
splSoundChannel = audio.play(splSound)
--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that moves the L across the screen and rotates the image
local function moveE(event)
    eSeparate.x = eSeparate.x + scrollXSpeed
    eSeparate:rotate(6)
    -- makes the image stop at 300 x and sets the rotation to 0
    if (eSeparate.x == 300) then
        scrollXSpeed = 0
        eSeparate.rotation = 0
    end
end

-- The function that moves the E across the screen and rotates the image
local function moveL(event)
    lSeparate.x = lSeparate.x + scrollXSpeed2
    lSeparate:rotate(-5.7)
    -- makes the image stop at 680 x and sets the rotation of the image to 0
    if (lSeparate.x == 680) then
        scrollXSpeed2 = 0
        lSeparate.rotation = 0
    end
end

-- The function that moves the Games across the screen 
local function moveGames(event)
    gamesSeparate.y = gamesSeparate.y + scrollYSpeed2
    -- makes the image stop at 513 y
    if (gamesSeparate.y == 513) then
        scrollYSpeed2 = 0
    end
end

-- The function that moves the Hyphen across the screen and slowly changes the transparency
local function moveHyphen(event)
    hyphenSeparate.y = hyphenSeparate.y + scrollYSpeed
    hyphenSeparate.alpha = hyphenSeparate.alpha + 0.03
    -- makes the image stop moving at 270 y
    if (hyphenSeparate.y == 270) then
        scrollYSpeed = 0
    end

end
-- makes the screen transition from the splash screen to the main menu screen
local function gotoMainMenu( )
    composer.gotoScene( "main_menu", {effect = "zoomOutInFadeRotate", time = 500})
end
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    display.setDefault("background", 0, 0, 0)

    -- Insert the E image
    eSeparate = display.newImageRect("Images/E Separate.png", 250, 250)

    -- set the initial x and y position of the E
    eSeparate.x = 0
    eSeparate.y = display.contentHeight/3

    -- Insert the L image
    lSeparate = display.newImageRect("Images/L Separate.png", 250, 250)

    -- set the initial x and y position of the L
    lSeparate.x = 1000
    lSeparate.y = display.contentHeight/3

    -- Insert the Games image
    gamesSeparate = display.newImageRect("Images/Games Separate.png", 400, 200)

    -- set the initial x and y position of the games
    gamesSeparate.x = 500
    gamesSeparate.y = display.contentHeight/3*3

    -- Insert the hyphen image
    hyphenSeparate = display.newImageRect("Images/Hyphen Separate.png", 150, 100)

    -- set the initial x and y position of the hyphen
    hyphenSeparate.x = 490
    hyphenSeparate.y = 0
    --set hyphen to be transparent
    hyphenSeparate.alpha = 0

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( lSeparate )
    sceneGroup:insert( eSeparate )
    sceneGroup:insert( gamesSeparate )
    sceneGroup:insert( hyphenSeparate )

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Call the move L,E,Games,Hyphen function as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", moveL)
        Runtime:addEventListener("enterFrame", moveE)
        Runtime:addEventListener("enterFrame", moveGames)
        Runtime:addEventListener("enterFrame", moveHyphen)

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 4000, gotoMainMenu)            
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        -- stop the jungle sounds channel for this screen
        audio.stop(splSoundsChannel)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
