package org.jackysoft.as3.util
{
	import flash.utils.Dictionary;
	
	import flashx.textLayout.formats.Direction;
	
	import org.stepware.oswf.LineElement;
	import org.stepware.oswf.StepElement;

	public final class Tools
	{
		public function Tools(){
		}
		
			
		public static function inVector(line:LineElement,vect:Vector.<LineElement>):Boolean{
			for each(var li:LineElement in vect){
				if(li==line)return true;
			}
			return false;
		}
		/**
		 * @param px1 x1
		 * @param py1 y1
		 * @param px2 x2
		 * @param py2 y2
		 * */
		public static function getAngle(px1, py1, px2, py2):Number {
			//两点的x、y值
			var x = px2-px1;
			var y = py2-py1;
			var hypotenuse = Math.sqrt(Math.pow(x, 2)+Math.pow(y, 2));
			//斜边长度
			var cos = x/hypotenuse;
			var radian = Math.acos(cos);
			//求出弧度
			var angle = 180/(Math.PI/radian);
			//用弧度算出角度    
			if (y<0) {
				angle = -angle;
			} else if ((y == 0) && (x<0)) {
				angle = 180;
			}
			return angle;
		}
	}
}