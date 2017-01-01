package managers;

import components.Goal;
import edge.Entity;
import flixel.FlxSprite;
import flixel.util.FlxSignal;
import managers.GameSignals.Signal0;

typedef Signal0 = FlxSignal;
typedef Signal1<T:Dynamic> = FlxTypedSignal<T->Void>;
typedef Signal2<T1:Dynamic, T2:Dynamic> = FlxTypedSignal<T1->T2->Void>;

typedef SignalSprite1 = Signal1<FlxSprite>;
typedef SignalSprite2 = Signal2<FlxSprite, FlxSprite>;

class GameSignals {
	public var ball_ball		:SignalSprite2 	= new SignalSprite2();
	public var ball_ball_0		:Signal0 		= new Signal0();
	
	public var ball_wall		:SignalSprite2 	= new SignalSprite2();
	public var ball_wall_0		:Signal0 		= new Signal0();
	
	public var ball_paddle		:SignalSprite2 	= new SignalSprite2();
	public var ball_paddle_0	:Signal0 		= new Signal0();
	
	public var goal				:Signal1<Goal> 	= new Signal1<Goal>();
	public var goal_0			:Signal0 		= new Signal0();
	public var goal_ball		:SignalSprite1 	= new SignalSprite1();
	
	public var won				:Signal1<Entity> = new Signal1<Entity>();
	public var won_0			:Signal0 		= new Signal0();
	
	public var menuDemoMode		:Signal0		= new Signal0();
	public var onePlayerMode	:Signal0		= new Signal0();
	public var twoPlayerMode	:Signal0		= new Signal0();
	public var splitScreen		:Signal0		= new Signal0();
	public var splitScreenOff	:Signal0		= new Signal0();
	
	public function new() {}
	
}