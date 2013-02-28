package org.jackysoft.as3.util
{
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class TurnSquare extends Shape
	{
		private var _initPos:Point;
		private var _shouldVisiable:Boolean= new Boolean(true);
		public function TurnSquare(r:int)
		{
			super();
			var gs:Graphics = this.graphics;
			gs.beginFill(0x000);
			gs.moveTo(0,0);
			gs.lineTo(0,r);
			gs.lineTo(r,r);
			gs.lineTo(r,0);
			gs.endFill();		
			addEventListener(MouseEvent.CLICK,clickHandler);
			this._shouldVisiable = true;
			
		}
		
		protected function clickHandler(event:MouseEvent):void
		{
			trace(event);
			event.stopPropagation();
			
		}
		
		public function set Position(value:Point):void{
			if(value!=null) _initPos = value;
			if(value==null || !this.visible)return;
			
			var op:Point = new Point(value.x,value.y);
			op.offset(-3.5,-3);
			this.x = op.x;
			this.y = op.y;
			
		}
		
		public function get Position():Point{
			var mp:Point = new Point(this.x,this.y);
			return _initPos;
		}

		public function get ShouldVisiable():Boolean
		{
			return _shouldVisiable;
		}

		public function set ShouldVisiable(value:Boolean):void
		{
			_shouldVisiable = value;
		}

	}
}