package org.stepware.oswf
{
	import org.jackysoft.as3.oswf.StepNode;
	import flash.geom.Point;
	import flash.events.MouseEvent;
   	import org.stepware.as3.events.EffectiveEvent;
   	import org.stepware.as3.events.LineMoveEvent;
	
	public class EndElement extends StepNode
	{
		
		public function EndElement()
		{
			this.graphics.lineStyle(1, 0x000000); 
			this.graphics.beginFill(0xCC3399); 
			this.graphics.drawCircle(0,0,this.RADIUS); 
			this.graphics.endFill();
			initPoint = new Point(0,0);		
		}
		
		
	}
}