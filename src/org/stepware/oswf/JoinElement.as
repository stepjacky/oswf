package org.stepware.oswf
{
		

	
	public class JoinElement extends StepNode
	{
		public var hasFrom:Boolean = false;
		public function JoinElement()
		{
			super();
			this.graphics.lineStyle(1,0xFFFF00);
			this.graphics.beginFill(0x6699FF);
			this.graphics.moveTo(0,0);
			this.graphics.lineTo(DIAMETER,RADIUS);
			this.graphics.lineTo(0,DIAMETER);
			this.graphics.lineTo(0,0);
			this.graphics.endFill();
		}
		
		public function set From(line:LineElement):void{
			if(!hasFrom){
				this.transmits.push(line);
				hasFrom = true;
			}
		}
		
	
	}
}