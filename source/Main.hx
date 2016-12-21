package;

import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		var width = Lib.current.stage.stageWidth;
		var height = Lib.current.stage.stageHeight;
		addChild(new FlxGame(width, height, PlayState, 1, 60, 60, true));
	}
}