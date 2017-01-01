package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState {
	public var game(default, null):Game;
	public var ui(default, null):UI;
	public var camManager(default, null):CameraManager;
	public var tester(default, null):Tester;
	
	override public function create() {
		Settings.init();
		
		game = new Game();
		ui = new UI();
		camManager = new CameraManager();
		tester = new Tester();
		
		G.provide(this, game, ui, camManager);
		
		camManager.setup();
		game.setup();
		ui.setup();
		
		add(game);
		add(ui);
		add(tester);
		
		game.create();
		game.start();
		
		setupShortcuts();
		registerToConsole();
		hideSomeDebugBoxes();
	}
	
	function setupShortcuts() {
		tester.shortcut.addShortcut(game.paddleManager.switchP1Control, "Switched Control Mode");
	}
	
	function registerToConsole() {
		FlxG.console.registerClass(G);
		FlxG.console.registerClass(Settings);
		FlxG.console.registerClass(CameraManager);
	}
	
	function hideSomeDebugBoxes() {
		#if FLX_DEBUG
		game.walls.ignoreDrawDebug = true;
		game.paddles.ignoreDrawDebug = true;
		game.balls.ignoreDrawDebug = true;
		ui.scoreboard.view.ignoreDrawDebug = true;
		ui.menuButton.label.ignoreDrawDebug = true;
		ui.title.ignoreDrawDebug = true;
		ui.buttons.ignoreDrawDebug = true;
		#end
	}
	
}