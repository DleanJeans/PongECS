package systems;

import edge.*;
import events.types.*;
import flixel.*;
import flixel.group.*;
import flixel.math.*;
import managers.*;

class Collision implements ISystem {
	private var _balls:FlxSpriteGroup;
	private var _paddles:FlxSpriteGroup;
	private var _walls:FlxSpriteGroup;
	
	public function new() {
		_balls = G.game.balls;
		_paddles = G.game.paddles;
		_walls = G.game.walls;
		
		G.events.addListener1(cast separate_BallBall, EventData_Collision_BallBall.EVENT_TYPE);
		G.events.addListener1(cast separate_BallWall, EventData_Collision_BallWall.EVENT_TYPE);
		G.events.addListener1(cast separate_BallPaddle, EventData_Collision_BallPaddle.EVENT_TYPE);
	}
	
	public function update() {
		FlxG.overlap(_balls, _balls, handleCollision_BallBall);
		FlxG.overlap(_balls, _walls, handleCollision_BallWall);
		FlxG.overlap(_balls, _paddles, handleCollision_BallPaddle);
	}
	
	function handleCollision_BallBall(ball:FlxSprite, ball:FlxSprite) {
		G.events.queueEvent(new EventData_Collision_BallBall(ball, ball));
	}
	
	function handleCollision_BallWall(ball:FlxSprite, wall:FlxSprite) {
		G.events.queueEvent(new EventData_Collision_BallWall(ball, wall));
	}
	
	function handleCollision_BallPaddle(ball:FlxSprite, paddle:FlxSprite) {
		G.events.queueEvent(new EventData_Collision_BallPaddle(ball, paddle));
	}
	
	function separate_BallBall(e:EventData_Collision_BallBall) {
		FlxObject.separate(e.ball1, e.ball2);
	}
	
	function separate_BallWall(e:EventData_Collision_BallWall) {
		FlxObject.separate(e.ball, e.wall);
	}
	
	function separate_BallPaddle(e:EventData_Collision_BallPaddle) {
		var ball = e.ball;
		var paddle = e.paddle;
		
		FlxObject.separate(ball, paddle);
		
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
		angle += G.settings.maxDeflectedAngle * mapped;
		
		// Calculate velocity vector and copy it.
		var velocity = FlxVelocity.velocityFromAngle(angle, G.settings.ballSpeed);
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