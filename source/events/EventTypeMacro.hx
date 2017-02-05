package events;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Expr.Field;
import haxe.macro.Type;
using thx.macro.MacroFields;

class EventTypeMacro {
	public static macro function apply():Array<Field> {
		var type = Context.getLocalClass().get(),
			fields = Context.getBuildFields(),
			eventType = getEventType(fields);
		
		injectGetEventType(fields, eventType);
		return fields;
	}
	
	static function getEventType(fields:Array<Field>) {
		var field = findField(fields, "EVENT_TYPE");
		if (field == null)
			Context.error("BaseEventData requires public static inline var EVENT_TYPE", Context.currentPos());
		if (!field.isVar())
			Context.error('${className()}.EVENT_TYPE must be a var', Context.currentPos());
		
		switch (field.kind) {
			case FVar(_, e): return e;
			case _: return null;
		}
	}
	
	static function injectGetEventType(fields:Array<Field>, eventType:Expr) {
		if (fieldAlreadyExists(fields, "getEventType")) return;
		var localClass = Context.getLocalClass();
		fields.push(
		{
			name: "getEventType",
			access: [APublic, AOverride],
			pos: Context.currentPos(),
			kind: FFun({
				ret  : (macro:EventType),
				expr : macro return $eventType,
				args : []
			})
		});
	}
	
	static function fieldAlreadyExists(fields:Array<Field>, fieldName:String):Bool {
		return findField(fields, fieldName) != null;
	}
	
	static function findField(fields:Array<Field>, name:String) {
		for(field in fields)
			if(field.name == name)
				return field;
		return null;
	}
	
	inline static function className()
		return Context.getLocalClass().toString();
}