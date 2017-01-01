package systems;

import components.AIControlled;
import edge.ISystem;
import flixel.FlxSprite;
import flixel.math.FlxMath;

class AIController implements ISystem {

	public function update(sprite:FlxSprite, ai:AIControlled) {
		var paddle = sprite.getCenterX();
		ai.target = ai.ballCenterX;
		if (!ai.ballComing)
			ai.target = G.settings.playField.getCenterX();
		ai.target = snap(paddle, ai.target);
		
		ai.movingDirection = FlxMath.numericComparison(ai.target, paddle);
	}
	
	function snap(paddle:Float, target:Float):Float {
		if (Math.abs(paddle - target) < G.settings.unit(0.5))
			target = paddle;
		return target;
	}
	
}