package;

import flixel.FlxG;
import flixel.FlxState;
import testing.ShortcutWrapper;

class PlayState extends FlxState {
	public static var game(default, null):Game;
	public static var ui(default, null):UI;
	public static var shortcut(default, null):ShortcutWrapper;
	
	override public function create() {
		Settings.init();
		
		game = new Game();
		ui = new UI();
		shortcut = new ShortcutWrapper();
		
		G.provide(this, game, ui);
		
		game.setup();
		ui.setup();
		
		add(game);
		add(ui);
		add(shortcut);
		
		game.create();
		game.start();
		
		FlxG.console.registerClass(G);
		
		setupShortcuts();
		hideSomeDebugBoxes();
	}
	
	function setupShortcuts() {
		shortcut.addShortcut(game.paddleManager.switchControlMode, "Switched Control Mode");
	}
	
	function hideSomeDebugBoxes() {
		#if FLX_DEBUG
		game.walls.ignoreDrawDebug = true;
		game.paddles.ignoreDrawDebug = true;
		ui.scoreboard.view.ignoreDrawDebug = true;
		ui.menuButton.label.ignoreDrawDebug = true;
		#end
	}
	
}