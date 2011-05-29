package org.stepware.oswf
{
		
	import org.jackysoft.as3.oswf.StepNode;
	
	public class JoinElement extends StepNode
	{
		public var hasFrom:Boolean = false;
		public function JoinElement()
		{
			super();
			this.graphics.lineStyle(1,0xFFFF00);
			this.graphics.beginFill(0x6699FF);
			this.graphics.moveTo(0,0);
			this.graphics.lineTo(this.DIAMETER,this.RADIUS);
			this.graphics.lineTo(0,this.DIAMETER);
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