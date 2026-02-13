package macohi.funkin.koya.backend;

import lime.utils.Assets;

class KoyaAssets
{
	public static function exists(path:String):Bool
	{
		#if sys
		return Assets.exists(path) || sys.FileSystem.exists(path);
		#end

		return Assets.exists(path);
	}

	public static function getText(path:String):String
	{
		var lime = Assets.getText(path);

		#if sys
		var sys = (sys.FileSystem.exists(path)) ? sys.io.File.getContent(path) : null;

		return (sys == null) ? lime : sys;
		#end

		return lime;
	}

	public static function readDirectory(path:String):Array<String>
	{
		#if sys
		return sys.FileSystem.readDirectory(path);
		#end

		trace('Unsupported');
		return [];
	}
}
