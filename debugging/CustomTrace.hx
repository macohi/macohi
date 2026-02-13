package macohi.debugging;

import haxe.PosInfos;

using macohi.funkin.vslice.util.AnsiUtil;
using StringTools;

class CustomTrace
{
	public static var formatOptions:Map<String, Dynamic->String> = [
		'<warning>' => function(v)
		{
			return v.replace('<warning>', 'WARNING'.bg_bright_yellow());
		},
		'<error>' => function(v)
		{
			return v.replace('<error>', 'ERROR'.bg_bright_red());
		},
	];

	public static function formatOutput(v:Dynamic, ?pos:PosInfos):String
	{
		var nv:String = Std.string(v);
		var posInfos:String = '';

		if (pos.className != null)
			if (pos.lineNumber != null)
				posInfos += '${pos.className}:${pos.lineNumber}'.bg_bright_blue() + ' ';
			else
				posInfos += '${pos.className}'.bg_bright_blue() + ' ';

		nv = '$posInfos$nv';

		for (key => value in formatOptions)
			if (nv.contains(key))
				nv = value(key);

		return nv;
	}

	public static function newTrace(v:Dynamic, ?pos:PosInfos)
	{
		var str:String = formatOutput(v, pos);

		#if js
		if (js.Syntax.typeof(untyped console) != "undefined" && (untyped console).log != null)
			(untyped console).log(str);
		#elseif lua
		untyped __define_feature__("use._hx_print", _hx_print(str));
		#elseif sys
		Sys.println(str);
		#else
		throw new haxe.exceptions.NotImplementedException()
		#end
	}
}
