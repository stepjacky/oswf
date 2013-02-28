package org.jackysoft.as3.util
{
	import flash.display.Sprite;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	
	public class ButtonStatus extends Sprite
	{
		private var tlabel:TextField = new TextField();
		public function ButtonStatus(clr:uint,txt:String="")
		{
			graphics.lineStyle(1,clr,0.8)
			graphics.beginFill(0xffcc33,0.8);
			graphics.drawRoundRect(0,0,80,20,8);
			graphics.endFill();
			tlabel.width=80;
			tlabel.height=20;
			tlabel.text = txt;			
			addChild(tlabel);	
			
		}
	}
}