package macohi.overrides;

import flixel.util.FlxColor;
import flixel.FlxSprite;

/**
	Override of `flixel.FlxSprite` to apply
	custom functionality to it.
**/
class MSprite extends FlxSprite
{
	override function makeGraphic(width:Int, height:Int, color:FlxColor = FlxColor.WHITE, unique:Bool = false, ?key:String):MSprite
	{
		return cast super.makeGraphic(width, height, color, unique, key);
	}
}
