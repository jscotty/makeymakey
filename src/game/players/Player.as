package game.players 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Player extends Sprite
	{
		private var _playerIdle:Player1Idle;
		private var _player1Jump:Player1Jump;
		private var _player1Walk:Player1Walk;
		private var _player1push:Player1Push;
		private var _player1Balance:Player1Balance;
		private var _player1Death:Player1Death;
		
		public function Player(s:Stage) 
		{
			_playerIdle = new Player1Idle();
			addChild(_playerIdle);
			_playerIdle.visible = true;
			
			_player1Jump = new Player1Jump();
			addChild(_player1Jump);
			_player1Jump.visible = false;
			
			_player1Walk = new Player1Walk();
			addChild(_player1Walk);
			_player1Walk.visible = false;
			
			_player1push = new Player1Push();
			addChild(_player1push);
			_player1push.visible = false;
			
			_player1Balance = new Player1Balance();
			addChild(_player1Balance);
			_player1Balance.visible = false;
			
			_player1Death = new Player1Death();
			addChild(_player1Death);
			_player1Death.visible = false;
		}
		
		public function anim(animNr:Number) :void
		{
			if (animNr == 0) {
				_playerIdle.visible = true;
				_player1Jump.visible = false;
				_player1Walk.visible = false;
				_player1push.visible = false;
				_player1Balance.visible = false;
				_player1Death.visible = false;
			}
			else if (animNr == 1) {
				_playerIdle.visible = false;
				_player1Jump.visible = true;
				_player1Walk.visible = false;
				_player1push.visible = false;
				_player1Balance.visible = false;
				_player1Death.visible = false;
			}
			else if (animNr == 2) {
				_playerIdle.visible = false;
				_player1Jump.visible = false;
				_player1Walk.visible = true;
				_player1push.visible = false;
				_player1Balance.visible = false;
				_player1Death.visible = false;
			}
			else if (animNr == 3) {
				_playerIdle.visible = false;
				_player1Jump.visible = false;
				_player1Walk.visible = false;
				_player1push.visible = true;
				_player1Balance.visible = false;
				_player1Death.visible = false;
			}
			else if (animNr == 4) {
				_playerIdle.visible = false;
				_player1Jump.visible = false;
				_player1Walk.visible = false;
				_player1push.visible = false;
				_player1Balance.visible = true;
				_player1Death.visible = false;
			}
			else if (animNr == 5) {
				_playerIdle.visible = false;
				_player1Jump.visible = false;
				_player1Walk.visible = false;
				_player1push.visible = false;
				_player1Balance.visible = false;
				_player1Death.visible = true;
			}
		}
		
	}

}