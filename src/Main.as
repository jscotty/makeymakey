package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import game.Game;
	import menu.MainMenu;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Main extends Sprite 
	{
		private var _mainMenu : MainMenu;
		private var _game : Game;
		
		private var _themSound:Sound;
		private var _channel:SoundChannel;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			_themSound = new Sound;
			_channel = new SoundChannel;
			
			_themSound.load(new URLRequest("theme.mp3"));
			_channel = _themSound.play(99, 9999999999);
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_mainMenu = new MainMenu();
			addChild(_mainMenu);
			
			_mainMenu.addEventListener("startGame", openGame);
		}
		
		private function openGame(e:Event):void 
		{
			removeChild(_mainMenu);
			_mainMenu = null;
			
			_game = new Game(stage);
			addChild(_game);
		}
		
	}
	
}