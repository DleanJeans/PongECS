package systems;

import edge.*;
import flixel.*;
import flixel.group.*;
import flixel.math.*;
import managers.*;

class Collision implements ISystem {
	private var _signals:GameSignals;
	private var _balls:FlxSpriteGroup;
	private var _paddles:FlxSpriteGroup;
	private var _walls:FlxSpriteGroup;
		
	public function new() {
		_signals = G.game.signals;
		_balls = G.game.balls;
		_paddles = G.game.paddles;
		_walls = G.game.walls;
		
		_signals.ball_ball.add(seperate);
		_signals.ball_wall.add(seperate);
		_signals.ball_paddle.add(ball_paddle);
	}
	
	public function update() {
		if (FlxG.overlap(_balls, _balls, _signals.ball_ball.dispatch))
			_signals.ball_ball_0.dispatch();
		
		if (FlxG.overlap(_balls, _walls, _signals.ball_wall.dispatch))
			_signals.ball_wall_0.dispatch();
		
		if (FlxG.overlap(_balls, _paddles, _signals.ball_paddle.dispatch))
			_signals.ball_paddle_0.dispatch();
	}
	
	public function seperate(sprite1:FlxSprite, sprite2:FlxSprite) {
		FlxObject.separate(sprite1, sprite2);
	}
	
	function ball_paddle(ball:FlxSprite, paddle:FlxSprite) {
		FlxObject.separate(paddle, ball);
		
		var stop = false;
		var ballCenterY = ball.getCenterY();
		var paddleCenterY = paddle.getCenterY();
		
		/**
		 * If the ball hits the paddle's side,
		 * it will be pushed either up front or behind the paddle.
		 * If it's pushed behind, then it won't be deflected,
		 * the function stops there.
		 */
		switch (paddle.facing) {
			case FlxObject.DOWN:
				// If ball is level or lower than paddle
				if (ballCenterY >= paddleCenterY) {
					pushBallDown(ball, paddle);
				}
				else {
					pushBallUp(ball, paddle);
					stop = true;
				}
			case FlxObject.UP:
				// If ball is level or higher than paddle
				if (ballCenterY <= paddleCenterY) {
					pushBallUp(ball, paddle);
				}
				else {
					pushBallDown(ball, paddle);
					stop = true;
				}
		}
		
		if (stop) return;
		
		// Calculate deflected angle.
		var mapped = FlxMath.remapToRange(ball.getCenterX(), paddle.x, paddle.getRight(), -1, 1);
		var angle = FlxAngle.angleFromFacing(paddle.facing, true);
		mapped = FlxMath.bound(mapped, -1, 1);
		
		// Subtract mapped angle if paddle faces down
		if (paddle.facing == FlxObject.DOWN)
			mapped *= -1;
		angle += Settings.maxDeflectedAngle * mapped;
		
		// Calculate velocity vector and copy it.
		var velocity = FlxVelocity.velocityFromAngle(angle, Settings.ballSpeed);
		ball.velocity.copyFrom(velocity);
		velocity.put();
	}
	
	inline function pushBallUp(ball:FlxSprite, paddle:FlxSprite) {
		ball.y =  paddle.y - ball.height;
	}
	
	inline function pushBallDown(ball:FlxSprite, paddle:FlxSprite) {
		ball.y =  paddle.getBottom();
	}
	
}