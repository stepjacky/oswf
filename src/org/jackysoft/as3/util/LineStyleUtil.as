package org.jackysoft.as3.util
{
	import flash.display.Graphics;
	import flash.geom.Point;
	

	import org.stepware.oswf.LineElement;

	public final class LineStyleUtil
	{		
		
		private function drawPrimaryLine(line:LineElement,start:Point,end:Point):void{
			var s:Point = line.From.localToGlobal(start);
			var e:Point = line.To.localToGlobal(end);
			line.Start = start;
			line.End = end;
			drawLine(line.graphics,s,e);
		}
		
	
		
		/**
		 * 根据元素位置划线
		 * @param gs 绘图工具
		 * @param start 起始点
		 * @param end 结束点
		 * 
		 * */
		public function paintLine(line:LineElement,start:Point,end:Point):void{
			drawPrimaryLine(line,start,end);	
		}
		
		private var _offset:Number=60;
		/**
		 * 坐标位移
		 * */
		public function get OFFSET() :Number{
			return this._offset;
		}
		/**
		 * 坐标位移
		 * */
		public function set OFFSET(value:Number):void{
		    this._offset = value;
		}
		
		private function drawLine(graphics:Graphics,startPoint:Point,endPoint:Point):void{  
			var lineColor:Number =0x2f4f4f;
			graphics.clear();
			graphics.beginFill(lineColor);
			graphics.lineStyle(2,lineColor);  
			graphics.moveTo(startPoint.x,startPoint.y);
			graphics.drawCircle(startPoint.x,startPoint.y,2);
			graphics.lineTo(endPoint.x,endPoint.y);  
			var isArrow:Boolean = true;
			var radius:Number = 5;
			if(isArrow){  
				var angle:Number = getAngle(startPoint,endPoint);  
				var centerX:Number = endPoint.x - radius * Math.cos(angle*(Math.PI/180));  
				var centerY:Number = endPoint.y + radius * Math.sin(angle*(Math.PI/180));  
				var topX:Number = endPoint.x;  
				var topY:Number = endPoint.y;  
				var leftX:Number = centerX + radius * Math.cos((angle+120)*(Math.PI/180));  
				var leftY:Number = centerY - radius * Math.sin((angle+120)*(Math.PI/180));  
				var rightX:Number = centerX + radius * Math.cos((angle+240)*(Math.PI/180));  
				var rightY:Number = centerY - radius * Math.sin((angle+240)*(Math.PI/180));  
				graphics.beginFill(lineColor,1);  
				graphics.lineStyle(2,lineColor,1);  
				graphics.moveTo(topX,topY);  
				graphics.lineTo(leftX,leftY);  
				graphics.lineTo(centerX,centerY);  
				graphics.lineTo(rightX,rightY);  
				graphics.lineTo(topX,topY);  
				graphics.endFill();  
			}  
		}  
		
		private function getAngle(startPoint:Point,endPoint:Point):Number{  
			var tmpx:Number=endPoint.x - startPoint.x;  
			var tmpy:Number=startPoint.y - endPoint.y;  
			var angle:Number= Math.atan2(tmpy,tmpx)*(180/Math.PI);  
			return angle;  
		}  
				
	}
}