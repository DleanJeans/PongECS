package;

import flixel.FlxG;
import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		var width = 800;
		var height = 600;
		if (FlxG.onMobile) {
			width = Lib.current.stage.stageWidth;
			height = Lib.current.stage.stageHeight;
		}
		addChild(new FlxGame(width, height, PlayState, 1, 60, 60, true));
	}
}