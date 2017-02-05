package events.types;

import flixel.FlxSprite;

class EventData_Collision_BallPaddle extends BaseEventData {
	public static inline var EVENT_TYPE:EventType = 0xca89ec14;
	
	public var ball(default, null):FlxSprite;
	public var paddle(default, null):FlxSprite;
	
	public function new(ball:FlxSprite, paddle:FlxSprite) {
		super();
		this.ball = ball;
		this.paddle = paddle;
	}
	
}