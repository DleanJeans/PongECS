package systems;

import components.AIControllable;
import edge.ISystem;
import flixel.FlxSprite;
import flixel.math.FlxMath;

class AIBallTracker implements ISystem {
	var ball(get, null):FlxSprite; function get_ball() return G.game.balls.members[0];
	
	public function new() {}
	
	public function update(sprite:FlxSprite, ai:AIControllable) {
		if (ball == null) {
			ai.ballComing = false;
			return;
		}
		
		ai.ballComing = FlxMath.signOf(sprite.y - ball.y) == FlxMath.signOf(ball.velocity.y);
		ai.ballCenterX = ball.getCenterX();
	}
}