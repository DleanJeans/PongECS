package managers;

import components.*;
import edge.*;
import flixel.*;
import flixel.group.*;
import flixel.util.*;

class PaddleManager {
	public var paddles(default, null):FlxSpriteGroup;
	
	public var p1(default, null):Entity;
	public var p2(default, null):Entity;
 
	public function new() {
		paddles = G.game.paddles;
	}
	
	public function switchControlMode() {
		if (p1.existsType(AIControlled)) {
			p1.removeType(AIControlled);
			p1.add(new PlayerControlled());
		}
		else {
			p1.removeType(PlayerControlled);
			p1.add(new AIControlled());
		}
	}
	
	public function centerPaddles() {
		p1.get(FlxSprite).screenCenter(FlxAxes.X);
		p2.get(FlxSprite).screenCenter(FlxAxes.X);
	}
	
	public function createPaddles() {
		p1 = createPaddle(Settings.playField.bottom - Settings.unit(4), FlxObject.UP);
		p2 = createPaddle(Settings.playField.y + Settings.unit(3), FlxObject.DOWN);
		
		p1.addMany([G.game.teamLower, new AIControlled()]);
		p2.addMany([G.game.teamUpper, new AIControlled()]);
	}
	
	function createPaddle(y:Float = 0, facing:Int) {
		var sprite = G.game.createSprite(0, y, paddles);
		sprite.makeGraphic(Settings.unit(5), Settings.unit());
		sprite.screenCenter(FlxAxes.X);
		sprite.immovable = true;
		sprite.facing = facing;
		
		return G.game.engine.create([sprite]);
	}
	
}