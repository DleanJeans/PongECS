package ui.gameplay.winnerText;

import components.Direction;
import flixel.FlxG;
import flixel.math.FlxPoint;

using Position;

class WinnerTextPresenter {
	public var upperHalfScreenCenter = FlxPoint.get(FlxG.width * 0.5, FlxG.height * 0.25);
	public var lowerHalfScreenCenter = FlxPoint.get(FlxG.width * 0.5, FlxG.height * 0.75);
	public var lowerLeftScreenCenter = FlxPoint.get(FlxG.width * 0.25, FlxG.height * 0.75);
	public var lowerRightScreenCenter = FlxPoint.get(FlxG.width * 0.75, FlxG.height * 0.75);
	
	var _view:WinnerText;

	public function new(view:WinnerText) {
		_view = view;
	}
	
	public function showAt(teamPosition:Int) {
		UI.show(_view);
		switch (teamPosition) {
			case Direction.UP:
				if (G.settings.splitScreen)
					showLowerRight();
				else showUpper();
			case Direction.DOWN:
				if (G.settings.splitScreen)
					showLowerLeft();
				else showLower();
		}
	}
	
	function showUpper() {
		_view.setCenter(upperHalfScreenCenter);
	}
	
	function showLower() {
		_view.setCenter(lowerHalfScreenCenter);
	}
	
	function showLowerLeft() {
		_view.setCenter(lowerLeftScreenCenter);
	}
	
	function showLowerRight() {
		_view.setCenter(lowerRightScreenCenter);
	}
	
}