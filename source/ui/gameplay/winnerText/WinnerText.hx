package ui.gameplay.winnerText;

import components.Direction;
import events.types.EventData_Win;
import flixel.text.FlxText;

class WinnerText extends FlxText {
	public var presenter(default, null):WinnerTextPresenter;
	
	public function new() {
		super(0, 0, 0, "WINNER", G.settings.scale(60));
		alignment = FlxTextAlign.CENTER;
		UI.hide(this);
		
		presenter = new WinnerTextPresenter(this);
		
		G.events.addListener1(cast updateView, EventData_Win.EVENT_TYPE);
	}
	
	function updateView(e:EventData_Win) {
		if (G.game.inMenu) return;
		presenter.showAt(e.winnerTeam.get(Direction).direction);
	}
	
}