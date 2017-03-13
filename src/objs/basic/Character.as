package objs.basic {
	
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Character extends FlxSprite {
		
		private var wasSide:Boolean;
		private var wasUp:Boolean;
		private var wasDown:Boolean;
		
		public function Character() {
			super();
			wasSide = false;
			wasUp = false;
			wasDown = false;
			
			addAnimation("walk-down", [0, 1, 0, 2], 8);
			addAnimation("walk-side", [3, 4, 3, 5], 8);
			addAnimation("walk-up", [6, 7, 6, 8], 8);
			addAnimation("down", [0], 0, false);
			addAnimation("side", [3], 0, false);
			addAnimation("up", [6], 0, false);
		}
		
		override public function update():void {
			if (velocity.x > 0) {
				facing = LEFT;
				play("walk-side");
			}
			else if (velocity.x < 0) {
				facing = RIGHT;
				play("walk-side");
			}
			else if (velocity.y < 0)
				play("walk-up");
			else if (velocity.y > 0)
				play("walk-down");
			else if (velocity.x == 0 && wasSide)
				play("side");
			else if (velocity.y == 0)
				if (wasUp)
					play("up");
				else if (wasDown)
					play("down");
			
			wasSide = velocity.x != 0;
			wasUp = velocity.y < 0;
			wasDown = velocity.y > 0;
		}
		
		public function recycle(X:Number, Y:Number, GFX:Class):void {
			reset(X, Y);
			loadGraphic(GFX, true, true, 16, 16);
		}
	}
}
