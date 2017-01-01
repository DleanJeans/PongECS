package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.math.FlxRect;
import flixel.system.scaleModes.FixedScaleAdjustSizeScaleMode;
import flixel.system.scaleModes.FixedScaleMode;

class Settings {
	var _scale(default, null):Float = 1;
	public function scale(value:Float):Int
		return Std.int(value * _scale);
	
	public var splitScreenPossible(get, never):Bool; function get_splitScreenPossible() return !FlxG.onMobile && landscape;
	
	@:allow(Game)
	public var splitScreen(default, null):Bool = false;
	
	public var paddleSpeed:Float;
	public var ballSpeed:Float;
	public var maxDeflectedAngle:Int = 45;
	public var scoreToWin:Int = 3;
	
	var unitLength:Int = 16;
	public function unit(times:Float = 1):Int
		return Std.int(unitLength * times);
	
	// the area where the game happens
	public var playField(default, null):FlxRect;
	
	public var landscape(get, never):Bool; function get_landscape() return FlxG.width >= FlxG.height;
	public var portrait(get, never):Bool; function get_portrait() return !landscape;
	
	// the spaces on 2 sides of the playfield
	public var leftSpace(default, null):FlxRect;
	public var rightSpace(default, null):FlxRect;
	
	public var scoreboardFieldWidth(default, null):Float;
	
	public function new() {
		hideMouseOnMobileWeb();
		setPlayField();
		calculateScale();
		scalePlayField();
		calculateSpaces();
		scaleStuff();
	}
	
	function hideMouseOnMobileWeb() {
		#if html5
		if (FlxG.onMobile)
			FlxG.mouse.visible = false;
		#end
	}
	
	function setPlayField() {
		playField = FlxRect.get(0, 0, 400, 600);
	}
	
	/**
	 * To fit playField to screen
	 */
	function calculateScale() {
		if (landscape)
			_scale =  FlxG.height / playField.height;
		else _scale = FlxG.width / playField.width;
	}
	
	function scalePlayField() {
		playField.setSize(scale(playField.width), scale(playField.height));
		playField.setCenter(DPosition.screenCenter);
	}
	
	function calculateSpaces() {
		leftSpace = FlxRect.get(0, 0, playField.x - unit(), FlxG.height);
		rightSpace = FlxRect.get(playField.right, 0, FlxG.width - playField.right + unit(), FlxG.height);
	}
	
	function scaleStuff() {
		unitLength = scale(unitLength);
		paddleSpeed = playField.width;
		ballSpeed = playField.height * 0.75;
		scoreboardFieldWidth = rightSpace.width - unit(2);
	}
}