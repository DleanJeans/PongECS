package systems;

import components.Direction;
import components.PlayerControlled;
import edge.Entity;
import edge.ISystem;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.touch.FlxTouch;
import flixel.math.FlxMath;

class TouchController implements ISystem {
	public function update(paddle:FlxSprite, player:PlayerControlled, team:Entity) {
		#if !FLX_NO_TOUCH
		if (FlxG.touches.list.length == 0) {
			player.movingDirection = 0;
			return;
		}
		
		var paddle = paddle.getCenterX();
		var screenHalf = team.get(Direction).direction;
		
		for (t in FlxG.touches.list) {
			var touch = t;
			var touchNotPressed = !touch.pressed;
			var notOnTheSameScreenHalf = FlxMath.numericComparison(touch.screenY, FlxG.height / 2) != screenHalf;
			
			if (touchNotPressed || notOnTheSameScreenHalf)
				continue;
			
			var target = touch.screenX;
			var difference = target - paddle;
			if (Math.abs(difference) < Settings.unit(0.5))
				difference = 0;
			
			player.movingDirection = FlxMath.numericComparison(difference, 0);
		}
		#end
	}
	
}