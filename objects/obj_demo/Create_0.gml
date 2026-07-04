

veca = new Vector3(4, -2, 5) 
vecb = new Vector3()
//vecc = Vector3.Reflect(veca, vecb)
//veca.Reflect(vecb)

////show_message(vecc.ToString())
//show_message(veca.ToString())
//show_message(vecb.ToString())
vecc = new Vector3(40, 1, 300)
vecd = Vector3.Clamp(vecc, new Vector3(4, 4, 4), new Vector3(100, 100, 100))
//show_message(vecc.Clamp(5, 100).ToString())
show_message(vecd.ToString())


var _t = get_timer()
repeat(100000) {
    //var _mag = veca.DistanceTo(vecb)
    var _mag = Vector3.DistanceTo(veca, vecb)
    //var _mag = Vector3.DistanceToSq(veca, vecb)
    //var _mag = Vector3.Reflect(veca, vecb)
}

show_message($"Result: {power(_mag, 2)} - took {(get_timer()-_t)/1000}ms")

//_t = get_timer()
//repeat(1000000) {
//    var _mag = point_distance_3d(0, 0, 0, _x, _y, _z)
//}

//show_message($"Mag raw: {_mag}, took {(get_timer()-_t)/1000}ms")


vec1 = new Vector3(3, 4, 2)
vec2 = new Vector3(1, 2, 5)

vec3 = Vector3.Multiply(vec1, 2)
//vec1.Add(vec2)



show_message(vec1.ToString())
show_message(vec3.ToString())

game_end()
/*
Vec3 = function(_x, _y, _z) constructor {
    x = _x;
    y = _y;
    z = _z;
    ///@func Add(v)
    static Add = function(v) {
        x += v.x;
        y += v.y;
        z += v.z;
    }
    static toString = function() {
        return $"Vector3({x}, {y}, {z})";
    }
};
///@func Add(a, b)
Vec3.Add = function(a, b) {
    return new Vec3(a.x + b.x, a.y + b.y, a.z + b.z);
}