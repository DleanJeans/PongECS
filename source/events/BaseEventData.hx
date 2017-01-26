package events;

import flixel.FlxG;

class BaseEventData implements EventData {
	public var timeStamp(default, null):Float;

	public function new() {
		timeStamp = FlxG.game.ticks;
	}
	
	public function getEventType():Int {
		return -1;
	}
	
}