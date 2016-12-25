package ui.gameplay.scoreboard;

class ScoreboardPresenter {
	public var view(default, null):ScoreboardView;
	
	public function new(view:ScoreboardView) {
		this.view = view;
	}
	
	public function updateLower(score:Int) {
		view.lowerScore.text = Std.string(score);
	}
	
	public function updateUpper(score:Int) {
		view.upperScore.text = Std.string(score);
	}
	
	public function enableOnePlayerMode() {
		view.upperScore.angle = view.lowerScore.angle = 0;
	}
	
	public function enableTwoPlayerMode() {
		view.upperScore.angle = view.lowerScore.angle = 90;
	}
	
}