package events;

import flixel.FlxG;

@:autoBuild(events.EventTypeMacro.apply())
class BaseEventData {
	public static inline var EVENT_TYPE = -1;
	
	public var timeStamp(default, null):Float;

	public function new() {
		timeStamp = FlxG.game.ticks;
	}
	
	public function getEventType():EventType {
		return EVENT_TYPE;
	}
	
}