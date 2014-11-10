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
	public class Obstacle3 extends Sprite 
	{
		private var main:BewareThree;
		private var main2:BewareThree1;
		private var main3:BewareThree2;
		
		public function Obstacle3() 
		{
			main = new BewareThree();
			main.scaleX = 2.4;
			main.scaleY = 2.4;
			addChild(main);
			
		}
		
	}

}