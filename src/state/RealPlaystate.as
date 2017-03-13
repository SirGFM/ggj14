package state {
	
	import objs.basic.Outdoor;
	import objs.BG;
	import objs.Building;
	import objs.Burguer;
	import objs.Floor;
	import objs.House;
	import objs.Player;
	import objs.Shades;
	import org.flixel.FlxBasic;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTimer;
	import util.Bar;
	import util.Timer;
	
	/**
	 * ...
	 * @author GFM
	 */
	public class RealPlaystate extends FlxState {
		
		private var pl:Player;
		private var exclamation:FlxBasic;
		
		private var thunderDur:Number;
		private var timeUntilThunder:Number;
		private var timeUntilShades:Number;
		private var shadesOn:Boolean;
		private var shades:Shades;
		private var hasFlashed:Boolean;
		
		private var shadeAnim:Boolean;
		private var animTimer:Number;
		private var animN:int;
		
		private var timer:Number;
		private var props:FlxGroup;
		private var outdoors:FlxGroup;
		private var switchSpeed:Boolean;
		private var wasRunning:Boolean;
		
		override public function create():void {
			props = new FlxGroup();
			outdoors = new FlxGroup();
			pl = new Player();
			
			add(new Floor());
			add(new BG());
			add(props);
			add(outdoors);
			add(pl);
			
			timer = FlxG.random() * 3;
			timeUntilShades = 10 + int(FlxG.random() * 100) % 7;
			timeUntilThunder = 1;
			thunderDur = 0;
			
			switchSpeed = false;
			wasRunning = false;
			shadesOn = false;
			
			shades =  null;
			shadeAnim = false;
			animTimer = 0;
			animN = -1;
			hasFlashed = false;
		}
		
		override public function update():void {
			// Gameover condition
			if (reg.bar != null && reg.bar.val <= 0)
				FlxG.switchState(new GameOver());
			// Animation before getting the shade
			if (shadeAnim) {
				animTimer -= FlxG.elapsed;
				if (animTimer <= 0)
					animN++;
				if (animN == 0) {
					if (animTimer <= 0) {
						animTimer += 2.25;
						FlxG.flash(0xff000000, 1.5);
						FlxG.camera.zoom = 16;
						FlxG.camera.x = 0.1*16*16;
						FlxG.camera.y = -2 * 16 * 16;
						Main.showX4();
						pl.play("stand");
					}
					FlxG.camera.x += 64 * FlxG.elapsed;
				}
				if (animN == 1) {
					if (animTimer <= 0) {
						animTimer += 2.25;
						FlxG.flash(0xff000000, 1.5, null, true);
						FlxG.camera.x = -2*16*16;
						FlxG.camera.y = -2*16*16;
					}
					FlxG.camera.x += 64 * FlxG.elapsed;
				}
				if (animN == 2) {
					if (animTimer <= 0) {
						animTimer += 3;
						FlxG.flash(0xff000000, 0.5);
						FlxG.camera.zoom = 16;
						FlxG.log("(" + FlxG.camera.x + "," + FlxG.camera.y + ")");
						FlxG.camera.x = 0.5 * 16 * 16;
						FlxG.camera.y = -2 * 16 * 16;
					}
					if (animTimer <= 2 && !hasFlashed) {
						hasFlashed = true;
						exclamation = add(new FlxText(pl.x + 16, pl.y - 8, 16, "!"));
						FlxG.flash(0xffffff, 0.5 );
					}
				}
				if (animN == 3) {
					exclamation.kill();
					shades.kill();
					shadeAnim = false;
					FlxG.camera.x = 0;
					FlxG.camera.y = 0;
					FlxG.camera.zoom = 4;
					FlxG.flash(0xffffffff, 0.5);
					shadesOn = true;
					Main.showX2();
					pl.puShadesOn();
					reg.bar = new Bar();
					add(reg.bar);
					reg.timer = new Timer();
					add(reg.timer);
				}
				return;
			}
			// Timer before shades appear
			if (!shadesOn) {
				if (timeUntilShades > 0) {
					if (reg.velocity.x != 0)
						timeUntilShades -= FlxG.elapsed;
				}
				else if (shades == null) {
					shades = recycle(Shades) as Shades;
				}
				else if (shades.x <= 16 * 6) {
					shadeAnim = true;
				}
			}
			// otherwise, it can thunder!
			else {
				if (!reg.isThunder && timeUntilThunder > 0)
					timeUntilThunder -= FlxG.elapsed;
				else if (reg.isThunder && thunderDur > 0)
					thunderDur -= FlxG.elapsed;
				else if (!reg.isThunder && timeUntilThunder <= 0) {
					FlxG.flash(0xffffff, 1);
					FlxG.shake(0.0075, 0.5, null);//, true, FlxCamera.SHAKE_HORIZONTAL_ONLY);
					reg.justThunder = true;
					reg.isThunder = true;
					thunderDur += 1;
					reg.isRunning = true;
					pl.run();
					sfx.playThunder();
				}
				else if (reg.isThunder) {
					timeUntilThunder += 3 + (int(FlxG.random() * 100) % 3);
					reg.justThunder = true;
					reg.isThunder = false;
					reg.isRunning = false;
					pl.walk();
				}
				reg.timer.run();
			}
			// Fix spawn time
			if (switchSpeed) {
				if (wasRunning)
					timer *= reg.timeDif;
				else
					timer /= reg.timeDif;
				switchSpeed = false;
			}
			
			if (reg.velocity.x != 0)
				timer -= FlxG.elapsed;
			else if (shadesOn)
				reg.bar.val -= FlxG.elapsed*2.5;
			
			if (timer <= 0) {
				var type:uint = FlxG.random() * 10 % 5;
				switch(type) {
					case 0:
						timer += (props.recycle(House) as House).recycle(); break;
					case 1:
						timer += (props.recycle(Building) as Building).recycle(); break;
					case 2:
					case 3:
					case 4:
						timer += (outdoors.recycle(Burguer) as Outdoor).recycle(); break;
				}
			}
			super.update();
			
			FlxG.overlap(pl.LOS, outdoors, onCollide);
			
			if (wasRunning != reg.isRunning) {
				switchSpeed = true;
				wasRunning = reg.isRunning;
			}
			reg.justThunder = false;
		}
		
		public function onCollide(obj1:FlxObject, obj2:FlxObject):void {
			if (reg.isThunder)
				reg.bar.val -= FlxG.elapsed * 4;
		}
	}
}
