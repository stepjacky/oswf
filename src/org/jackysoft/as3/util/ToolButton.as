package org.jackysoft.as3.util
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	
	public class ToolButton extends SimpleButton
	{
		public function ToolButton(text:String)
		{
		       var up:ButtonStatus = new ButtonStatus(0x8a8a8a,text);
		       var op:ButtonStatus = new ButtonStatus(0xd6d6d6,text);
		       var dp:ButtonStatus = new ButtonStatus(0x757575,text);
		       var hp:ButtonStatus = new ButtonStatus(0x777070,text);
			   super(up,op,dp,hp);
			   width=80;
			   height=20;
		}
	}
}