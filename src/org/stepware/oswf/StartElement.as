package org.stepware.oswf
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import org.atomsoft.as3.base.event.LineMoveEvent;
	
	public class StartElement extends StepNode implements StartNode
	{
		
		
		public function StartElement()
		{
			super();
			this.graphics.lineStyle(1, 0x000000); 
			this.graphics.beginFill(0xFF6600); 
			this.graphics.drawCircle(0,0,RADIUS); 
			this.graphics.endFill();			
			width = DIAMETER;
			height = DIAMETER;
			this.LinePoint = this.TopLeft;
		}
			
		
		
				
		protected override function dragthis(event:MouseEvent):void {
			super.dragthis(event);
			if(this.Transmit!=null){
				var evt:LineMoveEvent = new LineMoveEvent();
				evt.header = this.Transmit.Start;
				evt.tailer = this.Transmit.End;
				this.Transmit.dispatchEvent(evt);
			}
			
		}
		
		public function getConnection():LineElement{
			return this.Transmit;
		}
		
		/**
		 * 重载以删除连线
		 * */
		public override function removeTransmit(line:LineElement):void{
			 this.Transmit = null;
		}
		
	}
}