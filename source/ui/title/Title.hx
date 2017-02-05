package ui.title;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.text.FlxText;

using Position;

class Title extends FlxSpriteGroup {
	public var name(default, null):FlxText;
	public var sub(default, null):FlxText;

	public function new() {
		super();
		
		name = new FlxText(0, 0, 0, "Pong", G.settings.scale(100));
		sub = new FlxText(0, 0, 0, "ECS", G.settings.scale(30));
		
		add(name);
		add(sub);
		
		var upperHalfScreenCenter = FlxPoint.weak(FlxG.width * 0.5, FlxG.height * 0.25);
		name.setCenter(upperHalfScreenCenter);
		sub.setTopRight(name.getBottomRight());
	}
	
}