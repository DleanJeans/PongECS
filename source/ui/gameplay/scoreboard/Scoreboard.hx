package ui.gameplay.scoreboard;

import components.Score;
import flixel.group.FlxGroup;

class Scoreboard extends FlxGroup {
	public var view(default, null):ScoreboardView;
	public var presenter(default, null):ScoreboardPresenter;
	
	private var _upper:Score;
	private var _lower:Score;
	
	public function new() {
		super();
		
		_upper = G.game.teamUpper.get(Score);
		_lower = G.game.teamLower.get(Score);
		
		view = new ScoreboardView();
		presenter = new ScoreboardPresenter(view);
		
		add(view);
		
		_upper.changed.add(presenter.updateUpper);
		_lower.changed.add(presenter.updateLower);
		
		var s = G.game.signals;
		s.menuDemoMode.add(presenter.enableOnePlayerMode);
		s.onePlayerMode.add(presenter.enableOnePlayerMode);
		s.twoPlayerMode.add(presenter.enableTwoPlayerMode);
		s.splitScreen.add(presenter.enableSplitScreenMode);
		s.splitScreenOff.add(presenter.disableSplitScreenMode);
	}
	
}