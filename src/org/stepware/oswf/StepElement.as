package org.stepware.oswf
{
	import flash.geom.Point;
	

	import org.jackysoft.as3.util.PaintUtil;

	public class StepElement extends StepNode
	{
				
		public function StepElement()
		{
			super();
			this.graphics.lineStyle(1, 0x000000); 
			this.graphics.beginFill(0x99CC33); 
			this.graphics.drawRoundRect(0,0,DIAMETER,DIAMETER,EllipseWidth,EllipseHeight);
			this.graphics.endFill();				
			width = DIAMETER;
			height = DIAMETER;
			this.LinePoint = this.Centre;
		}	
		/**
		 * 该步骤的连线集合
		 * @return Vector.<LineElement>
		 *  
		 */		
		public function get Transmits():Vector.<LineElement>{
			return this.transmits;
		}			
				
	}
}