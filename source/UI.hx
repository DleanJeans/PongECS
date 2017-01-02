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
	public var menuButton(default, null):MenuButton;
	public var mainMenu(default, null):ButtonMenu;
	public var scoresMenu(default, null):ButtonMenu;

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
		
		mainMenu = new ButtonMenu();
		mainMenu.addButton("ONE PLAYER", onClick_onePlayer);
		mainMenu.addButton("TWO PLAYER", onClick_twoPlayer);
		mainMenu.screenCenter();
		
		scoresMenu = new ButtonMenu();
		scoresMenu.addButton("3", onClick_3);
		scoresMenu.addButton("5", onClick_5);
		scoresMenu.addButton("10", onClick_10);
		scoresMenu.addButton("BACK", onClick_back_scoresMenu);
		scoresMenu.screenCenter();
		hide(scoresMenu);
		
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
		titleMenu.add(mainMenu);
		titleMenu.add(scoresMenu);
		
		forEachOfType(FlxSprite, setCameraToUICam, true);
	}
	
	function setCameraToUICam(sprite:FlxSprite) {
		sprite.cameras = [G.cameras.uiCam];
	}
	
	function onClick_onePlayer() {
		G.game.prepareOnePlayerMode();
		switchToScoresMenu();
	}
	
	function onClick_twoPlayer() {
		G.game.prepareTwoPlayerMode();
		switchToScoresMenu();
	}
	
	function switchToScoresMenu() {
		mainMenu.switchToOtherMenu(scoresMenu);
	}
	
	function onClick_3() {
		G.settings.scoreToWin = 3;
		leaveTitleMenu();
	}
	
	function onClick_5() {
		G.settings.scoreToWin = 5;
		leaveTitleMenu();
	}
	
	function onClick_10() {
		G.settings.scoreToWin = 10;
		leaveTitleMenu();
	}
	
	function onClick_back_scoresMenu() {
		scoresMenu.switchToOtherMenu(mainMenu);
	}
	
	function leaveTitleMenu() {
		hide(titleMenu);
		show(menuButton);
		hide(scoresMenu);
		show(mainMenu);
		G.game.inMenu = false;
		G.game.restart();
	}
	
}