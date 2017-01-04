package ui.title;

import flixel.group.FlxSpriteGroup;
import ui.ButtonMenu;

class TitleMenus extends FlxSpriteGroup {
    public var main:ButtonMenu;
    public var scores:ButtonMenu;

    public function new() {
        super();

        main = new ButtonMenu();
        main.addButton("ONE PLAYER", onClick_onePlayer);
		main.addButton("TWO PLAYER", onClick_twoPlayer);
		main.screenCenter();
        add(main);

        scores = new ButtonMenu();
		scores.addButton("3", onClick_3);
		scores.addButton("5", onClick_5);
		scores.addButton("10", onClick_10);
		scores.addButton("BACK", onClick_back_scoresMenu);
		scores.screenCenter();
		UI.hide(scores);
        add(scores);
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
		main.switchToOtherMenu(scores);
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
		scores.switchToOtherMenu(main);
	}
	
	function leaveTitleMenu() {
		UI.hide(G.ui.titleMenu);
		UI.show(G.ui.menuButton);
		UI.hide(scores);
		UI.show(main);
		G.game.inMenu = false;
		G.game.restart();
	}
}