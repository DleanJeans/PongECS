package managers;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

class SpriteManager {
	var _pool:FlxSpriteGroup;
	
	public function new() {
		_pool = new FlxSpriteGroup();
	}
	
	/**
	 * Create a new FlxSprite and add it to the optional `group`.
	 */
	public function createSprite(x:Float = 0, y:Float = 0, ?group:FlxSpriteGroup):FlxSprite {
		var sprite = _pool.recycle(FlxSprite);
		sprite.setPosition(x, y);
		if (group != null)
			group.add(sprite);
		return sprite;
	}
	
}