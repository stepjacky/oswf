package org.jackysoft.as3.oswf
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	
	import org.stepware.as3.events.EffectiveEvent;
	
   
	
	public class WorkflowNode extends Sprite
	{
		protected var offsetX:Number; 
		protected var offsetY:Number;				
		private var haveFoucs:Boolean = false;
		private var traceOn:Boolean = false;
		public function WorkflowNode()
		{
			super();		
			
			addEventListener(MouseEvent.MOUSE_DOWN, startDragging); 
			addEventListener(MouseEvent.MOUSE_UP, stopDragging);		
			addEventListener(EffectiveEvent.FOCUS, onFocus);		
			addEventListener(EffectiveEvent.UNFOCUS, onUnFocus);    
			
		}
		
		// This function is called when the mouse button is pressed. 
		protected function startDragging(event:MouseEvent):void 
		{ 
						
			// Record the difference (offset) between where 
			// the cursor was when the mouse button was pressed and the x, y 
			// coordinate of the this when the mouse button was pressed. 
			offsetX = event.stageX - this.x; 
			offsetY = event.stageY - this.y; 
			
			// tell Flash Player to start listening for the mouseMove event 
			stage.addEventListener(MouseEvent.MOUSE_MOVE, dragthis); 
		} 
		
		// This function is called when the mouse button is released. 
		protected function stopDragging(event:MouseEvent):void 
		{ 
			// Tell Flash Player to stop listening for the mouseMove event. 
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, dragthis); 
		} 
		
		// This function is called every time the mouse moves, 
		// as long as the mouse button is pressed down. 
		protected function dragthis(event:MouseEvent):void 
		{ 
			// Move the this to the location of the cursor, maintaining  
			// the offset between the cursor's location and the  
			// location of the dragged object. 
			this.x = event.stageX - offsetX; 
			this.y = event.stageY - offsetY; 
			if(TraceOn){
			  trace(this.x);
			  trace(this.y);
			}
			/*var matrix:Matrix = new Matrix(); 
			var rotation:Number = 2 * Math.PI * (30 / 360); // 30° 
			var scaleFactor:Number = 2; 
			matrix.scale(scaleFactor, scaleFactor); 
			matrix.rotate(rotation); 
			matrix.scale(scaleX, scaleY); 
			matrix.rotate(rotation); 
			this.transform.matrix = matrix;*/
			// Instruct Flash Player to refresh the screen after this event. 
			/*
			var cma:ColorTransform = new ColorTransform();
			cma.alphaOffset = 3;
			cma.blueOffset = 2;
			cma.redOffset = 1;
			this.transform.colorTransform = cma;
			*/
			event.updateAfterEvent(); 
		} 
		
		protected function onFocus(evt:EffectiveEvent):void
		{
			if(!haveFoucs){
			    var dp:DisplayObject = evt.currentTarget as DisplayObject;
			    dp.filters = evt.Filter;
			    haveFoucs = true;	
			}
		}
		
		protected function onUnFocus(evt:EffectiveEvent):void
		{
			if(haveFoucs){
				var dp:DisplayObject = evt.target as DisplayObject;
				dp.filters = null;
				haveFoucs=false;
			}
			
		}
		
		public function set TraceOn(t:Boolean):void{
			this.traceOn = t;
		}
		
		public function get TraceOn():Boolean{
			return this.traceOn;
		}
		
		
		public override function  toString():String{
			return super.toString()+"@"+new Date().toLocaleString();
		}
	}
}