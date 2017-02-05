package events.types;

import components.Score;
import edge.Entity;
import events.BaseEventData;

class EventData_ScoreChanged extends BaseEventData {
	public static inline var EVENT_TYPE:EventType = 0xe3f85c96;
	
	public var scoreComponent(default, null):Score;
	public var newScore(get, null):Int; function get_newScore() return scoreComponent.score;
	
	public function new(scoreComponent:Score) {
		super();
		this.scoreComponent = scoreComponent;
	}
}