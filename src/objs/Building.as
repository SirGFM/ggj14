package objs {
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Building extends FlxSprite {
		
		public function Building() {
			super();
			
			loadGraphic(gfx._buildingGFX, false, false);
			/*
var arr:Array = 
[
 5,18,19, 5, 5,18,19,13,
 5,20,21, 5, 5,20,21,13,
 5,18,19, 5, 5,18,19,13,
 5,20,21, 5, 5,20,21,13,
 5, 5, 5,22,22, 5, 5,13,
 5, 5, 5, 7,17, 5, 5,13
];
			loadMap(arrayToCSV(arr, 8, false), gfx._tilesetGFX, 16, 16, OFF, 0, 0, 0);
			*/
		}
		
		override public function update():void {
			super.update();
			
			velocity.copyFrom(reg.velocity);
			if (x+width < 0)
				kill();
		}
		
		public function recycle():Number {
			reset(FlxG.width, 0);
			
			FlxG.watch(this.velocity, "x", "b-vx");
			FlxG.watch(this, "x", "b-x");
			
			if (reg.isRunning)
				return width / reg.runSpeed * (1 + FlxG.random() * 0.5);
			else
				return width/reg.walkSpeed * (1 + FlxG.random() * 0.5);
		}
	}
}
