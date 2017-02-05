package events.types;

import edge.Entity;
import events.BaseEventData;

class EventData_Win extends BaseEventData {
	public static inline var EVENT_TYPE:EventType = 0xddef0bbb;
	
	public var winnerTeam(default, null):Entity;
	
	public function new(winnerTeam:Entity) {
		super();
		this.winnerTeam = winnerTeam;
	}
}