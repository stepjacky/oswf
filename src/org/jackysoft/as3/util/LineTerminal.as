package org.jackysoft.as3.util
{
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	
	import org.jackysoft.as3.oswf.WorkflowNode;
	import org.stepware.oswf.StepElement;
	import org.stepware.as3.events.DrawEvent;
	
	public class LineTerminal extends WorkflowNode 
	{
		private var parentStep:StepElement;
		public function LineTerminal()
		{
			super();
			addEventListener(DrawEvent.DRAW,drawHanlder);
			dispatchEvent(new DrawEvent());	
			addEventListener(MouseEvent.CLICK,clickHanlder);
			
		}
		
		public function set ParentStep(s:StepElement):void{
			this.parentStep = s;
		}
		
		public function get ParentStep():StepElement{
			return this.parentStep;
		}
		
		
		
		private function drawHanlder(evt:DrawEvent):void{
			drawMe(evt.dx,evt.dy);
		}
		
		private function drawMe(dx:uint,dy:uint):void{
			this.graphics.clear();
			this.graphics.beginFill(0xffcc55);
			this.graphics.drawCircle(dx,dy,6);
			this.graphics.endFill();
		}
		
		private function clickHanlder(evt:MouseEvent):void{
			//trace(this.toString());
		}
			
	}
}