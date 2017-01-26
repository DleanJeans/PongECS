package events.types;

import flixel.FlxSprite;

class EventData_Collision_BallPaddle extends BaseEventData {
	public static inline var EVENT_TYPE = 0xca89ec14;
	
	public var ball(default, null):FlxSprite;
	public var paddle(default, null):FlxSprite;
	
	public function new(ball:FlxSprite, paddle:FlxSprite) {
		super();
		this.ball = ball;
		this.paddle = paddle;
	}
	
	override public function getEventType():Int {
		return EVENT_TYPE;
	}
	
}