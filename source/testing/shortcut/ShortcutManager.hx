package testing.shortcut;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.input.keyboard.FlxKeyList;
import flixel.util.FlxColor;

typedef Shortcut = {
	shortcutFunction:Void->Void,
	?message:String,
	?getMessage:Void->String,
	?color:FlxColor
}

class ShortcutManager extends FlxBasic {
	private var _notifier:ShortcutNotifier;
	private var _shortcuts:Array<Shortcut> = new Array<Shortcut>();
	private var _keyList = new Array<Bool>();
	
	function new(notifier:ShortcutNotifier) {
		super();
		_notifier = notifier;
	}
	
	public function addShortcut(shortcutFunction:Void->Void, 
	?message:String, ?getMessage:Void->String, color:FlxColor = FlxColor.WHITE):ShortcutManager {
		if (_shortcuts.length > 9) {
			FlxG.log.warn("Cannot addShortcut()! Shortcut slots full!");
			return this;
		}
		
		for (i in 1...10) {
			if (_shortcuts[i] != null)
				continue;
			
			_shortcuts[i] = {
				shortcutFunction: shortcutFunction,
				message: message,
				getMessage: getMessage,
				color: color
			};
		}
		return this;
	}
	
	public inline function removeShortcut(shortcutFunction:Void->Void) {
		for (shortcut in _shortcuts) {
			if (shortcut.shortcutFunction != shortcutFunction) 
				continue;
			_shortcuts.remove(shortcut);
			break;
		}
	}
	
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		
		updateKeyList();
		runShortcuts();
	}
	
	private function updateKeyList() {
		var keyList:FlxKeyList = FlxG.keys.justPressed;
		_keyList[1] = keyList.ONE;
		_keyList[2] = keyList.TWO;
		_keyList[3] = keyList.THREE;
		_keyList[4] = keyList.FOUR;
		_keyList[5] = keyList.FIVE;
		_keyList[6] = keyList.SIX;
		_keyList[7] = keyList.SEVEN;
		_keyList[8] = keyList.EIGHT;
		_keyList[9] = keyList.NINE;
	}
	
	function runShortcuts() {
		for (i in 1..._keyList.length) {
			var run:Bool = _keyList[i];
			
			if (!run)
				continue;
			
			var shortcut:Shortcut = _shortcuts[i];
			
			if (shortcut != null) {
				shortcut.shortcutFunction();
				if (!containsMessage(shortcut))
					continue;
				notifyShortcut(shortcut);
			}
			else {
				notifyMessage('Num $i: No shortcut assigned');
			}
			
		}
	}
	
	inline function containsMessage(shortcut:Shortcut) {
		return shortcut.message != null || shortcut.getMessage != null;
	}
	
	function notifyShortcut(shortcut:Shortcut) {
		var message = getMessage(shortcut);
		notifyMessage(message);
	}
	
	inline function getMessage(shortcut:Shortcut) {
		return shortcut.message != null ? shortcut.message : shortcut.getMessage();
	}
	
	function notifyMessage(message:String) {
		_notifier.notify(message);
	}
	
}