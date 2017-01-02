package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState {
	var settings:Settings;
	var game:Game;
	var ui:UI;
	var camManager:CameraManager;
	var tester:Tester;
	
	override public function create() {
		settings = new Settings();
		game = new Game();
		ui = new UI();
		camManager = new CameraManager();
		tester = new Tester();
		
		G.provide(settings, game, ui, camManager);
		
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
	}
	
	function hideSomeDebugBoxes() {
		#if FLX_DEBUG
		game.walls.ignoreDrawDebug = true;
		game.paddles.ignoreDrawDebug = true;
		game.balls.ignoreDrawDebug = true;
		ui.scoreboard.view.ignoreDrawDebug = true;
		ui.menuButton.label.ignoreDrawDebug = true;
		ui.title.ignoreDrawDebug = true;
		ui.mainMenu.ignoreDrawDebug = true;
		#end
	}
	
}