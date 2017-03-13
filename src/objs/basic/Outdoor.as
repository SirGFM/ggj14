package objs.basic {
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Outdoor extends FlxSprite {
		
		public function Outdoor(gfx:Class) {
			super();
			
			loadGraphic(gfx, true, false, 64, 48);
			addAnimation("good", [0], 0, false);
			addAnimation("bad", [1], 0, false);
		}
		
		override public function update():void {
			if (reg.justThunder)
				if (reg.isThunder)
					play("bad");
				else
					play("good");
			
			velocity.copyFrom(reg.velocity);
			if (x+width < 0)
				kill();
		}
		
		public function recycle():Number {
			reset(FlxG.width, FlxG.height - 32 - height);
			if (reg.isThunder)
				play("bad");
			else
				play("good");
			
			if (reg.isRunning)
				return width / reg.runSpeed * (1 + FlxG.random() * 0.5);
			else
				return width / reg.walkSpeed * (1 + FlxG.random() * 0.5);
		}
	}
}
