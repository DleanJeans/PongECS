#PongECS

##Dependencies

###[HaxeFlixel](https://github.com/HaxeFlixel/flixel)
Install the `dev` branch
```
haxelib git flixel https://github.com/HaxeFlixel/flixel
```
###[Edge](https://github.com/fponticelli/edge)
Install my fork of the Edge ECS engine by [@fponticelli](https://github.com/fponticelli)
```
haxelib git edge https://github.com/DleanJeans/edge
```

##Classes

###[`G`](https://github.com/DleanJeans/PongECS/blob/master/source/G.hx)
The global class for reference to the `FlxState`, `Game` and `UI`.

###[`Game`](https://github.com/DleanJeans/PongECS/blob/master/source/Game.hx)
Contains and setups the Edge engine, FlxSpriteGroups, managers, systems, phases and signals.

###[`UI`](https://github.com/DleanJeans/PongECS/blob/master/source/UI.hx)
Uses MVC, MVP or something like that, kinda :P.  
Contains the all the UI components of the game.
