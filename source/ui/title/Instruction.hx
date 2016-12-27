package ui.title;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxAxes;

class Instruction extends FlxText {
	public function new() {
		var text = 'Score ${Settings.scoreToWin} points to win\n';
		text +=
		if (FlxG.onMobile)
			"Move Left: Tap Left of paddle\nMove Right: Tap Right of paddle";
		else "Move Left: A/Left Arrow\nMove Right: D/Right Arrow";
		text += "\n\nBy Dlean Jeans\n@DleanJeans";
		
		super(0, FlxG.height - 150, Settings.playField.width, text, Settings.scale(15));
		alignment = FlxTextAlign.CENTER;
		screenCenter(FlxAxes.X);
	}
	
}