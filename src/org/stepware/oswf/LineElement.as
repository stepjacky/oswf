package org.stepware.oswf
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import org.jackysoft.as3.oswf.StepNode;
	import org.jackysoft.as3.oswf.WorkflowNode;
	import org.jackysoft.as3.util.DrawManager;
	import org.jackysoft.as3.util.RelationNode;
	import org.stepware.as3.events.LineMoveEvent;
	
	public class LineElement extends WorkflowNode
	{
		
		public static  var DISDIFF:Number = 100;		
	    private var head:Point;
		private var tail:Point;
		private var drawManager:DrawManager = DrawManager.getInstance();
		public function LineElement(from:StepNode,to:StepNode){
			
			super();
			
			From = from;
			To = to;
			if(from is StartElement){
			    var se:StartElement = from as StartElement;
				se.Transmit = this;
				
			}else{
				from.addTransmit(this);
			}
				
			to.addTransmit(this);					
			addEventListener(LineMoveEvent.DRAW,reDrawMe);
			//加入后先不绘制
			//dispatchEvent(new DrawEvent());
			var fp:Point = from.localToGlobal(from.InitiPoint);
			var tp:Point = to.localToGlobal(to.InitiPoint);			
			//addEventListener(MouseEvent.CLICK,clickHanlder);
			head = fp;
			tail =tp;
			
		}
		  
		private var from:StepNode;
		private var to:StepNode;	
		public function set From(line:StepNode):void{
			if(line is JoinElement){
				var j:JoinElement = line as JoinElement;
				j.hasFrom = true;
			}
				
			this.from = line;
		}
		
		public function set To(line:StepNode):void{
		   this.to = line;	
		}
		
		public function get From():StepNode{
			return this.from;
		}
		public function get To():StepNode{
			return this.to;
		}
		
		private function reDrawMe(evt:LineMoveEvent):void
		{
			this.graphics.clear();
			this.graphics.lineStyle(4,0x336699);
			var hrel:RelationNode = drawManager.findRelation(this,true);
			var trel:RelationNode = drawManager.findRelation(this,false);
			var fp:Point = From.localToGlobal(hrel.Position);
			var tp:Point = To.localToGlobal(trel.Position);
			var ax:Number = Math.abs(fp.x-tp.x);
			var bx:Number = Math.abs(fp.y-tp.y);
			var cx:Number = Math.sqrt(Math.pow(ax, 2) + Math.pow(bx, 2));
			
			var ydiff:Number = Math.abs(tp.y-fp.y);
			var xdiff:Number = Math.abs(tp.x-fp.x);
			//亮点之间画直线
			var horizontal:Boolean = ydiff<=DISDIFF;
			var vertical:Boolean = xdiff<=DISDIFF;
		
			var ma:Point = null; 
			var mb:Point = null;
			
		    if(!horizontal){
				ma = new Point(fp.x+COORDINATE_OFFSET,fp.y);
				mb = new Point(fp.x+COORDINATE_OFFSET,tp.y);
				
				//如果结束元素位于起始元素左边,则反转线位置
				if(tp.x<fp.x){
					ma.x = ma.x-2*COORDINATE_OFFSET;
					mb.x = mb.x-2*COORDINATE_OFFSET;
				}
			}
			if(!vertical){
				ma = new Point(fp.x,fp.y-COORDINATE_OFFSET);
				mb = new Point(tp.x,fp.y-COORDINATE_OFFSET);
			}
			
			var brokenable:Boolean = !horizontal || !vertical;
			
			this.graphics.moveTo(fp.x,fp.y);
			if(brokenable){
			    this.graphics.lineTo(ma.x,ma.y);
			    this.graphics.lineTo(mb.x,mb.y);
			}
			this.graphics.lineTo(tp.x,tp.y);
			trace("头端点位置 : "+fp+"尾端点位置:"+tp);
			head = fp;
			tail =tp;
			
		}
		
	
		protected override function dragthis(event:MouseEvent):void 
		{ 
			super.dragthis(event);
		    trace(head+" , "+tail);
			
		} 				
		
		/**
		 * 坐标位移
		 * */
		public function get COORDINATE_OFFSET() :Number{
			return From.RADIUS+30;
		}
		
		private function clickHanlder(evt:MouseEvent):void{
			//trace(evt.target);		
			
		}
		
	}
}