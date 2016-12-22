package components;

import edge.IComponent;

class Controlled implements IComponent {
	/**
	 * -1 == LEFT
	 * 0 == NOT MOVING
	 * 1 = RIGHT
	 */
	public var movingDirection:Int = 0;
	public var speed:Float = Settings.paddleSpeed;
	
	public function new(speedPercent:Float = 1) {
		speed = speedPercent * Settings.paddleSpeed;
	}
	
	public function getVelocity():Float {
		return speed * movingDirection;
	}
}