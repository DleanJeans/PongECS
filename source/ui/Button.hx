package ui;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class Button extends FlxButton {
	public function new(x:Float = 0, y:Float = 0, text:String = "", ?onClick:Void->Void, ?fieldWidth:Float) {
		super(x, y, text, onClick);
		
		label.color = FlxColor.WHITE;
		label.size = Settings.scale(25);
		label.fieldWidth = fieldWidth != null ? fieldWidth : FlxG.width * 0.5;
		label.alignment = FlxTextAlign.CENTER;
		
		makeGraphic(cast label.width, cast label.height, Color.semiTransparentGray);
	}
	
}