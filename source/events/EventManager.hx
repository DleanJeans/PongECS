package events;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.util.FlxArrayUtil;

typedef EventListener0 = Void->Void;
typedef EventListener1 = BaseEventData->Void;

typedef EventListenerList0 = Array<EventListener0>;
typedef EventListenerList1 = Array<EventListener1>;

typedef EventListenerMap0 = Map<EventType, EventListenerList0>;
typedef EventListenerMap1 = Map<EventType, EventListenerList1>;

typedef EventQueue = Array<Array<BaseEventData>>;

class EventManager extends FlxBasic {
	public static var NUM_QUEUES = 2;
	
	var _listenerMap0:EventListenerMap0;
	var _listenerMap1:EventListenerMap1;
	var _queues:EventQueue;
	
	var _activeQueue:Int = 0;
	
	public function new() {
		super();
		_listenerMap0 = new EventListenerMap0();
		_listenerMap1 = new EventListenerMap1();
		_queues = [[], []];
	}
	
	public function addListener0(listener:EventListener0, type:Int):Bool {
		var listenerList = _listenerMap0[type];
		
		if (listenerList == null)
			listenerList = _listenerMap0[type] = new EventListenerList0();
		return addListener(cast listener, cast listenerList);
	}
	
	function addListener(listener:Any->Void, listenerList:Array<Any>):Bool {
		if (listenerList.indexOf(listener) != -1) {
			warnAddedListener();
			return false;
		}
		
		listenerList.push(listener);
		return true;
	}
	
	inline function warnAddedListener() {
		trace("Listener is already added!", "warning");
	}
	
	public function removeListener0(listener:EventListener0, type:Int):Bool {
		var listenerList = _listenerMap0[type];
		return listenerList.remove(listener);
	}
	
	public function addListener1(listener:EventListener1, type:Int):Bool {
		var listenerList = _listenerMap1[type];
		
		if (listenerList == null)
			listenerList = _listenerMap1[type] = new EventListenerList1();
		return addListener(cast listener, cast listenerList);
	}
	
	public function removeListener1(listener:EventListener1, type:Int) {
		var listenerList = _listenerMap1[type];
		return listenerList.remove(listener);
	}
	
	public function triggerEvent(eventData:BaseEventData) {
		callListeners(eventData);
	}
	
	function callListeners(eventData:BaseEventData) {
		var listenerList0 = _listenerMap0[eventData.getEventType()];
		var listenerList1 = _listenerMap1[eventData.getEventType()];
		
		if (listenerList0 != null) {
			for (listener in listenerList0)
				listener();
		}
		
		if (listenerList1 != null) {
			for (listener in listenerList1)
				listener(eventData);
		}
	}
	
	public function queueEvent(eventData:BaseEventData):Bool {
		var listenerList0 = _listenerMap0[eventData.getEventType()];
		var listenerList1 = _listenerMap1[eventData.getEventType()];
		
		if (listenerList0 != null || listenerList1 != null) {
			_queues[_activeQueue].push(eventData);
			return true;
		}
		return false;
	}
	
	public function abortEvent(eventType:Int, allOfType:Bool = false) {
		var success = false;
		var queue = _queues[_activeQueue];
		
		for (event in queue) {
			if (event.getEventType() == eventType) {
				success = queue.remove(event);
				if (!allOfType)
					break;
			}
		}
		
		return success;
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
		
		var currentTick = FlxG.game.ticks;
		
		var queueToProcess = _queues[_activeQueue];
		_activeQueue = (_activeQueue + 1) % NUM_QUEUES;
		FlxArrayUtil.clearArray(_queues[_activeQueue]);
		
		while (queueToProcess.length > 0) {
			var eventData = queueToProcess.shift();
			
			callListeners(eventData);
		}
	}
	
}