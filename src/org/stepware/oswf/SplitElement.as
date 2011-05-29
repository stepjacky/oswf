package org.stepware.oswf
{
	import org.jackysoft.as3.oswf.StepNode;
	
	public class SplitElement extends StepNode
	{
		public var hasTo:Boolean = false;
		public var Team:Boolean = false;
		public function SplitElement()
		{
			super();
			this.graphics.lineStyle(1,0xFFFF00);
			this.graphics.beginFill(0x99CCFF);
			this.graphics.moveTo(0,this.RADIUS);
			this.graphics.lineTo(this.DIAMETER,0);
			this.graphics.lineTo(this.DIAMETER,this.DIAMETER);
			this.graphics.lineTo(0,this.RADIUS);
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