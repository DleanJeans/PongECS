package;

import events.EventManager;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState {
	var settings:Settings;
	var game:Game;
	var events:EventManager;
	var ui:UI;
	var camManager:CameraManager;
	var tester:Tester;
	
	override public function create() {
		settings = new Settings();
		game = new Game();
		events = new EventManager();
		ui = new UI();
		camManager = new CameraManager();
		tester = new Tester();
		
		// Provide references to G
		G.settings = settings;
		G.game = game;
		G.events = events;
		G.ui = ui;
		G.cameras = camManager;
		
		// Then setup the systems in this particular order
		camManager.setup();
		game.setup();
		ui.setup();
		// since some of the components in them 
		// are dependent on each other
		
		add(game);
		add(ui);
		add(tester);
		add(events);
		
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
		ui.menus.ignoreDrawDebug = true;
		#end
	}
	
}