package events.types;

import events.BaseEventData;

class EventData_SplitScreen_On extends BaseEventData {
	public static var EVENT_TYPE = 0x2d8019e1;
	
	public function new() {
		super();
	}
	
	override public function getEventType():Int {
		return EVENT_TYPE;
	}
	
}