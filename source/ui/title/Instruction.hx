package ui.title;

import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.text.FlxText;

class Instruction extends FlxText {
	public function new() {
		var text = 'Score ${G.settings.scoreToWin} points to win\n';
		text +=
		if (FlxG.onMobile)
			"Move Left: Tap Left of paddle\nMove Right: Tap Right of paddle";
		else "Move Left: A/Left Arrow\nMove Right: D/Right Arrow";
		text += "\n\nBy Dlean Jeans\n@DleanJeans";
		
		super(0, 0, G.settings.playField.width, text, G.settings.scale(15));
		alignment = FlxTextAlign.CENTER;
		var lowerHalfScreenCenter = FlxPoint.weak(FlxG.width * 0.5, FlxG.height * 0.75);
		setCenter(lowerHalfScreenCenter);
	}
	
}