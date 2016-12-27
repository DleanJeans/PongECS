package testing;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.system.scaleModes.StageSizeScaleMode;

class ResolutionSwitcher extends FlxBasic {
	static var widths 	= [800, 360, 400];
	static var heights 	= [600, 640, 600];
	static var index = 0;
	
	public function new() {
		super();
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
		if (pressedLeft()) {
			index--;
			if (index < 0)
				index = widths.length - 1;
		}
		else if (pressedRight()) {
			index++;
			if (index >= widths.length)
				index = 0;
		}
		else return;
		
		FlxG.resizeWindow(widths[index], heights[index]);
		FlxG.resetState();
	}
	
	function pressedLeft():Bool return FlxG.keys.justPressed.LBRACKET;
	function pressedRight():Bool return FlxG.keys.justPressed.RBRACKET;
	
	#end
	
}