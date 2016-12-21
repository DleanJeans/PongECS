package testing;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import testing.ShortcutNotifier;

class ShortcutWrapper extends FlxGroup {
	private var _manager:ShortcutManager;
	private var _notifier:ShortcutNotifier;
	
	@:access(testing.ShortcutManager)
	@:access(testing.ShortcutNotifier)
	public function new() {
		super();
		#if testing
		_notifier = new ShortcutNotifier();
		_manager = new ShortcutManager(_notifier);
		
		add(_manager);
		add(_notifier);
		#end
	}
	
	/**
	 * Assign the `shortcutFunction` to a number key on the keyboard.
	 * @param	shortcutFunction The function to be call when the shortcut key is pressed/
	 * @param	message The message to show.
	 * @param	getMessage Message getter function. Ignored if `message` is not `null`.
	 * @param	color The color of the messsage. Default: White.
	 * @return This ShortcutWrapper for chaining
	 */
	public function addShortcut(shortcutFunction:Void->Void, 
	?message:String, ?getMessage:Void->String, color:FlxColor = FlxColor.WHITE):ShortcutWrapper {
		#if testing
		_manager.addShortcut(shortcutFunction, message, getMessage, color);
		#end
		return this;
	}
	
	public inline function removeShortcut(shortcutFunction:Void->Void) {
		#if testing
		_manager.removeShortcut(shortcutFunction);
		#end
	}
	
}