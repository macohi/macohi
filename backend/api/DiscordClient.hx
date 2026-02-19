package macohi.backend.api;

#if ENABLE_DISCORDRPC
import Sys.sleep;
import discord_rpc.DiscordRpc;
#end

/**
	yoinked from DREAMLAND!
	https://github.com/macohi/project-dreamland/blob/master/source/clients/DiscordClient.hx
 */
class DiscordClient
{
	public static var CLIENT_ID:String = "";

	#if ENABLE_DISCORDRPC
	public function new():Void
	{
		trace("Discord Client starting...");
		DiscordRpc.start({
			clientID: CLIENT_ID,
			onReady: onReady,
			onError: onError,
			onDisconnected: onDisconnected
		});
		trace("Discord Client started.");

		while (true)
		{
			DiscordRpc.process();
			sleep(2);
		}

		DiscordRpc.shutdown();
	}
	#end

	public static function shutdown():Void
	{
		#if ENABLE_DISCORDRPC
		trace('Shutting down...');
		DiscordRpc.shutdown();
		#end
	}

	#if ENABLE_DISCORDRPC
	static function onReady():Void
	{
		DiscordRpc.presence({
			details: "Starting Discord RPC",
			state: null,
			largeImageKey: '',
			largeImageText: LARGE_IMAGE_TEXT
		});
	}

	static function onError(_code:Int, _message:String):Void
	{
		trace('Error! $_code : $_message');
	}

	static function onDisconnected(_code:Int, _message:String):Void
	{
		trace('Disconnected! $_code : $_message');
	}
	#end

	public static function initialize():Void
	{
		#if ENABLE_DISCORDRPC
		var DiscordDaemon:sys.thread.Thread = sys.thread.Thread.create(() ->
		{
			new DiscordClient();
		});
		trace("Discord Client initialized");
		#end
	}

	public static function changePresence(details:String, state:Null<String> = null, ?smallImageKey:String, ?largeImageKey:String):Void
	{
		#if ENABLE_DISCORDRPC
		DiscordRpc.presence({
			details: details,
			state: state,
			largeImageKey: largeImageKey,
			largeImageText: LARGE_IMAGE_TEXT,
			smallImageKey: smallImageKey,
		});
		#end
	}

	public static var LARGE_IMAGE_TEXT:String = '';
}
