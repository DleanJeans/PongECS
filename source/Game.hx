package;

import components.*;
import edge.*;
import flixel.*;
import flixel.group.*;
import managers.*;
import systems.*;
import ui.*;

class Game extends FlxGroup {
	public static var NULL_ENTITY:Entity;
	
	public var engine(default, null):Engine;
	
	public var teamUpper(get, null):Entity; function get_teamUpper() return teamManager.teamUpper;
	public var teamLower(get, null):Entity; function get_teamLower() return teamManager.teamLower;
	
	public var paddles(default, null):FlxSpriteGroup;
	public var walls(default, null):FlxSpriteGroup;
	public var balls(default, null):FlxSpriteGroup;
	
	public var signals(default, null):GameSignals;
	
	public var wallManager(default, null):WallManager;
	public var goalManager(default, null):GoalManager;
	public var paddleManager(default, null):PaddleManager;
	public var teamManager(default, null):TeamManager;
	public var ballManager(default, null):BallManager;
	public var ballSpawner(default, null):BallSpawner;
	public var winCheck(default, null):WinCheck;
	public var restarter(default, null):Restarter;
	
	public var postUpdate(default, null):Phase;
	public var physics(default, null):Phase;
	
	public var inMenu:Bool = true;
	
	var _spriteManager(default, null):SpriteManager;

	public function new() {
		super();
	}
	
	public function create() {
		paddleManager.createPaddles();
		wallManager.createWalls();
	}
	
	public function startMenuDemoMode() {
		paddleManager.switchBothToAI();
		restart();
		signals.menuDemoMode.dispatch();
	}
	
	public function startOnePlayerMode() {
		paddleManager.switchP1ToPlayer();
		restart();
		signals.onePlayerMode.dispatch();
	}
	
	public function startTwoPlayerMode() {
		paddleManager.switchBothToPlayers();
		restart();
		signals.twoPlayerMode.dispatch();
	}
	
	public function restart() {
		reset();
		start();
	}
	
	public function reset() {
		teamManager.resetScore();
		paddleManager.centerPaddles();
		ballManager.reset();
	}
	
	public function start() {
		ballSpawner.spawnAtDirection(FlxG.random.sign()); // Either Up or Down
		resume();
	}
	
	public function setup() {
		setupEngine();
		setupSpriteGroups();
		setupManagers();
		setupPhases();
		setupSignals();
	}
	
	function setupEngine() {
		engine = new Engine();
		NULL_ENTITY = engine.create();
	}
	
	function setupSpriteGroups() {
		paddles = new FlxSpriteGroup();
		walls = new FlxSpriteGroup();
		balls = new FlxSpriteGroup();
		
		add(walls);
		add(paddles);
		add(balls);
	}
	
	function setupManagers() {
		signals = new GameSignals();
		paddleManager = new PaddleManager();
		goalManager = new GoalManager();
		wallManager = new WallManager();
		teamManager = new TeamManager();
		ballManager = new BallManager();
		winCheck = new WinCheck();
		restarter = new Restarter();
		
		_spriteManager = new SpriteManager();
	}
	
	function setupPhases() {
		postUpdate = engine.createPhase();
		physics = engine.createPhase();
		
		if (FlxG.onMobile)
			postUpdate.add(new TouchController());
		else postUpdate.add(new KeyboardController());
		postUpdate.add(new AIBallTracker());
		postUpdate.add(new AIController());
		postUpdate.add(new PaddleMovement());
		postUpdate.add(ballSpawner = new BallSpawner(ballManager));
		physics.add(new PaddleBounder());
		physics.add(new Collision());
	}
	
	function setupSignals() {
		var s = signals;
		
		s.goal.add(goalManager.addScore);
		s.goal_0.add(winCheck.check);
		s.goal_ball.add(ballSpawner.spawnAtScorer);
		s.goal_ball.add(ballManager.killBall);
		
		s.ball_wall.add(goalManager.detectGoal);
		
		s.won_0.add(pause);
		s.won_0.add(restarter.restart);
	}
	
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		postUpdate.update(elapsed);
		physics.update(elapsed);
	}
	
	/**
	 * Create a new FlxSprite and add it to `group` or `container`.
	 * @param	x Initial x position.
	 * @param	y Initial y position.
	 * @param	group Optional FlxSpriteGroup to add to. If not passed, the sprite will be added to `container`.
	 * @return A FlxSprite.
	 */
	public inline function createSprite(x:Float = 0, y:Float = 0, ?group:FlxSpriteGroup):FlxSprite {
		return _spriteManager.createSprite(x, y, group);
	}
	
	/**
	 * Find the Entity containing `sprite`.
	 * @param	sprite The sprite contained by a Entity.
	 * @return The entity containing `sprite` or NULL_ENTITY if none contains the `sprite`.
	 */
	public function getEntity(sprite:FlxSprite):Entity {
		for (entity in engine.entities()) {
			if (entity.exists(sprite))
				return entity;
		}
		return NULL_ENTITY;
	}
	
	public function pause() {
		active = false;
	}
	
	public function resume() {
		active = true;
	}
	
}