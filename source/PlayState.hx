package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState {
	public static var game(default, null):Game;
	public static var ui(default, null):UI;
	public static var tester(default, null):Tester;
	
	override public function create() {
		Settings.init();
		
		game = new Game();
		ui = new UI();
		tester = new Tester();
		
		G.provide(this, game, ui);
		
		game.setup();
		ui.setup();
		
		add(game);
		add(ui);
		add(tester);
		
		game.create();
		game.start();
		
		FlxG.console.registerClass(G);
		FlxG.console.registerClass(Settings);
		
		setupShortcuts();
		hideSomeDebugBoxes();
	}
	
	function setupShortcuts() {
		tester.shortcut.addShortcut(game.paddleManager.switchP1Control, "Switched Control Mode");
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