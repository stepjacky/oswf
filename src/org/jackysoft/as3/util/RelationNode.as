package org.jackysoft.as3.util
{
	import flash.geom.Point;
	import oswf.StepNode;
	import org.stepware.oswf.LineElement;
	import org.stepware.oswf.StepElement;

	/**
	 * 保存step元素和line元素的对应关系
	 * 
	 * */
	public class RelationNode
	{
		private var line:LineElement;
		private var step:StepNode;
		private var isHead:Boolean = false;
		private var position:Point;
		public function RelationNode(line:LineElement,step:StepNode,head:Boolean=false)			
		{
			this.line = line;
			this.step = step;
			this.isHead = head;
			this.position = step.InitiPoint;
			
		}
		
		/**
		 * 返回线元素
		 * */
		public function get Line():LineElement{
			return this.line;
		}
		
		/**指示是否该step是改线的头部step元素*/
		public function get IsHead():Boolean{
			return this.isHead;
		}

		/**
		 * 设置line端点位置
		 * */
	    public function set Position(p:Point):void{
		    this.position = p;	
		}

		/**端点位置*/
		public function get Position():Point{
		    return  this.position;	
		}
		
		/**步骤元素*/
		public function get Step():StepNode{
			return this.step;
		}
		
	}
}