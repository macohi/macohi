package macohi.util;

import flixel.input.keyboard.FlxKey;

class ArrayUtil
{
	public static function convertStringToFlxKey(strA:Array<String>):Array<FlxKey>
	{
		var flxKeyA:Array<FlxKey> = [];

		if (strA != null)
			for (str in strA)
				if (str != null)
					flxKeyA.push(FlxKey.fromString(str));

		return flxKeyA;
	}
}
