package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class Design_8_8_BehaviorInspector extends SceneScript
{
	public var _BackgoundOpacity:Float;
	public var _BackgroundColor:Int;
	public var _BorderColor:Int;
	public var _Font:Font;
	public var _Activated:Bool;
	public var _Height:Float;
	public var _X:Float;
	public var _Y:Float;
	public var _Width:Float;
	public var _Mode:String;
	public var _Behavior:String;
	public var _Row:Float;
	public var _MaxBehaviorWidth:Float;
	public var _Item:Float;
	public var _MaxAttributeWidth:Float;
	public var _BehaviorList:Array<Dynamic>;
	public var _AttributeList:Array<Dynamic>;
	public var _MaxValueWidth:Float;
	public var _Actor:Actor;
	public var _FontOpacity:Float;
	public var _Value:String;
	public var _ToggleControl:String;
	public var _Hidden:Bool;
	public var _Offset:Float;
	public var _Index:Float;
	public var _Start:Float;
	public var _End:Float;
	public var _MaxOffset:Float;
	public var _InspectWidth:Float;
	public var _ActorWidth:Float;
	public var _SceneWidth:Float;
	public var _CharWidth:Float;
	public var _SelectedActorWidth:Float;
	public var _Name:String;
	public var _GameWidth:Float;
	public var _ActorList:Array<Dynamic>;
	public var _MaxActorWidth:Float;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Backgound Opacity", "_BackgoundOpacity");
		_BackgoundOpacity = 80.0;
		nameMap.set("Background Color", "_BackgroundColor");
		_BackgroundColor = Utils.getColorRGB(51,51,51);
		nameMap.set("Border Color", "_BorderColor");
		_BorderColor = Utils.getColorRGB(204,255,204);
		nameMap.set("Font", "_Font");
		nameMap.set("Activated", "_Activated");
		_Activated = false;
		nameMap.set("Height", "_Height");
		_Height = 0.0;
		nameMap.set("X", "_X");
		_X = 0.0;
		nameMap.set("Y", "_Y");
		_Y = 0.0;
		nameMap.set("Width", "_Width");
		_Width = 0.0;
		nameMap.set("Mode", "_Mode");
		_Mode = "";
		nameMap.set("Behavior", "_Behavior");
		_Behavior = "";
		nameMap.set("Row", "_Row");
		_Row = 0.0;
		nameMap.set("Max Behavior Width", "_MaxBehaviorWidth");
		_MaxBehaviorWidth = 0.0;
		nameMap.set("Item", "_Item");
		_Item = 0.0;
		nameMap.set("Max Attribute Width", "_MaxAttributeWidth");
		_MaxAttributeWidth = 0.0;
		nameMap.set("Behavior List", "_BehaviorList");
		nameMap.set("Attribute List", "_AttributeList");
		nameMap.set("Max Value Width", "_MaxValueWidth");
		_MaxValueWidth = 0.0;
		nameMap.set("Actor", "_Actor");
		nameMap.set("Font Opacity", "_FontOpacity");
		_FontOpacity = 40.0;
		nameMap.set("Value", "_Value");
		_Value = "";
		nameMap.set("Toggle Control", "_ToggleControl");
		nameMap.set("Hidden", "_Hidden");
		_Hidden = false;
		nameMap.set("Offset", "_Offset");
		_Offset = 0.0;
		nameMap.set("Index", "_Index");
		_Index = 0.0;
		nameMap.set("Start", "_Start");
		_Start = 0.0;
		nameMap.set("End", "_End");
		_End = 0.0;
		nameMap.set("Max Offset", "_MaxOffset");
		_MaxOffset = 0.0;
		nameMap.set("Inspect Width", "_InspectWidth");
		_InspectWidth = 0.0;
		nameMap.set("Actor Width", "_ActorWidth");
		_ActorWidth = 0.0;
		nameMap.set("Scene Width", "_SceneWidth");
		_SceneWidth = 0.0;
		nameMap.set("Char Width", "_CharWidth");
		_CharWidth = 0.0;
		nameMap.set("Selected Actor Width", "_SelectedActorWidth");
		_SelectedActorWidth = 0.0;
		nameMap.set("Name", "_Name");
		_Name = "";
		nameMap.set("Game Width", "_GameWidth");
		_GameWidth = 0.0;
		nameMap.set("Actor List", "_ActorList");
		nameMap.set("Max Actor Width", "_MaxActorWidth");
		_MaxActorWidth = 0.0;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		_ActorList = new Array<Dynamic>();
		propertyChanged("_ActorList", _ActorList);
		
		/* =========================== Keyboard =========================== */
		addKeyStateListener(_ToggleControl, function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && pressed)
			{
				_Hidden = !(_Hidden);
				propertyChanged("_Hidden", _Hidden);
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(!(_Hidden))
				{
					if((hasValue(_Font)))
					{
						g.setFont(_Font);
					}
					g.fillColor = _BackgroundColor;
					g.strokeColor = _BorderColor;
					g.strokeSize = Std.int(1);
					_X = asNumber(0);
					propertyChanged("_X", _X);
					_Y = asNumber(0);
					propertyChanged("_Y", _Y);
					_InspectWidth = asNumber(g.font.font.getTextWidth("Inspect")/Engine.SCALE);
					propertyChanged("_InspectWidth", _InspectWidth);
					_CharWidth = asNumber(g.font.font.getTextWidth("W")/Engine.SCALE);
					propertyChanged("_CharWidth", _CharWidth);
					_Width = asNumber(_InspectWidth);
					propertyChanged("_Width", _Width);
					_Height = asNumber(g.font.getHeight()/Engine.SCALE);
					propertyChanged("_Height", _Height);
					g.alpha = (_BackgoundOpacity/100);
					g.fillRect(0, 0, _Width, _Height);
					if(_Activated)
					{
						g.alpha = (100/100);
					}
					else
					{
						g.alpha = (_FontOpacity/100);
					}
					g.drawString("" + "Inspect", 0, 0);
					if(_Activated)
					{
						_X = asNumber(0);
						propertyChanged("_X", _X);
						_Y = asNumber(_Height);
						propertyChanged("_Y", _Y);
						_ActorWidth = asNumber(g.font.font.getTextWidth("Actor")/Engine.SCALE);
						propertyChanged("_ActorWidth", _ActorWidth);
						_Width = asNumber(_ActorWidth);
						propertyChanged("_Width", _Width);
						g.alpha = (_BackgoundOpacity/100);
						g.fillRect(_X, _Y, _Width, _Height);
						if((_Mode == "Actor"))
						{
							g.alpha = (100/100);
						}
						else
						{
							g.alpha = (_FontOpacity/100);
						}
						g.drawString("" + "Actor", _X, _Y);
						_X = asNumber(_ActorWidth);
						propertyChanged("_X", _X);
						_SceneWidth = asNumber(g.font.font.getTextWidth("Scene")/Engine.SCALE);
						propertyChanged("_SceneWidth", _SceneWidth);
						_Width = asNumber(_SceneWidth);
						propertyChanged("_Width", _Width);
						g.alpha = (_BackgoundOpacity/100);
						g.fillRect(_X, _Y, _Width, _Height);
						if((_Mode == "Scene"))
						{
							g.alpha = (100/100);
						}
						else
						{
							g.alpha = (_FontOpacity/100);
						}
						g.drawString("" + "Scene", _X, _Y);
						_X = asNumber((_ActorWidth + _SceneWidth));
						propertyChanged("_X", _X);
						_GameWidth = asNumber(g.font.font.getTextWidth("Game")/Engine.SCALE);
						propertyChanged("_GameWidth", _GameWidth);
						_Width = asNumber(_GameWidth);
						propertyChanged("_Width", _Width);
						g.alpha = (_BackgoundOpacity/100);
						g.fillRect(_X, _Y, _Width, _Height);
						if((_Mode == "Game"))
						{
							g.alpha = (100/100);
						}
						else
						{
							g.alpha = (_FontOpacity/100);
						}
						g.drawString("" + "Game", _X, _Y);
						if((_Mode == "Actor"))
						{
							_X = asNumber(0);
							propertyChanged("_X", _X);
							_Y = asNumber((2 * _Height));
							propertyChanged("_Y", _Y);
							if((hasValue(_Actor)))
							{
								_SelectedActorWidth = asNumber(g.font.font.getTextWidth(("" + _Actor))/Engine.SCALE);
								propertyChanged("_SelectedActorWidth", _SelectedActorWidth);
								_Width = asNumber(_SelectedActorWidth);
								propertyChanged("_Width", _Width);
								g.alpha = (_BackgoundOpacity/100);
								g.fillRect(_X, _Y, _Width, _Height);
								g.alpha = (100/100);
								g.drawString("" + ("" + _Actor), _X, _Y);
							}
							else
							{
								_Width = asNumber(g.font.font.getTextWidth("<Choose an Actor>")/Engine.SCALE);
								propertyChanged("_Width", _Width);
								g.alpha = (_BackgoundOpacity/100);
								g.fillRect(_X, _Y, _Width, _Height);
								g.alpha = (_FontOpacity/100);
								g.drawString("" + "<Choose an Actor>", _X, _Y);
								if(!((_ActorList.length == 0)))
								{
									_Y = asNumber((_Y + _Height));
									propertyChanged("_Y", _Y);
									_MaxActorWidth = asNumber(0);
									propertyChanged("_MaxActorWidth", _MaxActorWidth);
									for(item in cast(_ActorList, Array<Dynamic>))
									{
										_MaxActorWidth = asNumber(Math.max(_MaxActorWidth, g.font.font.getTextWidth((("" + " ") + ("" + item)))/Engine.SCALE));
										propertyChanged("_MaxActorWidth", _MaxActorWidth);
									}
									_Width = asNumber(_MaxActorWidth);
									propertyChanged("_Width", _Width);
									for(item in cast(_ActorList, Array<Dynamic>))
									{
										g.alpha = (_BackgoundOpacity/100);
										g.fillRect(_X, _Y, _Width, _Height);
										g.alpha = (_FontOpacity/100);
										g.drawString("" + (("" + " ") + ("" + item)), _X, _Y);
										_Y = asNumber((_Y + _Height));
										propertyChanged("_Y", _Y);
									}
								}
							}
						}
						var behavior:Dynamic = null;
						if(((_Mode == "Scene") || ((_Mode == "Actor") && (hasValue(_Actor)))))
						{
							_X = asNumber(0);
							propertyChanged("_X", _X);
							_Y = asNumber((_Y + _Height));
							propertyChanged("_Y", _Y);
							if((_Mode == "Scene"))
							{
								_BehaviorList = Engine.engine.behaviors.behaviors;
								propertyChanged("_BehaviorList", _BehaviorList);
							}
							else
							{
								_BehaviorList = _Actor.behaviors.behaviors;
								propertyChanged("_BehaviorList", _BehaviorList);
							}
							_MaxBehaviorWidth = asNumber(0);
							propertyChanged("_MaxBehaviorWidth", _MaxBehaviorWidth);
							for(item in cast(_BehaviorList, Array<Dynamic>))
							{
								_MaxBehaviorWidth = asNumber(Math.max(_MaxBehaviorWidth, g.font.font.getTextWidth((("" + " ") + ("" + item.name)))/Engine.SCALE));
								propertyChanged("_MaxBehaviorWidth", _MaxBehaviorWidth);
							}
							_Width = asNumber(_MaxBehaviorWidth);
							propertyChanged("_Width", _Width);
							if(("" + _Behavior) == (""))
							{
								for(item in cast(_BehaviorList, Array<Dynamic>))
								{
									g.alpha = (_BackgoundOpacity/100);
									g.fillRect(_X, _Y, _Width, _Height);
									g.alpha = (_FontOpacity/100);
									g.drawString("" + (("" + " ") + ("" + item.name)), _X, _Y);
									_Y = asNumber((_Y + _Height));
									propertyChanged("_Y", _Y);
								}
							}
							else
							{
								g.alpha = (_BackgoundOpacity/100);
								g.fillRect(_X, _Y, _Width, _Height);
								g.alpha = (100/100);
								g.drawString("" + (("" + " ") + ("" + _Behavior)), _X, _Y);
								for(item in cast(_BehaviorList, Array<Dynamic>))
								{
									if((_Behavior == item.name))
									{
										behavior = item;
										break;
									}
								}
							}
						}
						if(((_Mode == "Game") || (!(("" + _Behavior) == ("")) && ((_Mode == "Scene") || ((_Mode == "Actor") && (hasValue(_Actor)))))))
						{
							if((_Mode == "Game"))
							{
								_AttributeList = new Array<Dynamic>();
								propertyChanged("_AttributeList", _AttributeList);
								for (item in Engine.engine.gameAttributes.keys()) {
								_AttributeList.push(item);
								}
								_AttributeList.sort(function(a,b) return Reflect.compare(a.toLowerCase(), b.toLowerCase()));
							}
							else
							{
								_AttributeList = Lambda.array(behavior.attributes);
								propertyChanged("_AttributeList", _AttributeList);
								_AttributeList.sort(function(a,b) return Reflect.compare(a.fullName.toLowerCase(), b.fullName.toLowerCase()));
							}
							_MaxAttributeWidth = asNumber(0);
							propertyChanged("_MaxAttributeWidth", _MaxAttributeWidth);
							_MaxValueWidth = asNumber(0);
							propertyChanged("_MaxValueWidth", _MaxValueWidth);
							for(item in cast(_AttributeList, Array<Dynamic>))
							{
								if((_Mode == "Game"))
								{
									_Name = item;
									propertyChanged("_Name", _Name);
								}
								else
								{
									_Name = item.fullName;
									propertyChanged("_Name", _Name);
								}
								_MaxAttributeWidth = asNumber(Math.max(_MaxAttributeWidth, g.font.font.getTextWidth((("" + "  ") + ("" + _Name)))/Engine.SCALE));
								propertyChanged("_MaxAttributeWidth", _MaxAttributeWidth);
								if((_Mode == "Scene"))
								{
									_Value = getValueForScene(_Behavior, item.fieldName);
									propertyChanged("_Value", _Value);
								}
								else if((_Mode == "Actor"))
								{
									_Value = _Actor.getValue(_Behavior, item.fieldName);
									propertyChanged("_Value", _Value);
								}
								else
								{
									_Value = (getGameAttribute(item));
									propertyChanged("_Value", _Value);
								}
								_MaxValueWidth = asNumber(Math.max(_MaxValueWidth, g.font.font.getTextWidth((("" + " = ") + ("" + _Value)))/Engine.SCALE));
								propertyChanged("_MaxValueWidth", _MaxValueWidth);
							}
							_X = asNumber(0);
							propertyChanged("_X", _X);
							_Y = asNumber((_Y + _Height));
							propertyChanged("_Y", _Y);
							if((_AttributeList.length == 0))
							{
								_Width = asNumber(g.font.font.getTextWidth("  <No Attributes>")/Engine.SCALE);
								propertyChanged("_Width", _Width);
								g.alpha = (_BackgoundOpacity/100);
								g.fillRect(_X, _Y, _Width, _Height);
								g.alpha = (_FontOpacity/100);
								g.drawString("" + "  <No Attributes>", _X, _Y);
							}
							else
							{
								_Width = asNumber((_MaxAttributeWidth + _MaxValueWidth));
								propertyChanged("_Width", _Width);
								_Index = asNumber(0);
								propertyChanged("_Index", _Index);
								for(item in cast(_AttributeList, Array<Dynamic>))
								{
									_Index = asNumber((_Index + 1));
									propertyChanged("_Index", _Index);
									if((_Index <= _Offset))
									{
										continue;
									}
									if(((_Y + _Height) > getScreenHeight()))
									{
										break;
									}
									if((_Mode == "Game"))
									{
										_Name = item;
										propertyChanged("_Name", _Name);
									}
									else
									{
										_Name = item.fullName;
										propertyChanged("_Name", _Name);
									}
									g.alpha = (_BackgoundOpacity/100);
									g.fillRect(_X, _Y, _Width, _Height);
									g.alpha = (_FontOpacity/100);
									g.drawString("" + (("" + "  ") + ("" + _Name)), _X, _Y);
									_X = asNumber(_MaxAttributeWidth);
									propertyChanged("_X", _X);
									if((_Mode == "Scene"))
									{
										_Value = getValueForScene(_Behavior, item.fieldName);
										propertyChanged("_Value", _Value);
									}
									else if((_Mode == "Actor"))
									{
										_Value = _Actor.getValue(_Behavior, item.fieldName);
										propertyChanged("_Value", _Value);
									}
									else
									{
										_Value = (getGameAttribute(item));
										propertyChanged("_Value", _Value);
									}
									g.drawString("" + (("" + " = ") + ("" + _Value)), _X, _Y);
									_X = asNumber(0);
									propertyChanged("_X", _X);
									_Y = asNumber((_Y + _Height));
									propertyChanged("_Y", _Y);
								}
							}
							if((_Mode == "Scene"))
							{
								_Start = asNumber(3);
								propertyChanged("_Start", _Start);
							}
							else if((_Mode == "Actor"))
							{
								_Start = asNumber(4);
								propertyChanged("_Start", _Start);
							}
							else
							{
								_Start = asNumber(2);
								propertyChanged("_Start", _Start);
							}
							_End = asNumber((Math.floor((getScreenHeight() / _Height)) - 1));
							propertyChanged("_End", _End);
							_MaxOffset = asNumber(((_AttributeList.length - (_End - _Start)) - 1));
							propertyChanged("_MaxOffset", _MaxOffset);
							if((((_Start + _AttributeList.length) * _Height) > getScreenHeight()))
							{
								_X = asNumber(0);
								propertyChanged("_X", _X);
								g.alpha = (100/100);
								if((_Offset > 0))
								{
									_Y = asNumber((_Start * _Height));
									propertyChanged("_Y", _Y);
									_Width = asNumber(g.font.font.getTextWidth("^")/Engine.SCALE);
									propertyChanged("_Width", _Width);
									g.drawRect(_X, _Y, _Width, _Height);
									g.drawString("" + "^", _X, _Y);
								}
								if((_Offset < _MaxOffset))
								{
									_Y = asNumber((_End * _Height));
									propertyChanged("_Y", _Y);
									_Width = asNumber(g.font.font.getTextWidth("v")/Engine.SCALE);
									propertyChanged("_Width", _Width);
									g.drawRect(_X, _Y, _Width, _Height);
									g.drawString("" + "v", _X, _Y);
								}
							}
						}
					}
				}
			}
		});
		
		/* ============================ Click ============================= */
		addMousePressedListener(function(list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(!(_Hidden))
				{
					_Row = asNumber(Math.floor((getMouseY() / _Height)));
					propertyChanged("_Row", _Row);
					if(((_Row == 0) && (getMouseX() < _InspectWidth)))
					{
						_Activated = !(_Activated);
						propertyChanged("_Activated", _Activated);
						if(!(_Activated))
						{
							_Mode = "";
							propertyChanged("_Mode", _Mode);
							_Behavior = "";
							propertyChanged("_Behavior", _Behavior);
							_Actor = getDefaultValue(_Actor);
							_Offset = asNumber(0);
							propertyChanged("_Offset", _Offset);
						}
					}
					else if(_Activated)
					{
						if((_Row == 1))
						{
							if(((getMouseX() < _ActorWidth) && !(((_Mode == "Actor") && ((!hasValue(_Actor)) && (_ActorList.length == 0))))))
							{
								_Mode = "Actor";
								propertyChanged("_Mode", _Mode);
								Utils.clear(_ActorList);
								_Actor = getDefaultValue(_Actor);
								_Behavior = "";
								propertyChanged("_Behavior", _Behavior);
								_Offset = asNumber(0);
								propertyChanged("_Offset", _Offset);
								return;
							}
							else if(((getMouseX() >= _ActorWidth) && (getMouseX() < (_ActorWidth + _SceneWidth))))
							{
								_Mode = "Scene";
								propertyChanged("_Mode", _Mode);
								Utils.clear(_ActorList);
								_Actor = getDefaultValue(_Actor);
								_Behavior = "";
								propertyChanged("_Behavior", _Behavior);
								_Offset = asNumber(0);
								propertyChanged("_Offset", _Offset);
								return;
							}
							else if(((getMouseX() >= (_ActorWidth + _SceneWidth)) && (getMouseX() < ((_ActorWidth + _SceneWidth) + _GameWidth))))
							{
								_Mode = "Game";
								propertyChanged("_Mode", _Mode);
								Utils.clear(_ActorList);
								_Actor = getDefaultValue(_Actor);
								_Behavior = "";
								propertyChanged("_Behavior", _Behavior);
								_Offset = asNumber(0);
								propertyChanged("_Offset", _Offset);
								return;
							}
						}
						if(((_Mode == "Scene") || ((_Mode == "Actor") && (hasValue(_Actor)))))
						{
							if(("" + _Behavior) == (""))
							{
								if((_Mode == "Scene"))
								{
									_Item = asNumber((_Row - 2));
									propertyChanged("_Item", _Item);
								}
								else
								{
									_Item = asNumber((_Row - 3));
									propertyChanged("_Item", _Item);
								}
								if((((_Item >= 0) && (_Item < _BehaviorList.length)) && (getMouseX() < _MaxBehaviorWidth)))
								{
									_Behavior = _BehaviorList[Std.int(_Item)].name;
									propertyChanged("_Behavior", _Behavior);
								}
							}
							else
							{
								if(((((_Mode == "Scene") && (_Row == 2)) || ((_Mode == "Actor") && (_Row == 3))) && (getMouseX() < _Font.font.getTextWidth(_Behavior)/Engine.SCALE)))
								{
									_Behavior = "";
									propertyChanged("_Behavior", _Behavior);
									_Offset = asNumber(0);
									propertyChanged("_Offset", _Offset);
								}
							}
						}
						if(((_Mode == "Game") || (!(("" + _Behavior) == ("")) && ((_Mode == "Scene") || ((_Mode == "Actor") && (hasValue(_Actor)))))))
						{
							if(((_Row == _Start) && (getMouseX() < _CharWidth)))
							{
								_Offset = asNumber(Math.max(0, (_Offset - 1)));
								propertyChanged("_Offset", _Offset);
							}
							else if(((_Row == _End) && (getMouseX() < _CharWidth)))
							{
								_Offset = asNumber(Math.min(_MaxOffset, (_Offset + 1)));
								propertyChanged("_Offset", _Offset);
							}
						}
						if((_Mode == "Actor"))
						{
							if((!hasValue(_Actor)))
							{
								if((_ActorList.length == 0))
								{
									Utils.clear(_ActorList);
									engine.allActors.reuseIterator = false;
									for(actorOnScreen in engine.allActors)
									{
										if(actorOnScreen != null && !actorOnScreen.dead && !actorOnScreen.recycled && actorOnScreen.isOnScreenCache)
										{
											if(actorOnScreen.isMouseOver())
											{
												_ActorList.push(actorOnScreen);
											}
										}
									}
									engine.allActors.reuseIterator = true;
									if((_ActorList.length == 1))
									{
										_Actor = _ActorList[Std.int(0)];
										propertyChanged("_Actor", _Actor);
									}
								}
								else
								{
									_Item = asNumber((_Row - 3));
									propertyChanged("_Item", _Item);
									if((((_Item >= 0) && (_Item < _ActorList.length)) && (getMouseX() < _MaxActorWidth)))
									{
										_Actor = _ActorList[Std.int(_Item)];
										propertyChanged("_Actor", _Actor);
									}
								}
							}
							else if(((_Row == 2) && (getMouseX() < _SelectedActorWidth)))
							{
								Utils.clear(_ActorList);
								_Actor = getDefaultValue(_Actor);
								_Behavior = "";
								propertyChanged("_Behavior", _Behavior);
								_Offset = asNumber(0);
								propertyChanged("_Offset", _Offset);
							}
						}
					}
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}