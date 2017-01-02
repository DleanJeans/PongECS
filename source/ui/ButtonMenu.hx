package ui;

import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class ButtonMenu extends FlxTypedSpriteGroup<Button> {
	var _lastButton:Button;
	
	public function new(x:Float = 0, y:Float = 0) {
		super(x, y);
	}
	
	public function addButton(text:String, ?onClick:Void->Void):Button {
		var y = _lastButton != null ? _lastButton.getBottom() + 10 - this.y : 0;
		_lastButton = new Button(0, y, text, onClick);
		return add(_lastButton);
	}
	
	public function switchToOtherMenu(other:ButtonMenu) {
		UI.hide(this);
		UI.show(other);
	}
	
}