package macohi.util;

import macohi.funkin.koya.backend.KoyaAssets;

using StringTools;

class StringUtil
{
	public static function splitStringByNewlines(str:String):Array<String>
	{
		if (str == null)
			return [];

		var strA:Array<String> = [];

		for (entry in str.split('\n'))
			strA.push(entry.trim());

		return strA;
	}

	public static function splitTextAssetByNewlines(txt:String)
	{
		if (!KoyaAssets.exists(txt))
		{
			WindowUtil.alert('Missing Path: $txt', '$txt is a missing path\nand thus cannot be split by newlines');
			return [];
		}

		return splitStringByNewlines(KoyaAssets.getText(txt));
	}
}
