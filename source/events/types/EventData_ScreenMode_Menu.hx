package events.types;

import events.BaseEventData;

class EventData_ScreenMode_Menu extends BaseEventData {
	public static var EVENT_TYPE = 0x3aa116ce;
	
	public function new() {
		super();
	}
	
	override public function getEventType():Int {
		return EVENT_TYPE;
	}
	
}