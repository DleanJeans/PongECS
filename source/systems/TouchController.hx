package systems;

import components.Direction;
import components.PlayerControllable;
import edge.Entity;
import edge.ISystem;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxMath;

using Position;

class TouchController implements ISystem {
	public function update(paddle:FlxSprite, player:PlayerControllable, team:Entity) {
		#if !FLX_NO_TOUCH
		if (FlxG.touches.list.length == 0) {
			player.movingDirection = 0;
			return;
		}
		
		var paddle = paddle.getCenterX();
		var screenHalf = team.get(Direction).direction;
		
		for (touch in FlxG.touches.list) {
			var touchNotPressed = !touch.pressed;
			var notOnTheSameScreenHalf = FlxMath.numericComparison(touch.screenY, FlxG.height / 2) != screenHalf;
			
			if (touchNotPressed || notOnTheSameScreenHalf)
				continue;
			
			var target = touch.screenX;
			var difference = target - paddle;
			if (Math.abs(difference) < G.settings.unit(0.5))
				difference = 0;
			
			player.movingDirection = FlxMath.numericComparison(difference, 0);
		}
		#end
	}
	
}