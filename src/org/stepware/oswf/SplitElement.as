package org.stepware.oswf
{
	
	public class SplitElement extends StepNode
	{
		public var hasTo:Boolean = false;
		public var Team:Boolean = false;
		public function SplitElement()
		{
			super();
			this.graphics.lineStyle(1,0xFFFF00);
			this.graphics.beginFill(0x99CCFF);
			this.graphics.moveTo(0,RADIUS);
			this.graphics.lineTo(DIAMETER,0);
			this.graphics.lineTo(DIAMETER,DIAMETER);
			this.graphics.lineTo(0,RADIUS);
			this.graphics.endFill();
		}
		
		public function set To(line:LineElement):void{
			if(!hasTo){
			
			 	this.transmits.push(line);
				hasTo = true;
			}
			
		}
	}
}