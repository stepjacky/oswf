package org.jackysoft.as3.util
{
	import flash.display.Graphics;
	import flash.geom.Point;
	
	import org.atomsoft.as3.base.WorkflowNode;
	import org.stepware.oswf.*;
	
	
	public class DrawManager
	{
		private static var _instance:DrawManager;
		private var _lineStyle:LineStyleUtil;
		private var headstep:StepNode;
		private var tailstep:StepNode;
		public function DrawManager(efor:SingletonEnforcer){
			_lineStyle = new LineStyleUtil();
			_lineStyle.OFFSET = StepNode.RADIUS+30;
		}
		
		public static function getInstance():DrawManager{
			if(DrawManager._instance==null){
				DrawManager._instance  = new DrawManager(new SingletonEnforcer());
			}
			return DrawManager._instance;
		}
		
		public function set CurrentNode(step:WorkflowNode):void{
			if(step is StepNode){
				
				if(headstep==null){
					//结束元素不能当头结点
					if(!(step is EndElement)){
					   
						headstep=step as StepNode;
					  
					}
					return ;
					
				}
				if(tailstep==null && step!=headstep){
					//开始元素不能当结尾节点
					if(!(step is StartElement)){
					   
						tailstep=step as StepNode;	
					}
					return;
				}
				
				
			}
		}
		
		public function reset():void{
			headstep=null;
			tailstep=null;			
		}
		
		/**
		 * 保存单击过的第一个步骤元素
		 * */
		public function get HEAD():StepNode{
			return headstep;
		}
		
		/**
		 * 单击过的第二个步骤元素
		 * */
		public function get TAIL():StepNode{
			return tailstep;
		}
		
		public function giveLine():LineElement{
			
			if(Satisfaction){
				var le:LineElement  =  new LineElement(headstep,tailstep);
				return le;
			}else{
				return null;
			}
		}
		
		/**
		 * 判断是否头尾条件都满足
		 * */
		public function get Satisfaction():Boolean{
			if(headstep==null || tailstep==null) return false;
			if(headstep is StartNode){
				var h:StartNode = headstep as StartNode;
				return h.getConnection()==null;
				
			}
			if(tailstep is EndNode ){
			    var t:EndNode = tailstep as EndNode;
				return t.getConnection()==null;
			}
			return true;
		}
				
		public function paintLine(line:LineElement,start:Point,end:Point):void{
			_lineStyle.paintLine(line,start,end);
		}
		
	}
	
}
class SingletonEnforcer{}