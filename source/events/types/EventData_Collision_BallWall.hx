package events.types;

import flixel.FlxSprite;

class EventData_Collision_BallWall extends BaseEventData {
	public static inline var EVENT_TYPE:EventType = 0x130bc6a6;
	
	public var ball(default, null):FlxSprite;
	public var wall(default, null):FlxSprite;
	
	public function new(ball:FlxSprite, wall:FlxSprite) {
		super();
		this.ball = ball;
		this.wall = wall;
	}
	
}