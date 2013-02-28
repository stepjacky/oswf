package org.jackysoft.as3.util
{
	import flash.display.Graphics;
	import flash.geom.Point;

	public final class PaintUtil
	{
		public function PaintUtil()
		{
		}
		
		public static function paintCycle(gs:Graphics,p:Point,r:Number=1):void{
			//gs.clear();
			gs.beginFill(0xfcc);
			gs.drawCircle(p.x,p.y,r);
			gs.endFill();
		}
		
		public static function paintSquare(gs:Graphics,p:Point,r:Number=1):void{
			gs.beginFill(0x000);
			gs.moveTo(p.x-r/2,p.y-r/2);
			gs.lineTo(p.x+r/2,p.y-r/2);
			gs.lineTo(p.x+r/2,p.y+r/2);
			gs.lineTo(p.x-r/2,p.y+r/2);
			gs.endFill();
		}
	}
}