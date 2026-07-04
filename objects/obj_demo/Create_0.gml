
var _v1 = new Vector3(1, 0) 
var _v2 = new Vector3(0, 1) 
show_debug_message(_v1.Slerp(_v2, 1).ToString())

var _v1 = new Vector2(1, -1) 
var _v2 = new Vector2(0, 1) 
show_debug_message(_v1.Reflect(_v2).ToString())