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
	}
}