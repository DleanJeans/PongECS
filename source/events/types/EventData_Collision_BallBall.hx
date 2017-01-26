package events.types;

import flixel.FlxSprite;

class EventData_Collision_BallBall extends BaseEventData {
	public static inline var EVENT_TYPE = 0x94ab3d86;
	
	public var ball1(default, null):FlxSprite;
	public var ball2(default, null):FlxSprite;
	
	public function new(ball1:FlxSprite, ball2:FlxSprite) {
		super();
		this.ball1 = ball1;
		this.ball2 = ball2;
	}
	
	override public function getEventType():Int {
		return EVENT_TYPE;
	}
	
}