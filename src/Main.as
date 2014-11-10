package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import game.Game;
	import menu.DeathMenu;
	import menu.FictoryMenu;
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
		private var _death:DeathMenu;
		private var counter:int = 0;
		private var counter2:int = 0;
		private var _done:FictoryMenu;
		
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
			if (counter == 0 && counter2 == 0) {
			removeChild(_mainMenu);
			_mainMenu = null;
			}
			
			if (counter == 1) {
				removeChild(_death);
				_death = null;
			}
			if (counter == 2) {
				removeChild(_done);
				_done = null;
			}
			_game = new Game(stage);
			addChild(_game);
			
			_game.addEventListener("death", deathScreen);
			_game.addEventListener("done", doneScreen);
		}
		
		private function doneScreen(e:Event):void 
		{
			
			removeChild(_game);
			_game = null;
			
			_done = new FictoryMenu();
			addChild(_done);
			
			_done.addEventListener("startGame", openGame);
			
			counter2 = 1;
			counter = 2;
		}
		
		private function deathScreen(e:Event):void 
		{
			removeChild(_game);
			_game = null;
			
			_death = new DeathMenu();
			addChild(_death);
			
			_death.addEventListener("startGame", openGame);
			counter = 1;
			counter2 = 2;
		}
		
	}
	
}