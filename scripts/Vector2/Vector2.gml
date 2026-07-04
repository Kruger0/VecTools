
///@func Vector2([x], [y])
function Vector2(_x = 0, _y = _x) constructor {
    x = _x;
    y = _y;
    
    static __Trace = function(msg) {
        show_debug_message($"[VEC2] - {msg}");
    }
    
    static Set = function(v) {
        if (is_instanceof(v, Vector2)) {
            x = v.x; y = v.y;
        } else {
            x = v; y = v;
        }
        return self;
    }
    static Negate = function() {
        x = -x; y = -y;
        return self;
    }
    static Abs = function() {
        x = abs(x); y = abs(y);
        return self;
    }
    static Equals = function(v) {
        if (is_instanceof(v, Vector3)) {
            return (x == v.x && y == v.y);
        } else {
            return (x == v && y == v);
        }
    }
    
    static Zero = function() {
        x = 0; y = 0;
        return self;
    }
    static One = function() {
        x = 1; y = 1;
        return self;
    }
    static Infinity = function() {
        x = infinity; y = infinity;
        return self;
    }
    
    static Add = function(v) {
        if (is_instanceof(v, Vector2)) {
            x += v.x; y += v.y;
        } else {
            x += v; y += v;
        }
        return self;
    }
    static Sub = function(v) {
        if (is_instanceof(v, Vector2)) {
            x -= v.x; y -= v.y;
        } else {
            x -= v; y -= v;
        }
        return self;
    }
    static Mul = function(v) {
        if (is_instanceof(v, Vector2)) {
            x *= v.x; y *= v.y;
        } else {
            x *= v; y *= v;
        }
        return self;
    }
    static Div = function(v) {
        if (is_instanceof(v, Vector2)) {
            x /= v.x; y /= v.y;
        } else {
            x /= v; y /= v;
        }
        return self;
    }
    
    static DistTo = function(v) {
        if (is_instanceof(v, Vector2)) {
            return point_distance(x, y, v.x, v.y);
        } else {
            return point_distance(x, y, v, v);
        }
    }
    static Length = function() {
        return point_distance(0, 0, x, y);
    }
    static LengthSq = function() {
        return dot_product(x, y, x, y);
    }
    static Dot = function(v) {
        if (is_instanceof(v, Vector2)) {
            return dot_product(x, y, v.x, v.y);
        }
        __Trace("Dot() accepts only a Vector");
        return 0;
    }
    static Cross = function(v) {
        if (is_instanceof(v, Vector2)) {
            return (x * v.y) - (y * v.x);
        }
        __Trace("Cross() accepts only a Vector");
        return 0;
    }
    static Normalize = function() {
        var _len = point_distance(0, 0, x, y);
        if (_len == 0) return self;
        x /= _len; y /= _len;
        return self;
    }
    
    static Reflect = function(v) {
        if (is_instanceof(v, Vector2)) {
            var _n = v.Clone().Normalize();
            var _dot = Dot(_n);
            Sub(_n.Mul(2 * _dot));
        } else {
            __Trace("Reflect() accepts only a Vector");
        }
        return self;
    }
    static Project = function(v) {
        if (is_instanceof(v, Vector2)) {
            var _lenSq = dot_product(v.x, v.y, v.x, v.y);
            if (_lenSq == 0) {
                __Trace("Project() cannot project onto a zero vector");
                return self;
            }
            var _fac = dot_product(x, y, v.x, v.y) / _lenSq;
            x = v.x * _fac; y = v.y * _fac;
        } else {
            __Trace("Project() accepts only a Vector");
        }
        return self;
    }
    
    static Clamp = function(mn, mx) {
        if (is_instanceof(mn, Vector2)) {
            x = clamp(x, mn.x, mx.x); y = clamp(y, mn.y, mx.y);
        } else {
            x = clamp(x, mn, mx); y = clamp(y, mn, mx);
        }
        return self;
    }
    static Min = function(v = undefined) {
        if (is_undefined(v)) return min(x, y);
        if (is_instanceof(v, Vector2)) {
            x = min(x, v.x); y = min(y, v.y);
        } else {
            x = min(x, v); y = min(y, v);
        }
        return self;
    }
    static Max = function(v = undefined) {
        if (is_undefined(v)) return max(x, y);
        if (is_instanceof(v, Vector2)) {
            x = max(x, v.x); y = max(y, v.y);
        } else {
            x = max(x, v); y = max(y, v);
        }
        return self;
    }
    static Floor = function() {
        x = floor(x); y = floor(y);
        return self;
    }
    static Ceil = function() {
        x = ceil(x); y = ceil(y);
        return self;
    }
    static Round = function() {
        x = round(x); y = round(y);
        return self;
    }
    static Sign = function() {
        x = sign(x); y = sign(y);
        return self;
    }
    
    static Transform = function(m) {
        static _v = array_create(4);
        matrix_transform_vertex(m, x, y, 0, 1, _v);
        x = _v[0]; y = _v[1];
        return self;
    }
    static Rotate = function(angle) {
        var _cos = dcos(angle);
        var _sin = dsin(angle);
        var _x = x * _cos - y * _sin;
        var _y = x * _sin + y * _cos;
        x = _x; y = _y;
        return self;
    }
    static Lerp = function(v, amt) {
        if (is_instanceof(v, Vector2)) {
            x = lerp(x, v.x, amt); y = lerp(y, v.y, amt);
        } else {
            x = lerp(x, v, amt); y = lerp(y, v, amt);
        }
        return self;
    }
    static Slerp = function(v, amt) {
        if (!is_instanceof(v, Vector2)) {
            __Trace("Slerp() accepts only a Vector");
            return self;
        }
        var _lenA = Length();
        var _lenB = v.Length();
        if (_lenA == 0 || _lenB == 0) return self;
        var _nx = x / _lenA; var _ny = y / _lenA;
        var _vx = v.x / _lenB; var _vy = v.y / _lenB;
        var _dot = clamp(dot_product(_nx, _ny, _vx, _vy), -1, 1);
        var _angle = arccos(_dot) * amt;
        var _relX = _vx - _nx * _dot;
        var _relY = _vy - _ny * _dot;
        var _relLen = point_distance(0, 0, _relX, _relY);
        if (_relLen == 0) return self;
        _relX /= _relLen; _relY /= _relLen;
        var _targLen = lerp(_lenA, _lenB, amt);
        var _s = sin(_angle); var _c = cos(_angle);
        x = (_nx * _c + _relX * _s) * _targLen;
        y = (_ny * _c + _relY * _s) * _targLen;
        return self;
    }
    static Approach = function(v, step) {
        if (is_instanceof(v, Vector2)) {
            var _dx = v.x - x;
            var _dy = v.y - y;
            var _dist = point_distance(0, 0, _dx, _dy);
            if (_dist <= step || _dist == 0) {
                x = v.x; y = v.y;
            } else {
                x += (_dx / _dist) * step; y += (_dy / _dist) * step;
            }
        } else {
            __Trace("Approach() accepts only a Vector");
        }
        return self;
    }
    
    static AngleTo = function(v) {
        if (is_instanceof(v, Vector2)) {
            return point_direction(x, y, v.x, v.y);
        }
        __Trace("AngleTo() accepts only a Vector");
        return 0;
    }
    static Angle = function() {
        return point_direction(0, 0, x, y);
    }
    static Perpendicular = function() {
        return new Vector2(-y, x);
    }
    static FromPolar = function(angle, length = 1) {
        x = lengthdir_x(length, angle);
        y = lengthdir_y(length, angle);
        return self;
    }
    
    static Clone = function() {
        return new Vector2(x, y);
    }
    static ToString = function(format = "x: {0}, y: {1}") {
        return string(format, x, y);
    }
    static ToArray = function() {
        return [x, y];
    }
}
