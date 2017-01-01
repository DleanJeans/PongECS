package components;

import edge.IComponent;
import managers.GameSignals.Signal1;

class Score implements IComponent {
	public var score(default, set):Int = 0;
	public var changed(default, null):Signal1<Int> = new Signal1<Int>();
	
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
		changed.dispatch(newScore);
		return score = newScore;
	}
	
}