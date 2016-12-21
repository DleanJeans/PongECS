package;

import flixel.FlxG;
import flixel.math.FlxRect;

class Settings {
	public static var paddleSpeed:Float;
	public static var ballSpeed:Float;
	public static var maxDeflectedAngle:Int = 45;
	public static var scoreToWin:Int = 3;
	
	static var unitLength:Int = 16;
	public static function unit(times:Float = 1):Int
		return Std.int(unitLength * times);
	
	// the area where the game happens
	public static var playField(default, null):FlxRect;
	
	public static var leftSpace(default, null):FlxRect;
	public static var rightSpace(default, null):FlxRect;
	
	public static function init() {
		var scale = 1.0;
		
		playField = FlxRect.get(0, 0, 450, 600);
		
		// scale to fit playField to screen
		if (FlxG.height <= FlxG.width)
			scale =  FlxG.height / playField.height;
		else scale = FlxG.width / playField.width;
		
		playField.setSize(playField.width * scale, playField.height * scale);
		playField.setPosition((FlxG.width - playField.width) / 2, (FlxG.height - playField.height) / 2);
		
		// scale unitLength too
		unitLength = Std.int(unitLength * scale);
		paddleSpeed = playField.width;
		ballSpeed = playField.height * 0.75;
		
		// the spaces on 2 sides of the playfield
		leftSpace = FlxRect.get(0, 0, playField.x - Settings.unit(), FlxG.height);
		rightSpace = FlxRect.get(playField.right, 0, FlxG.width - playField.right + Settings.unit(), FlxG.height);
	}
}