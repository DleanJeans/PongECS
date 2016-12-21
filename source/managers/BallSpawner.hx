package managers;

import components.Goal;
import edge.Entity;
import edge.ISystem;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxAngle;
import flixel.math.FlxMath;
import flixel.math.FlxVelocity;
import flixel.util.FlxTimer;

class BallSpawner implements ISystem {
	public var manager(default, null):BallManager;
	
	private var _manager:FlxTimerManager;
	private var _timer:FlxTimer;

	public function new(manager:BallManager) {
		this.manager = manager;
		
		_manager = new FlxTimerManager();
		_timer = new FlxTimer(_manager);
	}
	
	public function update() {
		_manager.update(FlxG.elapsed);
	}
	
	/**
	 * Spawn a ball and shoot it around the direction of the scorer,
	 * which is the direction where the ball's going on the Y axis, after bouncing back.
	 * Delayed for 1 seconds
	 * @param	ball The ball which hit the goal.
	 */
	public function spawnAtScorer(ball:FlxSprite) {
		spawnAtDirection(FlxMath.signOf(ball.velocity.y));
	}
	
	/**
	 * Spawn a ball and shoot it about 90 degree around the `direction`.
	 * @param	direction -1 is UP. 1 is DOWN.
	 * @param	delay Optional delay.
	 * @return	The entity containing the ball as FlxSprite. Game.NULL_ENTITY if delayed.
	 */
	public function spawnAtDirection(direction:Int, delay:Float = 0.5):Entity {
		if (delay > 0) {
			_timer.start(delay, spawnOnTimerGoingOff.bind(direction));
			return Game.NULL_ENTITY;
		}
		
		var angle = 90.0 * Std.int(direction);
		angle += FlxG.random.float(-1, 1) * 45;
		
		return manager.createBall(FlxVelocity.velocityFromAngle(angle, Settings.ballSpeed));
	}
	
	function spawnOnTimerGoingOff(direction:Int, _) {
		spawnAtDirection(direction, 0);
	}
	
}