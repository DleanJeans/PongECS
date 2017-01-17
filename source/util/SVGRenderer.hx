package util;

import flixel.FlxG;
import flixel.system.FlxAssets;
import flixel.system.FlxAssets.GraphicLogo;
import format.SVG;
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display.Graphics;
import openfl.display.Shape;
import openfl.geom.Matrix;

class SVGRenderer {
	private var _canvas:Shape = new Shape();

	public function new() {}
	
	/**
	 * Renders and caches graphic as BitmapData.
	 * Retrieves the graphic if it's already cached.
	 * 
	 * @param	path Path to embedded SVG file.
	 * @param	scaleX Default to 1.
	 * @param	scaleY Default to scaleX.
	 * @return	The BitmapData with graphic rendered from the SVG file.
	 */
	public function parseAndDraw(path:String, scaleX:Float = 1, ?scaleY:Float):BitmapData {
		if (FlxG.bitmap.checkCache(path)) return FlxG.bitmap.get(path).bitmap;
		
		var svg:SVG = null;
		
		// returns the default HaxeFlixel logo if parsing SVG fails
		try {
			svg = new SVG(Assets.getText(path));
		}
		catch (e:Dynamic) {
			return FlxAssets.getBitmapFromClass(GraphicLogo);
		}
		
		// scaleY default value
		if (scaleY == null) scaleY = scaleX;
		
		var width:Int = cast svg.data.width * scaleX;
		var height:Int = cast svg.data.height * scaleY;
		
		var bitmapData = new BitmapData(width, height, true, 0x0);
		
		// render to canvas
		_canvas.graphics.clear();
		renderSVG(svg, _canvas.graphics, scaleX, scaleY);
		bitmapData.draw(_canvas);
		
		// cache BitmapData
		FlxG.bitmap.add(bitmapData, true, path);
		
		return bitmapData;
	}
	
	/**
	 * Render data from SVG object to a Graphics object
	 * 
	 * @param	svg The SVG object
	 * @param	graphics The Graphics object from Shape or whatever
	 * @param	scaleX Default to 1.
	 * @param	scaleY Default to scaleY.
	 */
	function renderSVG(svg:SVG, graphics:Graphics, scaleX:Float, scaleY:Float) {
		if (svg == null || svg.data == null) return;
		
		var matrix = new Matrix();
		matrix.identity();
		matrix.scale(scaleX, scaleY);
		
		var renderer = new format.svg.SVGRenderer(svg.data);
		renderer.render(graphics, matrix);
	}
}