package;

import components.*;
import edge.*;
import flixel.*;
import flixel.group.*;
import managers.*;
import systems.*;
import ui.*;

class Game extends FlxGroup {
	public var teamUpper(get, null):Entity; function get_teamUpper() return teamManager.teamUpper;
	public var teamLower(get, null):Entity; function get_teamLower() return teamManager.teamLower;
	
	public var paddles(default, null):FlxSpriteGroup;
	public var walls(default, null):FlxSpriteGroup;
	public var balls(default, null):FlxSpriteGroup;
	
	public var background(default, null):Background;
	
	public var signals(default, null):GameSignals;
	
	public var wallManager(default, null):WallManager;
	public var goalManager(default, null):GoalManager;
	public var paddleManager(default, null):PaddleManager;
	public var teamManager(default, null):TeamManager;
	public var ballManager(default, null):BallManager;
	public var ballSpawner(default, null):BallSpawner;
	
	public var winCheck(default, null):WinCheck;
	public var restarter(default, null):Restarter;
	public var winHandler(default, null):WinHandler;
	
	public var postUpdate(default, null):Phase;
	public var physics(default, null):Phase;
	
	public var inMenu:Bool = true;
	
	var _engine(default, null):Engine;
	
	var _spriteManager(default, null):SpriteManager;
	var _entityTracker(default, null):EntityTracker;
	
	var _enableGameMode:Void->Void = function() {};
	
	public function new() {
		super();
	}
	
	public function create() {
		paddleManager.createPaddles();
		wallManager.createWalls();
	}
	
	public function prepareMenuDemoMode() {
		_enableGameMode = startMenuDemoMode;
	}
	
	public function prepareOnePlayerMode() {
		_enableGameMode = startOnePlayerMode;
	}
	
	public function prepareTwoPlayerMode() {
		_enableGameMode = startTwoPlayerMode;
	}
	
	function startMenuDemoMode() {
		paddleManager.switchBothToAI();
		signals.menuDemoMode.dispatch();
		tryDisableSplitScreen();
	}
	
	function startOnePlayerMode() {
		paddleManager.switchP1ToPlayer();
		signals.onePlayerMode.dispatch();
	}
	
	function startTwoPlayerMode() {
		paddleManager.switchBothToPlayers();
		signals.twoPlayerMode.dispatch();
		tryEnableSplitScreen();
	}
	
	function tryEnableSplitScreen() {
		if (!G.settings.splitScreenPossible)
			return;
		
		G.settings.splitScreen = true;
		G.cameras.tryEnableSplitScreen();
		signals.splitScreen.dispatch();
	}
	
	function tryDisableSplitScreen() {
		if (!G.settings.splitScreenPossible)
			return;
		
		G.settings.splitScreen = false;
		G.cameras.tryDisableSplitScreen();
		signals.splitScreenOff.dispatch();
	}
	
	public function restart() {
		_enableGameMode();
		reset();
		start();
	}
	
	public function reset() {
		teamManager.resetScore();
		paddleManager.centerPaddles();
		ballManager.clear();
	}
	
	public function start() {
		spawnBall();
		resume();
	}
	
	/**
	 * Spawns the ball randomly either up or down
	 */
	function spawnBall() {
		ballSpawner.spawnAtDirection(FlxG.random.sign());
	}
	
	public function setup() {
		setupEngine();
		setupBackground();
		setupSpriteGroups();
		setupManagers();
		setupPhases();
		setupSignals();
	}
	
	function setupEngine() {
		_engine = new Engine();
	}
	
	function setupBackground() {
		background = new Background();
		add(background);
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
		winHandler = new WinHandler();
		restarter = new Restarter();
		
		_spriteManager = new SpriteManager();
		_entityTracker = new EntityTracker();
	}
	
	function setupPhases() {
		postUpdate = _engine.createPhase();
		physics = _engine.createPhase();
		
		postUpdate.add(new AutoDestroyer());
		
		postUpdate.add(new AutoFramerate());
		
		postUpdate.add(newPlayerController());
		postUpdate.add(new AIBallTracker());
		postUpdate.add(new AIController());
		postUpdate.add(new PaddleMovement());
		postUpdate.add(ballSpawner = new BallSpawner(ballManager));
		
		postUpdate.add(new GoalHandler());
		
		postUpdate.add(new EntityDestroyer());
		postUpdate.add(new BallCollisionRemover());
		
		physics.add(new PaddleBounder());
		physics.add(new Collision());
	}
	
	function newPlayerController() {
		return
		if (FlxG.onMobile)
			new TouchController()
		else new KeyboardController();
	}
	
	function setupSignals() {
		var s = signals;
		
		s.ball_wall.add(goalManager.addBallCollision);
		s.won.add(winHandler.handle);
	}
	
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		postUpdate.update(elapsed);
		physics.update(elapsed);
	}
	
	/**
	 * Create a new FlxSprite and add it to `group` or `container`.
	 * @param	x 		Initial x position.
	 * @param	y 		Initial y position.
	 * @param	group 	Optional FlxSpriteGroup to add to. If not passed, the sprite will be added to `container`.
	 * @return 	A FlxSprite
	 */
	public function createSprite(x:Float = 0, y:Float = 0, ?group:FlxSpriteGroup):FlxSprite {
		return _spriteManager.createSprite(x, y, group);
	}
	
	public function getEntity(sprite:FlxSprite):Entity {
		return _entityTracker.get(sprite);
	}
	
	/**
	 * Create a new Entity and track its FlxSprite if it has one
	 * @return	A new Entity
	 */
	public function createEntity(?components:Array<{}>):Entity {
		var entity = _engine.create(components);
		if (components == null)
			return entity;
		
		for (c in components) {
			if (Std.is(c, FlxSprite))
				_entityTracker.add(cast c, entity);
		}
		return entity;
	}
	
	public inline function pause() {
		active = false;
	}
	
	public inline function resume() {
		active = true;
	}
	
}