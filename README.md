# World: simple, small and compact library for TIC-80

World is a simple library made for making game in TIC-80 less messy.

Example:
```lua
-- insert minified library here

local myGame = WORLD() -- creates the workspace
local myPlayer = PLAYER(myGame, 10, 10) -- creates the player object

myGame.on("UPDATE", function() -- invoked when the game content is updated
    myPlayer.draw() -- draws the player.
    print("X: "..myPlayer.x..", Y: "..myPlayer.y, 1, 1, 12) -- prints the player's position to screen
end)

myGame.on("BUTTON_PRESSED", function(button) -- invoked when the player presses a key.
    -- handles controls
    if button == 0 then
		myPlayer.y = myPlayer.y - 1
	elseif button == 1 then
		myPlayer.y = myPlayer.y + 1
	elseif button == 2 then
		myPlayer.x = myPlayer.x - 1
	elseif button == 3 then
		myPlayer.x = myPlayer.x + 1
	elseif button == 4 then -- if player presses Z then
		myGame.quit() -- quit the game, invoking the "QUIT" event
	end
end)

myGame.on("QUIT", function() -- invoked when myGame.quit() is called.
    trace("The game was closed!", 12)
end)

myGame.run() -- runs the game
```

# Installation

If you want contribute to the project (e.g: for making a pull request) copy the file 'world.lua'
Otherwise if you want to use it in your game, copy 'world.min.lua', its minified so it will need less space on your code.

# Q&A

Q: How i can contribute?
A: Making a pull request, forking it, or simply in the game's code put this comment on your game's code:
```lua
-- using: world library
```

Q: How you had that idea?
A: I feeled that coding in TIC-80 is messy.

Q: What are your expectations to the project?
A: Nothing much.

Q: Are you planning to make a documentation/wiki?
A: Yes but i have other things to care about in my life.