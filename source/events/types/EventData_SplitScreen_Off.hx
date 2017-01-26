package events.types;

import events.BaseEventData;

class EventData_SplitScreen_Off extends BaseEventData {
	public static var EVENT_TYPE = 0x6aaa1526;
	
	public function new() {
		super();
	}
	
	override public function getEventType():Int {
		return EVENT_TYPE;
	}
	
}