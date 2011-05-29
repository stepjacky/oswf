package org.stepware.oswf
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import org.jackysoft.as3.oswf.StepNode;
	import org.stepware.as3.events.LineMoveEvent;
	
	public class StartElement extends StepNode implements StartNode
	{
		
		
		public function StartElement()
		{
			this.graphics.lineStyle(1, 0x000000); 
			this.graphics.beginFill(0xFF6600); 
			this.graphics.drawCircle(0,0,super.RADIUS); 
			this.graphics.endFill();
			initPoint = new Point(0,0);
			
		}
			
		
		
				
		protected override function dragthis(event:MouseEvent):void {
			super.dragthis(event);
			if(this.Transmit!=null){
				var evt:LineMoveEvent = new LineMoveEvent();
				this.Transmit.dispatchEvent(evt);
			}
			
		}
		
		public function getConnection():LineElement{
			return this.Transmit;
		}
		
	}
}