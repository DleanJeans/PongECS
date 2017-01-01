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
	
	public function switchBothToPlayers() {
		switchControl(p1, new PlayerControlled());
		switchControl(p2, new PlayerControlled());
	}
	
	public function switchBothToAI() {
		switchControl(p1, new AIControlled());
		switchControl(p2, new AIControlled());
	}
	
	public function switchP1ToPlayer() {
		switchControl(p1, new PlayerControlled());
	}
	
	public function switchP1Control() { 
		if (p1.existsExactType(AIControlled))
			switchP1ToPlayer();
		else switchControl(p1, new AIControlled());
	}
	
	function switchControl(p:Entity, newControl:Controlled) {
		// if p already has the same type Controlled
		if (p.existsExactType(cast Type.getClass(newControl)))
			return;
		
		p.removeType(Controlled);
		p.add(newControl);
	}
	
	public function centerPaddles() {
		p1.get(FlxSprite).screenCenter(FlxAxes.X);
		p2.get(FlxSprite).screenCenter(FlxAxes.X);
	}
	
	public function createPaddles() {
		p1 = createPaddle(G.settings.playField.bottom - G.settings.unit(4), FlxObject.UP);
		p2 = createPaddle(G.settings.playField.y + G.settings.unit(3), FlxObject.DOWN);
		
		p1.addMany([G.game.teamLower, new AIControlled()]);
		p2.addMany([G.game.teamUpper, new AIControlled()]);
	}
	
	function createPaddle(y:Float = 0, facing:Int) {
		var sprite = G.game.createSprite(0, y, paddles);
		sprite.makeGraphic(G.settings.unit(5), G.settings.unit());
		sprite.screenCenter(FlxAxes.X);
		sprite.immovable = true;
		sprite.facing = facing;
		
		return G.game.createEntity([sprite]);
	}
	
}