package objs {
	
	import org.flixel.FlxG;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxU;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class BG extends FlxTilemap {
		
		public function BG() {
			super();
			
			var i:int;
			var j:int;
			var csv:String = "";
			var w:int = FlxG.width / 16 + 2;
			
			j = 0;
			while (j < 4) {
				i = 0;
				while (i < w) {
					csv += "14";
					i++;
					if (i < w)
						csv += ",";
				}
				csv += "\n";
				j++;
			}
			
			i = 0;
			while (i < w) {
				csv += "15";
				i++;
				if (i < w)
					csv += ",";
			}
			csv += "\n";
			
			i = 0;
			while (i < w) {
				csv += "16";
				i++;
				if (i < w)
					csv += ",";
			}
			
			loadMap(csv, gfx._tilesetGFX, 16, 16, OFF, 0, 0, 0);
		}
		
		override public function update():void {
			super.update();
			
			velocity.copyFrom(reg.velocity);
		}
		
		override public function draw():void {
			if (FlxU.abs(x) > _tileWidth) {
				x += _tileWidth;
			}
			super.draw();
		}
	}
}
