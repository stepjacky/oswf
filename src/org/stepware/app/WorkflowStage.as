package org.stepware.app
{
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.filters.*;
	import flash.net.*;
	import flash.text.*;
	import flash.utils.*;
	
	import org.atomsoft.as3.base.WorkflowNode;
	import org.atomsoft.as3.base.event.*;
	import org.jackysoft.as3.util.*;
	import org.stepware.oswf.*;
	
	public class WorkflowStage extends Sprite
	{
		private var toolbtn:ToolButton = new ToolButton("步骤");
		private var linebtn:ToolButton = new ToolButton("划线");
		private var delbtn:ToolButton = new ToolButton("删除");		
		private var startbtn:ToolButton = new ToolButton("启动");		
		private var endbtn:ToolButton = new ToolButton("结束");		
		private var joinbtn:ToolButton = new ToolButton("汇聚");		
		private var splitbtn:ToolButton = new ToolButton("分支");		
		private var jsbtn:ToolButton = new ToolButton("执行");
		private var activeLine:LineElement;
		private var activeElement:WorkflowNode;
		private var drawManager:DrawManager = DrawManager.getInstance();
		private var hasStart:Boolean = false;
		private var hasEnd:Boolean = false;
		private var startNode:StartElement;
		private var endNode:EndElement;
		private var debugWin:TextField;
		//http://opensource.adobe.com/svn/opensource/flex/sdk
		public function WorkflowStage(){
			//flash.external.ExternalInterface.call();
			
			drawButton();
			activateButton();
			stage.addEventListener(MouseEvent.CLICK,mainClick);	
			//stage.addEventListener(MouseEvent.MOUSE_UP,mainMouseUp);
		
		}
		
		
		
		protected function mainMouseUp(event:MouseEvent):void
		{
			for(var i:int=0;i<stage.numChildren;i++){
				var dg:DisplayObject = stage.getChildAt(i);
				dg.dispatchEvent(new EffectiveEvent("unfocus"));
			}
			
		}
		
		private function mainClick(event:MouseEvent):void{
			//trace(event.localX+","+event.localY);
			var dp:DisplayObject = event.target as DisplayObject;
			//把元素效果聚焦事件派发出去，以让有渲染需求的对象自己执行渲染函数
			dp.dispatchEvent(new EffectiveEvent());
			//trace(obj);
			if(dp is WorkflowNode){		 
				activeElement  = dp as WorkflowNode;
				drawManager.CurrentNode = activeElement;			  				 
			}else if(dp is Stage){				 
				for(var i:int=0;i<numChildren;i++){
					var c:DisplayObject = getChildAt(i);
					if(c is WorkflowNode)c.dispatchEvent(new EffectiveEvent(EffectiveEvent.UNFOCUS));
				}
				drawManager.reset();
			}
			
		}
		
		private function drawButton():void {
			addChild(toolbtn);
			linebtn.x = 90;
			addChild(linebtn);
			delbtn.x = 180;
			addChild(delbtn);
			addChild(startbtn);
			startbtn.x = 270;
			addChild(endbtn);
			endbtn.x = 360;
			joinbtn.x = 450;
			addChild(joinbtn);
			splitbtn.x = 540;
			addChild(splitbtn);
			jsbtn.x = 630;
			addChild(jsbtn);
			
		}
		
		private function activateButton():void {
			toolbtn.addEventListener(MouseEvent.CLICK, addStepNode);
			linebtn.addEventListener(MouseEvent.CLICK,addLineNode);
			delbtn.addEventListener(MouseEvent.CLICK,deleteElement);
			startbtn.addEventListener(MouseEvent.CLICK,addStartNode);
			endbtn.addEventListener(MouseEvent.CLICK,addEndNode);
			splitbtn.addEventListener(MouseEvent.CLICK,addSplitNode);
			joinbtn.addEventListener(MouseEvent.CLICK,addJoinNode);
			jsbtn.addEventListener(MouseEvent.CLICK,executeJs);
			
		}
		
		private function addLineNode(e:MouseEvent):void
		{	
			
			var line:LineElement = drawManager.giveLine();
			if(line!=null) {
				addChild(line);
				var evt:LineMoveEvent = new LineMoveEvent()
				evt.header = line.From.LinePoint;
				evt.tailer = line.To.LinePoint;
				line.dispatchEvent(evt);
			}	
			
		}
		private function addStartNode(e:MouseEvent):void{
			if(!hasStart){
				//画一个开始节点
				startNode = new StartElement();
				activeElement = startNode;
				addChild(startNode);			   
				hasStart=true;
			}
			
		}
		private function addEndNode(e:MouseEvent):void{
			if(!hasEnd){
				//画一个结束节点
				endNode = new EndElement();
				activeElement = endNode;
				addChild(endNode);
				hasEnd = true;
			}
		}
		
		private function addStepNode(e:MouseEvent):void {
			var tmp:StepElement = new StepElement();
			tmp.x = 300;
			tmp.y = 200;
			addChild(tmp);
		}
		
		private function addSplitNode(e:MouseEvent):void{
			var tmp:SplitElement = new SplitElement();
			tmp.x = 200;
			tmp.y = 300;
			addChild(tmp);
		}
		
		private function addJoinNode(e:MouseEvent):void{
			var tmp:JoinElement = new JoinElement();
			tmp.x = 200;
			tmp.y = 300;
			addChild(tmp);
		}
		private function executeJs(e:MouseEvent):void{
			flash.external.ExternalInterface.call("showMe");
			flash.external.ExternalInterface.addCallback("showStage",function():void{
				
				toolbtn.dispatchEvent(e);
			    
			});
		}
		
		private function showStage():void{
		    
		}	
		private function deleteElement(event:MouseEvent):void
		{
			
			if(activeElement!=null)
			{
				if(activeElement is StepNode)
				{
					var ae:StepNode = activeElement as StepNode;
					if(ae is StepElement){
						var se:StepElement = ae as StepElement;
						for each(var le:LineElement in se.Transmits)
						{
							if(le!=null){
								destoryLine(le)					
								removeChild(le);
						   
							}
						
						}
					}
					if(activeElement is StartNode){
						hasStart=false;
					}
				}
				
				if(activeElement is LineElement){
					var l:LineElement = activeElement as LineElement;
					destoryLine(l);
				}
				//trace(activeElement);
				removeChild(activeElement);
				activeElement=null;
			}
			
		}
		
		/**
		 * 删除一条线
		 * */
		private function destoryLine(line:LineElement):void{
			line.From.removeTransmit(line);
			line.To.removeTransmit(line);
			line.From=null;
			line.To=null;
		}
		
		
	}
	
}