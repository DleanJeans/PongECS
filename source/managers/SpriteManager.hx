package managers;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

class SpriteManager {
	var _pool:FlxSpriteGroup;
	
	public function new() {
		_pool = new FlxSpriteGroup();
	}
	
	/**
	 * Create a new FlxSprite and add it to `group` or `container`
	 * @param	x Initial x position
	 * @param	y Initial y position
	 * @param	group Optional FlxSpriteGroup to add to. If not passed, the sprite will be added to `container`
	 * @return A FlxSprite
	 */
	public function createSprite(x:Float = 0, y:Float = 0, ?group:FlxSpriteGroup):FlxSprite {
		var sprite = _pool.recycle(FlxSprite);
		sprite.setPosition(x, y);
		if (group != null)
			group.add(sprite);
		else G.state.add(sprite);
		return sprite;
	}
	
}