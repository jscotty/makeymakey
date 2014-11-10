package game.obstacle 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import game.Game;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Obstacle2 extends Sprite 
	{
		private var main:BewareTwo;
		private var main1:BewareTwo1;
		
		private var grafity:int = 4;
		
		public function Obstacle2() 
		{
			
			main = new BewareTwo();
			main.scaleX = 2.4;
			main.scaleY = 2.4;
			addChild(main);
			
			main1 = new BewareTwo1();
			main1.x = 700;
			main1.y = -90;
			main1.scaleX = 0.25;
			main1.scaleY = 0.45;
			addChild(main1);
			
			addEventListener(Event.ENTER_FRAME, onCollision);
		}
		
		private function onCollision(e:Event):void 
		{
			main1.y += grafity;
			
			var main1Point : Point = new Point(main1.x, main1.y);
			main1Point = localToGlobal(main1Point);
			
			var mainPoint : Point = new Point(main1.x, main1.y);
			mainPoint = localToGlobal(mainPoint);
			
			
			if (main.hitTestPoint(main1Point.x,main1Point.y,true)) {
				main1Point.x = main1.x;
				main1Point.y = main1.y;
				main1.y -= grafity;
			}
			
			if (main.hitTestPoint(mainPoint.x + 205 ,mainPoint.y - 20,true)) {
				mainPoint.x = main1.x;
				mainPoint.y = main1.y;
				main1.x -=10;
			}
			
			
			
			 if (main1.hitTestObject(Game._player1)) {
				Game._player1.anim(3);
			}
			else if (main1.hitTestObject(Game._player2)) {
				Game._player2.anim(3);
			}
			
			 if (main1.hitTestObject(Game._player1) && main1.hitTestObject(Game._player2)) {
				main1.x += 10;
			}
		}
		
	}

}