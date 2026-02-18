package macohi.util;

class FileUtil
{
	/**
	 * Regex for invalid filesystem characters.
	 * 
	 * Yoinked from https://github.com/FunkinCrew/Funkin/blob/main/source/funkin/util/FileUtil.hx
	 */
	public static final INVALID_CHARS:EReg = ~/[:*?"<>|\n\r\t]/g;

	public static function fixPath(str:String)
		return INVALID_CHARS.replace(str, '');
}
