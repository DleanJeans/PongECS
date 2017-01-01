package systems;

import edge.ISystem;
import flixel.FlxG;
import flixel.math.FlxMath;

class AutoFramerate implements ISystem {
	public var fps(default, null):Float;
	var _lastTicks:Int = 0;
	
	public function update() {
		var ticks = FlxG.game.ticks;
		var elapsed = (ticks - _lastTicks) / 1000;
		fps = 1 / elapsed;
		_lastTicks = ticks;
		
		FlxG.timeScale = FlxG.drawFramerate / fps;
		FlxG.timeScale = FlxMath.bound(FlxG.timeScale, 0.1, 2);
	}
}