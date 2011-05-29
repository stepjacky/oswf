package org.jackysoft.as3.oswf
{
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import org.jackysoft.as3.util.LineTerminal;
	import org.jackysoft.as3.util.Tools;
	import org.stepware.as3.events.EffectiveEvent;
	import org.stepware.as3.events.LineMoveEvent;
	import org.stepware.oswf.LineElement;
	
	public class StepNode extends WorkflowNode
	{
		/**鼠标点击位置*/
		private  var w:int = 100;
		protected var initPoint:Point;
		/**连线集合*/
		protected var transmits:Vector.<LineElement> = new Vector.<LineElement>();
		
		private  var transmit:LineElement;
		public function StepNode()
		{
			super();
		}
					
		public function addTransmit(line:LineElement):void{
			this.transmits.push(line);
		}
		
		/**取开始线坐标点*/
		public function get InitiPoint():Point{
			return this.initPoint;
		}
		/**设置开始线坐标点*/
		public function set InitiPoint(ip:Point):void{
			this.initPoint = ip;
		}
		
		override protected function dragthis(event:MouseEvent):void {
			super.dragthis(event);
			//this.cPoint = new LinePoint(event.stageX,event.stageY);
			for each(var line:LineElement in transmits)
			{
				var evt:LineMoveEvent = new LineMoveEvent();
				line.dispatchEvent(evt);
				
			}
			
			//var p:Point = new Point(this.offsetX,this.offsetY);
			//trace(p);
			
			
		}
		override protected function onFocus(evt:EffectiveEvent):void{
			super.onFocus(evt);			
		}
		
		public function resetTransmits():void{
			this.transmits.splice(0,this.transmits.length);
		}
		
		public function removeTransmit(line:LineElement):void{
		     var idx:int = this.transmits.indexOf(line);
			 if(idx!=-1){
				 this.transmits.splice(idx,1);
			 }
		}
		
		public function set Transmit(line:LineElement):void{
			this.transmit = line;
		}
		public function get Transmit():LineElement{
			return this.transmit;
		}
		
		public function get RADIUS():Number{
			return w/2;
		}
		
		public function get DIAMETER():Number{
			return w;
		}
		
	}
}