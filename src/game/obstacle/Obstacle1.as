package game.obstacle 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.Game;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Obstacle1 extends Sprite
	{
		public var main:Beware1;
		public var main1:Bewere2;
		public var main2:Beware3;
		
		private var min : int = 0;
		private var bool:Boolean = false;
		
		public function Obstacle1(xpos:int,ypos:int,xpos2:int,ypos2:int) 
		{
			main = new Beware1();
			main.scaleX = 2.4;
			main.scaleY = 2.4;
			addChild(main);
			
			main1 = new Bewere2();
			main1.x = xpos;
			main1.y = ypos;
			main1.scaleX = 1.4;
			main1.scaleY = 1.4;
			addChild(main1);
			
			main2 = new Beware3();
			main2.x = xpos2;
			main2.y = ypos2;
			addChild(main2);
			
			addEventListener(Event.ENTER_FRAME, onCollision);
		}
		
		private function onCollision(e:Event):void 
		{
			//trace(bool);
			
			if (main2.hitTestObject(Game._player2)) {
				if (bool == false){
				min = 2;
				main1.y -= min;
				
				main2.scaleY -= 0.01;
				main2.y += 0.2;
				
				} else if (bool == false){
					min = 2;
					main1.y += min;
				}
			}
			if (main1.y < -140) {
					main1.y += min;
					bool = true;
			}
			
			//trace("main.y  " + main1.y);
		}
		
	}

}