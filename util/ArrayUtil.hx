package macohi.util;

import macohi.funkin.vslice.util.AnsiUtil;

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
				strNL += AnsiUtil.REGEX_ANSI_CODES.replace(str, '').trim();

			strNL += '\n';
		}

		return strNL;
	}
}
