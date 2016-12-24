package managers;

import components.*;
import edge.*;
import flixel.*;
import flixel.group.*;
import flixel.math.*;

class WallManager {
	public var walls(default, null):FlxSpriteGroup;
	
	public var top(default, null):Entity;
	public var bottom(default, null):Entity;
	public var left(default, null):Entity;
	public var right(default, null):Entity;

	public function new() {
		walls = G.game.walls;
	}
	
	public function createWalls() {
		var pf = Settings.playField;
		var width = Settings.unit();
		
		top = createWall(FlxRect.weak(pf.x, pf.y, pf.width, width));
		bottom = createWall(FlxRect.weak(pf.x, pf.bottom - width, pf.width, width));
		left = createWall(FlxRect.weak(pf.left - width, pf.y, width, pf.height));
		right = createWall(FlxRect.weak(pf.right, pf.y, width, pf.height));
		
		top.add(G.game.teamUpper.get(Goal));
		bottom.add(G.game.teamLower.get(Goal));
	}
	
	function createWall(rect:FlxRect):Entity {
		var sprite = G.game.createSprite(rect.x, rect.y, walls);
		sprite.makeGraphic(cast rect.width, cast rect.height);
		sprite.immovable = true;
		rect.putWeak();
		
		return G.game.engine.create([sprite]);
	}
	
}