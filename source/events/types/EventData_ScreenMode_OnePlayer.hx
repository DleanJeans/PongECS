package events.types;

import events.BaseEventData;

class EventData_ScreenMode_OnePlayer extends BaseEventData {
	public static var EVENT_TYPE = 0x02928835;
	
	public function new() {
		super();
	}
	
	override public function getEventType():Int {
		return EVENT_TYPE;
	}
	
}