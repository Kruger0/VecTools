
///@func Vector3([x], [y], [z])
function Vector3(_x = 0, _y = _x, _z = _x) constructor {
    x = _x;
    y = _y;
    z = _z;
    
    static __Trace = function(msg) {
        show_debug_message($"[VEC3] - {msg}");
    }
    
    static Set = function(v) {
        if (is_instanceof(v, Vector3)) {
            x = v.x; y = v.y; z = v.z;
        } else {
            x = v; y = v; z = v;
        }
        return self;
    }    
    static Negate = function() {
        x = -x; y = -y; z = -z;
        return self;
    }
    static Abs = function() {
        x = abs(x); y = abs(y); z = abs(z);
        return self;
    }
    static Equals = function(v) {
        if (is_instanceof(v, Vector3)) {
            return (x == v.x && y == v.y && z == v.z);
        } else {
            return (x == v && y == v && z == v);
        }
    }
    
    static Zero = function() {
        x = 0; y = 0; z = 0;
        return self;
    }
    static One = function() {
        x = 1; y = 1; z = 1;
        return self;
    }
    static Infinity = function() {
        x = infinity; y = infinity; z = infinity;
        return self;
    }
    
    static Add = function(v) {
        if (is_instanceof(v, Vector3)) {
            x += v.x; y += v.y; z += v.z;
        } else {
            x += v; y += v; z += v;
        }
        return self;
    }
    static Sub = function(v) {
        if (is_instanceof(v, Vector3)) {
            x -= v.x; y -= v.y; z -= v.z;
        } else {
            x -= v; y -= v; z -= v;
        }
        return self;
    }
    static Mul = function(v) {
        if (is_instanceof(v, Vector3)) {
            x *= v.x; y *= v.y; z *= v.z;
        } else {
            x *= v; y *= v; z *= v;
        }
        return self;
    }
    static Div = function(v) {
        if (is_instanceof(v, Vector3)) {
            x /= v.x; y /= v.y; z /= v.z; 
        } else {
            x /= v; y /= v; z /= v;
        }
        return self;
    }
    
    static DistTo = function(v) {
        if (is_instanceof(v, Vector3)) {
            return point_distance_3d(x, y, z, v.x, v.y, v.z);
        } else {
            return point_distance_3d(x, y, z, v, v, v);
        }
    }
    static Length = function() {
        return point_distance_3d(0, 0, 0, x, y, z);
    }
    static LengthSq = function() {
        return dot_product_3d(x, y, z, x, y, z);
    }    
    static Dot = function(v) {
        if (is_instanceof(v, Vector3)) {
            return dot_product_3d(x, y, z, v.x, v.y, v.z);
        }
        __Trace("Dot() accepts only a Vector");
        return 0;
    }
    static Cross = function(v) {
        if (is_instanceof(v, Vector3)) {
            return new Vector3(
                (y * v.z) - (v.y * z),
                (z * v.x) - (v.z * x),
                (x * v.y) - (v.x * y)
            );
        }
        __Trace("Cross() accepts only a Vector");
        return new Vector3(0);
    }
    static Normalize = function() {
        var _len = point_distance_3d(0, 0, 0, x, y, z);
        if (_len == 0) return self;
        x /= _len; y /= _len; z /= _len;
        return self;
    }
    static Orthogonalize = function(n) {
        if (!is_instanceof(n, Vector3)) {
            __Trace("Orthogonalize() accepts only a Vector3");
            return self;
        }
        var _n = n.Clone().Normalize();
        var _dot = dot_product_3d(x, y, z, _n.x, _n.y, _n.z);
        x -= _n.x * _dot; y -= _n.y * _dot; z -= _n.z * _dot;
        return Normalize();
    }
    
    static Reflect = function(v) {
        if (is_instanceof(v, Vector3)) {
            var _n = v.Clone().Normalize();
            var _dot = Dot(_n);
            Sub(_n.Mul(2 * _dot));
        } else {
            __Trace("Reflect() accepts only a Vector");
        }
        return self;
    }
    static Project = function(v) {
        if (is_instanceof(v, Vector3)) {
            var _lenSq = dot_product_3d(v.x, v.y, v.z, v.x, v.y, v.z);
            if (_lenSq == 0) {
                __Trace("Project() cannot project onto a zero vector");
                return self;
            }
            var _fac = dot_product_3d(x, y, z, v.x, v.y, v.z) / _lenSq;
            x = v.x * _fac; y = v.y * _fac; z = v.z * _fac;
        } else {
            __Trace("Project() accepts only a Vector");
        }
        return self;
    }
    
    static Clamp = function(mn, mx) {
        if (is_instanceof(mn, Vector3)) {
            x = clamp(x, mn.x, mx.x); y = clamp(y, mn.y, mx.y); z = clamp(z, mn.z, mx.z);
        } else {
            x = clamp(x, mn, mx); y = clamp(y, mn, mx); z = clamp(z, mn, mx);
        }
        return self;
    }
    static Min = function(v = undefined) {
        if (is_undefined(v)) return min(x, y, z);
        if (is_instanceof(v, Vector3)) {
            x = min(x, v.x); y = min(y, v.y); z = min(z, v.z);
        } else {
            x = min(x, v); y = min(y, v); z = min(z, v);
        }
        return self;
    }
    static Max = function(v = undefined) {
        if (is_undefined(v)) return max(x, y, z);
        if (is_instanceof(v, Vector3)) {
            x = max(x, v.x); y = max(y, v.y); z = max(z, v.z);
        } else {
            x = max(x, v); y = max(y, v); z = max(z, v);
        }
        return self;
    }
    static Floor = function() {
        x = floor(x); y = floor(y); z = floor(z);
        return self;
    }
    static Ceil = function() {
        x = ceil(x); y = ceil(y); z = ceil(z);
        return self;
    }
    static Round = function() {
        x = round(x); y = round(y); z = round(z);
        return self;
    }
    static Sign = function() {
        x = sign(x); y = sign(y); z = sign(z);
        return self;
    }
    
    static Transform = function(m) {
        static _v = array_create(4);
        matrix_transform_vertex(m, x, y, z, 1, _v);
        x = _v[0]; y = _v[1]; z = _v[2];
        return self;
    }
    static Rotate = function(axis, angle) {
        if (!is_instanceof(axis, Vector3)) {
            __Trace("Rotate() accepts only a Vector axis");
            return self;
        }
        var _cos = dcos(angle);
        var _sin = dsin(angle);
        var _dot = dot_product_3d(axis.x, axis.y, axis.z, x, y, z);
        var _cx = (axis.y * z) - (axis.z * y);
        var _cy = (axis.z * x) - (axis.x * z);
        var _cz = (axis.x * y) - (axis.y * x);
        x = x * _cos + _cx * _sin + axis.x * _dot * (1 - _cos);
        y = y * _cos + _cy * _sin + axis.y * _dot * (1 - _cos);
        z = z * _cos + _cz * _sin + axis.z * _dot * (1 - _cos);
        return self;
    }
    static Lerp = function(v, amt) {
        if (is_instanceof(v, Vector3)) {
            x = lerp(x, v.x, amt); y = lerp(y, v.y, amt); z = lerp(z, v.z, amt);
        } else {
            x = lerp(x, v, amt); y = lerp(y, v, amt); z = lerp(z, v, amt);
        }
        return self;
    }
    static Slerp = function(v, amt) {
        if (!is_instanceof(v, Vector3)) {
            __Trace("Slerp() accepts only a Vector3");
            return self;
        }
        var _lenA = Length();
        var _lenB = v.Length();
        if (_lenA == 0 || _lenB == 0) return self;
        var _nx = x / _lenA; var _ny = y / _lenA; var _nz = z / _lenA;
        var _vx = v.x / _lenB; var _vy = v.y / _lenB; var _vz = v.z / _lenB;
        var _dot = clamp(dot_product_3d(_nx, _ny, _nz, _vx, _vy, _vz), -1, 1);
        var _angle = arccos(_dot) * amt;
        var _relX = _vx - _nx * _dot;
        var _relY = _vy - _ny * _dot;
        var _relZ = _vz - _nz * _dot;
        var _relLen = point_distance_3d(0, 0, 0, _relX, _relY, _relZ);
        if (_relLen == 0) return self;
        _relX /= _relLen; _relY /= _relLen; _relZ /= _relLen;
        var _targLen = lerp(_lenA, _lenB, amt);
        var _s = sin(_angle); var _c = cos(_angle);
        x = (_nx * _c + _relX * _s) * _targLen;
        y = (_ny * _c + _relY * _s) * _targLen;
        z = (_nz * _c + _relZ * _s) * _targLen;
        return self;
    }
    static Approach = function(v, step) {
        if (is_instanceof(v, Vector3)) {
            var _dx = v.x - x; var _dy = v.y - y; var _dz = v.z - z;
            var _dist = point_distance_3d(0, 0, 0, _dx, _dy, _dz);
            if (_dist <= step || _dist == 0) {
                x = v.x; y = v.y; z = v.z;
            } else {
                x += (_dx / _dist) * step; y += (_dy / _dist) * step; z += (_dz / _dist) * step;
            }
        } else {
            __Trace("Approach() accepts only a Vector");
        }
        return self;
    }
    
    static Clone = function() {
        return new Vector3(x, y, z);
    }
    static ToString = function(format = "x: {0}, y: {1}, z: {2}") {
        return string(format, x, y, z);
    }
    static ToArray = function() {
        return [x, y, z];
    }
}
