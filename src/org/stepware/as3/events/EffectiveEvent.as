package org.stepware.as3.events
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.filters.BitmapFilter;
	import flash.filters.GlowFilter;
	public class EffectiveEvent extends Event
	{
		public static const FOCUS:String ="focus";
		public static const UNFOCUS:String ="unfocus";
		private var filters:Array = null;
		
		private var sglow:GlowFilter = new GlowFilter();
		
		
		
		public function EffectiveEvent(type:String=FOCUS)
		{
			super(type);
			sglow.color = 0xFF6666;
			this.filters = [sglow];
			
		}
		
		public function set Filter(f:Array):void{
			 
			this.filters.push(f);
		
		}
		
		public function get Filter():Array{
			
			return this.filters;
		
		}		
		
	}
}