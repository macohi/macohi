package macohi.util;

using StringTools;
using macohi.util.StringUtil;

class ArrayUtil
{
	public static function convertStrArrayToStrNL(strArray:Array<String>):String
	{
		var strNL:String = '';

		if (strArray.isBlankStrArray())
			return '';

		for (str in strArray)
		{
			if (!str.isBlankStr())
				strNL += str.trim();

			strNL += '\n';
		}

		return strNL;
	}
}
