package testing;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.VarTween;

class ShortcutNotifier extends FlxText {
	private var _fadeOutTween:VarTween;
	
	function new() {
		super(0, FlxG.height * 0.7, FlxG.width, "", 20);
		alignment = FlxTextAlign.CENTER;
	}
	
	public function notify(message:String, duration:Float = 0.5) {
		show(message);
		fadeOut(duration);
	}
	
	function show(message:String) {
		text = message;
		alpha = 1;
	}
	
	function fadeOut(duration:Float = 0.5) {
		if (_fadeOutTween != null)
			_fadeOutTween.cancel();
		_fadeOutTween = FlxTween.tween(this, { alpha:0 }, 0.5);
	}
	
}