package org.stepware.oswf
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import org.atomsoft.as3.base.WorkflowNode;
	import org.atomsoft.as3.base.event.ArrowEvent;
	import org.atomsoft.as3.base.event.EffectiveEvent;
	import org.atomsoft.as3.base.event.LineMoveEvent;
	import org.jackysoft.as3.util.DrawManager;
	import org.jackysoft.as3.util.LineArrow;
	import org.jackysoft.as3.util.LineStyleUtil;
	import org.jackysoft.as3.util.PaintUtil;
	import org.jackysoft.as3.util.RelationNode;
	import org.jackysoft.as3.util.TurnSquare;
	import org.stepware.app.WorkflowStage;
	
	public class LineElement extends WorkflowNode
	{
			
	    private var _start:Point;
		private var _end:Point;
		private var _from:StepNode;
		private var _to:StepNode;	
		private var _drawManager:DrawManager = DrawManager.getInstance();
		private var _lineUtil:LineStyleUtil = new LineStyleUtil();
		public function LineElement(from:StepNode,to:StepNode){
			super();
			this._from = from;
			this._to = to;
	        if(this._to is EndElement){
			    var t:EndElement = this._to as EndElement;
				t.Transmit = this;
			}
			if(this._from is StartElement){
			    var se:StartElement = this._from as StartElement;
				se.Transmit = this;
				
			}
			
		    _from.addTransmit(this);
			_to.addTransmit(this);					
			addEventListener(LineMoveEvent.DRAW,reDrawMe);
			
			this._start = this._from.localToGlobal(from.LinePoint);
			this._end = this._to.localToGlobal(to.LinePoint);			
			addEventListener(MouseEvent.CLICK,clickHanlder);
					
		}
		  
		
		public function set From(line:StepNode):void{
			if(line is JoinElement){
				var j:JoinElement = line as JoinElement;
				j.hasFrom = true;
			}
				
			this._from = line;
		}
		
		public function set To(line:StepNode):void{
		   this._to = line;	
		}
		
		public function get From():StepNode{
			return this._from;
		}
		public function get To():StepNode{
			return this._to;
		}
		
		private function reDrawMe(evt:LineMoveEvent):void
		{
			this._drawManager.paintLine(this,evt.header,evt.tailer);			
		}
		      
		protected override function dragthis(event:MouseEvent):void 
		{ 
			//super.dragthis(event);
			//这里鼠标坐标是舞台坐标
			var mp:Point	  = new Point(event.stageX,event.stageY);
			var emp:Point = this.To.globalToLocal(mp);
			var enddis:Number = Point.distance(emp,this.End);
			var smp:Point = this.From.globalToLocal(mp);
			var startdis:Number = Point.distance(smp,this.Start);
			var dragHeadable:Boolean = false;
			var dragTailable:Boolean = false;
			
			var evt:LineMoveEvent = new LineMoveEvent();
			if(enddis<=10){
			   evt.header = this._start;
			   evt.tailer = this.To.globalToLocal(mp);
			   dragHeadable = true;
			}
			if(startdis<=10){
				evt.header = this.From.globalToLocal(mp);
				evt.tailer = this._end;
				dragTailable = true;
			}
			if(dragHeadable && this.hitTestObject(this.From))
				this.dispatchEvent(evt);
			if(dragTailable && this.hitTestObject(this.To))
				this.dispatchEvent(evt);
		} 			
		
		private function clickHanlder(evt:MouseEvent):void{
			var mp:Point = new Point(evt.stageX,evt.stageY);						
		}		
		
		public function get Start():Point{
		   return this._start;
		}
		
		public function set Start(va:Point):void{
			this._start = va;
		}
		
		public function get End():Point{
		   return this._end;
		}
		
		public function set End(p:Point):void{
			this._end = p;
		}
		
	}
}