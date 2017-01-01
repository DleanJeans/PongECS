package ui.gameplay.scoreboard;
import flixel.text.FlxText;

class ScoreboardPresenter {
	public var view(default, null):ScoreboardView;
	
	var _lower:FlxText;
	var _upper:FlxText;
	var _p1:FlxText;
	var _p2:FlxText;
	
	public function new(view:ScoreboardView) {
		this.view = view;
		_lower = _p1 = view.lowerScore;
		_upper = _p2 = view.upperScore;
	}
	
	public function updateLower(score:Int) {
		_p1.text = Std.string(score);
	}
	
	public function updateUpper(score:Int) {
		_p2.text = Std.string(score);
	}
	
	public function enableOnePlayerMode() {
		_p1.angle = _p2.angle = 0;
	}
	
	public function enableTwoPlayerMode() {
		if (Settings.portrait)
			_p1.angle = _p2.angle = 90;
	}
	
	public function enableSplitScreenMode() {
		reset(10);
		
		_p1.fieldWidth = _p2.fieldWidth = 0;
		updateHitboxes();
		
		_p1.setMidRight(Position.screenCenter);
		_p2.setMidLeft(Position.screenCenter);
		
		_p1.x -= Settings.unit();
		_p2.x += Settings.unit();
		
		reset();
	}
	
	public function disableSplitScreenMode() {
		reset();
		
		_p1.fieldWidth = _p2.fieldWidth = Settings.scoreboardFieldWidth;
		updateHitboxes();
		
		_p1.setBottomRight(Position.screenMidRight);
		_p2.setTopRight(Position.screenMidRight);
	}
	
	function reset(score:Int = 0) {
		updateUpper(score);
		updateLower(score);
	}
	
	function updateHitboxes() {
		_p1.updateHitbox();
		_p2.updateHitbox();
	}
	
}