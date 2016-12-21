package ui.gameplay.scoreboard;

import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;

class ScoreboardView extends FlxSpriteGroup {
	public var upperScore(default, null):FlxText;
	public var lowerScore(default, null):FlxText;
	
	public function new() {
		super();
		
		var space = Settings.rightSpace;
		
		upperScore = new FlxText(0, 0, space.width, "0", 50);
		lowerScore = new FlxText(0, 0, space.width, "0", 50);
		
		upperScore.alignment =
		lowerScore.alignment = FlxTextAlign.CENTER;
		
		add(upperScore);
		add(lowerScore);
		
		setPosition(space.x, space.y);
		lowerScore.setBottom(space.getBottom());
	}
	
}