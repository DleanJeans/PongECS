package events.types;

import events.BaseEventData;

class EventData_ScreenMode_TwoPlayer extends BaseEventData {
	public static var EVENT_TYPE = 0xe45d7a44;
	
	public function new() {
		super();
	}
	
	override public function getEventType():Int {
		return EVENT_TYPE;
	}
	
}