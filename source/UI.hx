package;

import flixel.*;
import flixel.group.*;
import flixel.util.*;
import ui.*;
import ui.gameplay.*;
import ui.gameplay.playAgain.*;
import ui.gameplay.scoreboard.*;
import ui.gameplay.winnerText.*;
import ui.title.*;

class UI extends FlxGroup {
	public static function show(basic:FlxBasic) basic.active = basic.visible = true;
	public static function hide(basic:FlxBasic) basic.active = basic.visible = false;
	
	public var gameplay(default, null):FlxSubState;
	public var titleMenu(default, null):FlxSubState;
	
	public var scoreboard(default, null):Scoreboard;
	public var winnerText(default, null):WinnerText;
	public var playAgainButton(default, null):PlayAgainButton;
	
	public var title(default, null):Title;
	public var instruction(default, null):Instruction;
	public var buttons(default, null):ButtonMenu;
	public var menuButton(default, null):MenuButton;

	public function new() {
		super();
	}
	
	public function setup() {
		gameplay = new FlxSubState();
		titleMenu = new FlxSubState();
		
		scoreboard = new Scoreboard();
		winnerText = new WinnerText();
		playAgainButton = new PlayAgainButton();
		
		title = new Title();
		instruction = new Instruction();
		menuButton = new MenuButton();
		
		buttons = new ButtonMenu(FlxG.width * 0.25, title.sub.getBottom() + 50);
		buttons.addButton("ONE PLAYER", onClick_onePlayer);
		buttons.addButton("TWO PLAYER", onClick_twoPlayer);
		buttons.screenCenter();
		
		add(gameplay);
		add(titleMenu);
		
		gameplay.add(scoreboard);
		gameplay.add(winnerText);
		gameplay.add(playAgainButton);
		gameplay.add(menuButton);
		
		var background = new FlxSprite();
		background.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		background.alpha = 0.25;
		
		titleMenu.add(background);
		titleMenu.add(title);
		titleMenu.add(instruction);
		titleMenu.add(buttons);
		
		forEachOfType(FlxSprite, setCameraToUICam, true);
	}
	
	function setCameraToUICam(sprite:FlxSprite) {
		sprite.cameras = [G.cameras.uiCam];
	}
	
	function onClick_onePlayer() {
		onClick_start(G.game.startOnePlayerMode);
	}
	
	function onClick_twoPlayer() {
		onClick_start(G.game.startTwoPlayerMode);
	}
	
	function onClick_start(startMode:Void->Void) {
		hide(titleMenu);
		show(menuButton);
		G.game.inMenu = false;
		startMode();
	}
	
}