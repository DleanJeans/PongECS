package ui.gameplay.winnerText;

import components.Direction;

class WinnerTextPresenter {
	var _view:WinnerText;

	public function new(view:WinnerText) {
		_view = view;
	}
	
	public function showAt(position:Int) {
		switch (position) {
			case Direction.UP:
				showUpper();
			case Direction.DOWN:
				showLower();
		}
	}
	
	public function showUpper() {
		UI.show(_view);
		_view.setBottom(Position.screenCenter.y - 100);
	}
	
	public  function showLower() {
		UI.show(_view);
		_view.y = Position.screenCenter.y + 100;
	}
	
}