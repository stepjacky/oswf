package org.jackysoft.as3.util
{
	import flash.display.Shape;
	import flash.events.Event;
	import flash.geom.Point;
	
	import org.atomsoft.as3.base.event.ArrowEvent;
	
	public class LineArrow extends Shape
	{
		private var rota:Rotator;
		public function LineArrow()
		{
			super();
			reDraw();			
			rota = new Rotator(this);
			this.addEventListener(ArrowEvent.RORATE,rorateArrow);
		}
		
		protected function rorateArrow(event:ArrowEvent):void
		{
			
			var from:Point = event.FromType;
			var to:Point = event.ToType;	
			var r:Number = Tools.getAngle(from.x,from.y,to.x,to.y);
			//this.rotation = r;			
			rota.setRegistrationPoint(to);
			rota.rotation = r;			
			
		}
		protected function reDraw():void{
			this.graphics.clear();
			this.graphics.beginFill(0x000000);
			this.graphics.moveTo(0,0);
			this.graphics.lineTo(0,8);
			this.graphics.lineTo(10,4);
			this.graphics.lineTo(0,0);
			this.graphics.endFill();
		}
		
	}
}