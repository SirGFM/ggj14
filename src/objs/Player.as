package objs {
	
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.system.FlxAnim;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Player extends FlxSprite {
		
		private var isRunning:Boolean;
		private var lineofsight:FlxObject;
		
		public function Player() {
			super();
			loadGraphic(gfx._playerGFX, true, true, 24, 24);
			
			lineofsight = new FlxObject(0, 0, 64, 16);
			
			addAnimation("stand", [0], 0, false);
			addAnimation("walk", [3,2,1,4], 6, true);
			
			play("stand");
			x = 3 * 16;
			y = FlxG.height - 16 - height;
			
			isRunning = false;
		}
		
		override public function update():void {
			if (FlxG.keys.LEFT) {
				facing = LEFT;
				reg.velocity.x = 0;
				reg.displayGoLeftBalloon();
			}
			else  if (FlxG.keys.RIGHT) {
				facing = RIGHT;
				if (reg.isRunning) {
					reg.velocity.x = -reg.runSpeed;
				}
				else {
					reg.velocity.x = -reg.walkSpeed;
				}
			}
			else
				reg.velocity.x = 0;
			
			if (reg.velocity.x != 0 && _curAnim.name != "walk")
				play("walk");
			else if (reg.velocity.x == 0 && _curAnim.name != "stand")
				play("stand");
		}
		
		public function puShadesOn():void {
			(_animations[0] as FlxAnim).frames = [5];
			(_animations[1] as FlxAnim).frames = [8,7,6,9];
		}
		
		public function run():void {
			(_animations[1] as FlxAnim).delay /= 2;
		}
		
		public function walk():void {
			(_animations[1] as FlxAnim).delay *= 2;
		}
		
		override public function drawDebug(Camera:FlxCamera = null):void {
			super.drawDebug(Camera);
			lineofsight.drawDebug(Camera);
		}
		
		override public function reset(X:Number, Y:Number):void {
			super.reset(X, Y);
			play("stand");
		}
		
		public function get LOS():FlxObject {
			if (facing == RIGHT)
				lineofsight.x = x + width;
			else
				lineofsight.x = x - lineofsight.width;
			lineofsight.y = y - 32;
			
			return lineofsight;
		}
	}
}
