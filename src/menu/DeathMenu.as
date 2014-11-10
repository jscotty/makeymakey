package menu 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class DeathMenu extends Sprite
	{
		private var _death:BGLos;
		
		public function DeathMenu() 
		{
			_death = new BGLos();
			addChild(_death);
			
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			dispatchEvent(new Event("startGame"));
		}
		
	}

}