package org.stepware.oswf
{
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import org.atomsoft.as3.base.WorkflowNode;
    import org.atomsoft.as3.base.event.*;
	
	
	public class StepNode extends WorkflowNode 	{
		private static var w:int = 100;
		private static var _ellipseWidth:Number=15;
		private static var _ellipseHeight:Number=15;
		private var _topLeft:Point;
		private var _topPos:Point;
		private var _topRight:Point;
		private var _rightPos:Point;
		private var _bottomLeft:Point;
		private var _bottomRight:Point;
		private var _bottomPos:Point;
		private var _leftPos:Point;
		protected var _initPoint:Point;
		private var _centre:Point;
		/**连线集合*/
		protected var transmits:Vector.<LineElement> = new Vector.<LineElement>();
		
		private  var transmit:LineElement;
		public function StepNode()
		{
			super();
			_topLeft = new Point(0,0);
			_topPos = new Point(RADIUS,0);
			_topRight = new Point(DIAMETER,0);
			_rightPos = new Point(DIAMETER,RADIUS);
			_bottomRight = new Point(DIAMETER,DIAMETER);
			_bottomPos = new Point(RADIUS,DIAMETER);
			_bottomLeft = new Point(0,DIAMETER);
			_leftPos = new Point(0,RADIUS);
			_initPoint = new Point(RADIUS,RADIUS);
			_centre = new Point(RADIUS,RADIUS);
			this.Poisition = this.localToGlobal(new Point(this.x,this.y));
					
		}
					
		public function addTransmit(line:LineElement):void{
			this.transmits.push(line);
		}
		
		
		override protected function dragthis(event:MouseEvent):void {
			super.dragthis(event);
			//this.cPoint = new LinePoint(event.stageX,event.stageY);
			for each(var line:LineElement in transmits)
			{
				var evt:LineMoveEvent = new LineMoveEvent();
				evt.header = line.Start;
				evt.tailer = line.End;
				line.dispatchEvent(evt);
				
			}		
			
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
		
		public static function get RADIUS():Number{
			return w/2;
		}
		/**直径**/
		public static function get DIAMETER():Number{
			return w;
		}

		/**半径*/
		public static function get EllipseWidth():Number
		{
			return _ellipseWidth;
		}	

		public static function get EllipseHeight():Number
		{
			return _ellipseHeight;
		}

		public function get TopLeft():Point
		{
			return _topLeft;
		}

		public function get TopPos():Point
		{
			return _topPos;
		}

		public function get TopRight():Point
		{
			return _topRight;
		}

		public function get RightPos():Point
		{
			return _rightPos;
		}

		public function set RightPos(value:Point):void
		{
			_rightPos = value;
		}

		public function get BottomLeft():Point
		{
			return _bottomLeft;
		}

		public function get BottomRight():Point
		{
			return _bottomRight;
		}

		public function get BottomPos():Point
		{
			return _bottomPos;
		}

		public function get LeftPos():Point
		{
			return _leftPos;
		}

		public function get LinePoint():Point
		{
			return _initPoint;
		}

		public function set LinePoint(value:Point):void
		{
			_initPoint = value;
		}	
		
		public function get Centre():Point
		{
			return _centre;
		}

		
	}
}