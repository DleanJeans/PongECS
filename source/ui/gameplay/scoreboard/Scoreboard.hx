package ui.gameplay.scoreboard;

import components.Score;
import flixel.group.FlxGroup;
import events.types.*;

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
		
		G.events.addListener1(cast presenter.updateScore, EventData_ScoreChanged.EVENT_TYPE);
		
		G.events.addListener0(presenter.enableOnePlayerMode, EventData_ScreenMode_Menu.EVENT_TYPE);
		G.events.addListener0(presenter.enableOnePlayerMode, EventData_ScreenMode_OnePlayer.EVENT_TYPE);
		G.events.addListener0(presenter.enableTwoPlayerMode, EventData_ScreenMode_TwoPlayer.EVENT_TYPE);
		G.events.addListener0(presenter.enableSplitScreenMode, EventData_SplitScreen_On.EVENT_TYPE);
		G.events.addListener0(presenter.disableSplitScreenMode, EventData_SplitScreen_Off.EVENT_TYPE);
	}
	
}