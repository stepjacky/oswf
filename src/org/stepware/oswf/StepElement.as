package org.stepware.oswf
{
	import flash.geom.Point;
	
	import org.jackysoft.as3.oswf.StepNode;

	public class StepElement extends StepNode implements StartNode
	{
				
		public function StepElement()
		{
			super();
			this.graphics.lineStyle(1, 0x000000); 
			this.graphics.beginFill(0x99CC33); 
			this.graphics.drawRect(0,0,100,100); 
			this.graphics.lineStyle(2, 0xF0DF71);
			this.graphics.beginFill(0xCCFF99); 
			this.graphics.drawRect(10,10,80,80);
			initPoint = new Point(this.RADIUS,this.RADIUS);
			this.width = this.DIAMETER;
			this.height = this.DIAMETER;			
		}	
		/**
		 * 该步骤的连线集合
		 * @return Vector.<LineElement>
		 *  
		 */		
		public function get Transmits():Vector.<LineElement>{
			return this.transmits;
		}
		
		public function getConnection():LineElement{
		    return this.Transmit;
		}
				
	}
}