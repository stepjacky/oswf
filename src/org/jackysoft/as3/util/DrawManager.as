package org.jackysoft.as3.util
{
	import flash.geom.Point;
	
	import org.jackysoft.as3.oswf.StepNode;
	import org.jackysoft.as3.oswf.WorkflowNode;
	import org.stepware.oswf.*;
	
	
	public class DrawManager
	{
		private static var _instance:DrawManager;
		private var headstep:StepNode;
		private var tailstep:StepNode;
		private var lineStepMap:Vector.<RelationNode>;
		public function DrawManager(efor:SingletonEnforcer){
			lineStepMap = new Vector.<RelationNode>();
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
			
			trace("条件是否满足: "+Satisfaction);
			if(Satisfaction){
				var le:LineElement  =  new LineElement(headstep,tailstep);
				this.lineStepMap.push(new RelationNode(le,headstep,true));
				this.lineStepMap.push(new RelationNode(le,tailstep,false));
				//trace(this.lineStepMap);
				return le;
			}else{
				return null;
			}
		}
		
		/**
		 * 判断是否头尾条件都满足
		 * */
		public function get Satisfaction():Boolean{
			var satisfy:Boolean = false;
			trace(headstep);
			trace(tailstep);
			if(headstep!=null && tailstep!=null){
				trace(headstep is StartNode);
				if(headstep is StartNode){
				   var h:StartNode = headstep as StartNode;
				   return h.getConnection()==null;
				   
				}
			}
			return satisfy;
		}
		
		
		/**
		 * 查找Line位于step元素中的点位置
		 * @param line LineElement 线元素
		 * @param isHeader  boolean 是否头步骤
		 * @return 
		 * 线元素的   Point 坐标 根据isHeader的值确定，
		 * <b>true</b> 则返回头坐标
		 * <b>false</b> 则返回尾坐标
		 * */
		public function findRelation(line:LineElement,isHeader:Boolean=true):RelationNode{
			for each(var lsr:RelationNode in this.lineStepMap){
				if(lsr.IsHead==isHeader && line===lsr.Line){
					return lsr;
				}
			}
			return null;
		}		
		
	}
	
}
class SingletonEnforcer{}