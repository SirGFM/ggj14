package 
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import org.flixel.FlxGame;
	import state.Playstate;
	import state.RealPlaystate;
	
	[SWF(width="640",height="512",backgroundColor="0x000000")]
	[Frame(factoryClass="Preloader")]
	
	/**
	 * ...
	 * @author GFM
	 */
	public class Main extends FlxGame {
		
		static private var _2xOverlay:Bitmap;
		static private var _4xOverlay:Bitmap;
		
		public function Main():void {
			super(160, 128, RealPlaystate, 4, 60, 60);
		}
		
		override protected function create(FlashEvent:Event):void {
			super.create(FlashEvent);
			
			create2xOverlay();
			create4xOverlay();
			
			showX2();
		}
		
		static public function showX2():void {
			_2xOverlay.visible = true;
			_4xOverlay.visible = false;
		}
		
		static public function showX4():void {
			_2xOverlay.visible = false;
			_4xOverlay.visible = true;
		}
		
		private function create2xOverlay():void {
			var wNormal:int = 160*2;
			var w:int = wNormal*4;
			var hNormal:int = 128*2;
			var h:int = hNormal*4;
			var bmp:BitmapData = new BitmapData(w, h, true, 0);
			_2xOverlay = new Bitmap(bmp);
			bmp.lock();
			var arr:Vector.<uint> = bmp.getVector(bmp.rect);
			
			var dark:uint =  0xaa000000;
			var mid:uint =   0x66000000;
			var light:uint = 0x00000000;
			
			var i:int = 0;
			while (i < wNormal) {
				var x:int = i * 2;
				var j:int = 0;
				while (j < hNormal) {
					var y:int = j * 2;
					
					arr[(x+0) + (y+0)*w] = mid;
					arr[(x+1) + (y+0)*w] = light;
					
					arr[(x+0) + (y+1)*w] = dark;
					arr[(x+1) + (y+1)*w] = mid;
					
					j++
				}
				i++;
			}
			bmp.setVector(bmp.rect, arr);
			bmp.unlock();
			addChild(_2xOverlay);
		}
		
		private function create4xOverlay():void {
			var wNormal:int = 160;
			var w:int = wNormal*4;
			var hNormal:int = 128;
			var h:int = hNormal * 4;
			var bmp:BitmapData = new BitmapData(w, h, true, 0);
			_4xOverlay = new Bitmap(bmp);
			bmp.lock();
			var arr:Vector.<uint> = bmp.getVector(bmp.rect);
			
			var dark:uint =  0xaa000000;
			var mid:uint =   0x66000000;
			var light:uint = 0x00000000;
			
			var i:int = 0;
			while (i < wNormal) {
				var x:int = i * 4;
				var j:int = 0;
				while (j < hNormal) {
					var y:int = j * 4;
					
					arr[(x+0) + (y+0)*w] = mid;
					arr[(x+1) + (y+0)*w] = light;
					arr[(x+2) + (y+0)*w] = light;
					arr[(x+3) + (y+0)*w] = light;
					
					arr[(x+0) + (y+1)*w] = dark;
					arr[(x+1) + (y+1)*w] = mid;
					arr[(x+2) + (y+1)*w] = mid;
					arr[(x+3) + (y+1)*w] = light;
					
					arr[(x+0) + (y+2)*w] = dark;
					arr[(x+1) + (y+2)*w] = mid;
					arr[(x+2) + (y+2)*w] = mid;
					arr[(x+3) + (y+2)*w] = light;
					
					arr[(x+0) + (y+3)*w] = dark;
					arr[(x+1) + (y+3)*w] = dark;
					arr[(x+2) + (y+3)*w] = dark;
					arr[(x+3) + (y+3)*w] = mid;
					j++
				}
				i++;
			}
			bmp.setVector(bmp.rect, arr);
			bmp.unlock();
			addChild(_4xOverlay);
		}
	}
}
