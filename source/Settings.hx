package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.math.FlxRect;
import flixel.system.scaleModes.FixedScaleAdjustSizeScaleMode;
import flixel.system.scaleModes.FixedScaleMode;

class Settings {
	static var _scale(default, null):Float = 1;
	public static function scale(value:Float):Int
		return Std.int(value * _scale);
	
	public static var splitScreenPossible(get, never):Bool; static function get_splitScreenPossible() return !FlxG.onMobile && landscape;
	
	@:allow(Game)
	public static var splitScreen(default, null):Bool = false;
	
	public static var paddleSpeed:Float;
	public static var ballSpeed:Float;
	public static var maxDeflectedAngle:Int = 45;
	public static var scoreToWin:Int = 3;
	
	static var unitLength:Int = 16;
	public static function unit(times:Float = 1):Int
		return Std.int(unitLength * times);
	
	// the area where the game happens
	public static var playField(default, null):FlxRect;
	
	public static var landscape(get, never):Bool; static function get_landscape() return FlxG.width >= FlxG.height;
	public static var portrait(get, never):Bool; static function get_portrait() return !landscape;
	
	// the spaces on 2 sides of the playfield
	public static var leftSpace(default, null):FlxRect;
	public static var rightSpace(default, null):FlxRect;
	
	public static var scoreboardFieldWidth(default, null):Float;
	
	public static function init() {
		hideMouseOnMobileWeb();
		setPlayField();
		calculateScale();
		scalePlayField();
		calculateSpaces();
		scaleStuff();
	}
	
	static function hideMouseOnMobileWeb() {
		#if html5
		if (FlxG.onMobile)
			FlxG.mouse.visible = false;
		#end
	}
	
	static function setPlayField() {
		playField = FlxRect.get(0, 0, 400, 600);
	}
	
	/**
	 * To fit playField to screen
	 */
	static function calculateScale() {
		if (Settings.landscape)
			_scale =  FlxG.height / playField.height;
		else _scale = FlxG.width / playField.width;
	}
	
	static function scalePlayField() {
		playField.setSize(scale(playField.width), scale(playField.height));
		playField.setCenter(DPosition.screenCenter);
	}
	
	static function calculateSpaces() {
		leftSpace = FlxRect.get(0, 0, playField.x - Settings.unit(), FlxG.height);
		rightSpace = FlxRect.get(playField.right, 0, FlxG.width - playField.right + Settings.unit(), FlxG.height);
	}
	
	static function scaleStuff() {
		unitLength = scale(unitLength);
		paddleSpeed = playField.width;
		ballSpeed = playField.height * 0.75;
		scoreboardFieldWidth = rightSpace.width - unit(2);
	}
}