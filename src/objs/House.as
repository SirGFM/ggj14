package objs {
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class House extends FlxSprite {
		
		public function House() {
			super();
			
			loadGraphic(gfx._houseGFX, false, false);
/*
var arr:Array = 
[
 2, 2, 2, 2, 2, 2,
 3, 3, 3, 3, 3, 3,
 4, 6, 4, 8, 9,12,
 5, 7, 5,10,11,13
];
			loadMap(arrayToCSV(arr, 6), gfx._tilesetGFX, 16, 16, OFF, 0, 0, 0);
*/
		}
		
		override public function update():void {
			super.update();
			
			velocity.copyFrom(reg.velocity);
			if (x+width < 0)
				kill();
		}
		
		public function recycle():Number {
			reset(FlxG.width, FlxG.height - 32 - height);
			
			if (reg.isRunning)
				return width / reg.runSpeed * (1 + FlxG.random() * 0.5);
			else
				return width / reg.walkSpeed * (1 + FlxG.random() * 0.5);
		}
	}
}
