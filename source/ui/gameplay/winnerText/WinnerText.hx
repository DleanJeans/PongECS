package ui.gameplay.winnerText;

import components.Direction;
import edge.Entity;
import flixel.FlxG;
import flixel.text.FlxText;

class WinnerText extends FlxText {
	public var presenter(default, null):WinnerTextPresenter;
	
	public function new() {
		super(0, 0, 0, "WINNER", Settings.scale(60));
		alignment = FlxTextAlign.CENTER;
		UI.hide(this);
		
		presenter = new WinnerTextPresenter(this);
		
		G.game.signals.won.add(updateView);
	}
	
	private function updateView(team:Entity) {
		if (G.game.inMenu) return;
		presenter.showAt(team.get(Direction).direction);
	}
	
}