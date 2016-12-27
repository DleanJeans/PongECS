package ui.title;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;

class Title extends FlxSpriteGroup {
	public var name(default, null):FlxText;
	public var sub(default, null):FlxText;

	public function new() {
		super();
		
		name = new FlxText(0, 100, 0, "Pong", Settings.scale(100));
		sub = new FlxText(0, 0, 0, "ECS", Settings.scale(30));
		
		add(name);
		add(sub);
		
		name.setCenterX(Position.screenCenter.x);
		sub.setTopRight(name.getBottomRight());
	}
	
}