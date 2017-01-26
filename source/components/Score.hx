package components;

import edge.IComponent;
import events.types.EventData_ScoreChanged;

class Score implements IComponent {
	public var score(default, set):Int = 0;
	
	public function new() {}
	
	public function add() {
		score++;
	}
	
	public function reset() {
		score = 0;
	}
	
	public function won():Bool {
		return score == G.settings.scoreToWin;
	}
	
	function set_score(newScore:Int):Int {
		G.events.queueEvent(new EventData_ScoreChanged(this));
		return score = newScore;
	}
	
}