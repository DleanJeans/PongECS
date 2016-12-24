package testing;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.system.scaleModes.StageSizeScaleMode;

class OrientationSwitcher extends FlxBasic {
	var _landscape:Bool;
	var _width:Int;
	var _height:Int;
	
	public function new() {
		super();
		_landscape = FlxG.width > FlxG.height;
		#if testing
		FlxG.scaleMode = new StageSizeScaleMode();
		#end
	}
	
	#if testing
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		waitKeyToSwitch();
	}
	
	function waitKeyToSwitch() {
		if (!keyPressed())
			return;
		
		if (_landscape)
			switchToPortrait();
		else switchToLandscape();
		
		_landscape = !_landscape;
		FlxG.resizeWindow(_width, _height);
		FlxG.resetGame();
	}
	
	function keyPressed():Bool return FlxG.keys.justPressed.TAB;
	
	function switchToPortrait() {
		setSize(360, 640);
	}
	
	function switchToLandscape() {
		setSize(800, 600);
	}
	
	function setSize(width:Int, height:Int) {
		_width = width;
		_height = height;
	}
	#end
	
}