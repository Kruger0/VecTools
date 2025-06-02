

function Vector3(x, y, z) constructor {
    self.x = x ?? 0;
    self.y = y ?? self.x;
    self.z = z ?? self.x;
    xstart = self.x;
    ystart = self.y;
    zstart = self.z;
    
    static Set = function() {
        if (is_numeric(argument[0])) {
            x = argument[0];
            y = argument[1] ?? argument[0];
            z = argument[2] ?? argument[0];
        } else {
            x = argument[0].x;
            y = argument[0].y;
            z = argument[0].z;
        }
        return self;
    }    
    static Reset = function() {
        x = xstart;
        y = ystart;
        z = zstart;
        return self;
    }
    static GetStart = function() {
        return new Vector3(xstart, ystart, zstart);
    }
    static Negate = function() {
        if (is_instanceof(self, Vector3)) {
            x = -x;
            y = -y;
            z = -z;
            return self;
        } else {
            return new Vector3(-argument[0].x, -argument[0].y, -argument[0].z);
        }
    }
    static Abs = function() {
        if (is_instanceof(self, Vector3)) {
            x = abs(x);
            y = abs(y);
            z = abs(z);
            return self;
        } else {
            return new Vector3(
                abs(argument[0].x), 
                abs(argument[0].y), 
                abs(argument[0].z)
            )
        }
    }
    static Equals = function() {
        if (is_instanceof(self, Vector3)) {
            return (x == argument[0].x && y == argument[0].y && z == argument[0].z);
        } else {
            return (argument[0].x == argument[1].x && argument[0].y == argument[1].y && argument[0].z == argument[1].z);
        }
    }
    
    static Zero = function() {
        if (is_instanceof(self, Vector3)) {
            x = 0;
            y = 0;
            z = 0;
            return self;
        } else {
            return new Vector3(0, 0, 0);
        }        
    }
    static One = function() {
        if (is_instanceof(self, Vector3)) {
            x = 1;
            y = 1;
            z = 1;
            return self;
        } else {
            return new Vector3(1, 1, 1);
        }
    }
    static Infinity = function() {
        if (is_instanceof(self, Vector3)) {
            x = infinity;
            y = infinity;
            z = infinity;
            return self;
        } else {
            return new Vector3(infinity, infinity, infinity);
        }
    }
    static NegativeInfinity = function() {
        if (is_instanceof(self, Vector3)) {
            x = -infinity;
            y = -infinity;
            z = -infinity;
            return self;
        } else {
            return new Vector3(-infinity, -infinity, -infinity);
        }
    }
    
    static Add = function() {
        if (is_instanceof(self, Vector3)) {
            x += argument[0].x;
            y += argument[0].y;
            z += argument[0].z;
            return self;
        } else {
            return new Vector3(
                argument[0].x + argument[1].x, 
                argument[0].y + argument[1].y, 
                argument[0].z + argument[1].z
            )
        }
    }
    static Subtract = function() {
        if (is_instanceof(self, Vector3)) {
            x -= argument[0].x;
            y -= argument[0].y;
            z -= argument[0].z;
            return self
        } else {
            return new Vector3(
                argument[0].x - argument[1].x, 
                argument[0].y - argument[1].y, 
                argument[0].z - argument[1].z
            )
        }
    }    
    static Multiply = function() {
        if (is_instanceof(self, Vector3)) {
            if (is_numeric(argument[0])) {
                x *= argument[0];
                y *= argument[0];
                z *= argument[0];
            } else {
                x *= argument[0].x;
                y *= argument[0].y;
                z *= argument[0].z;
            }
            return self
        } else {
            if (is_numeric(argument[1])) {
                return new Vector3(
                    argument[0].x * argument[1], 
                    argument[0].y * argument[1], 
                    argument[0].z * argument[1]
                )
            } else {
                return new Vector3(
                    argument[0].x * argument[1].x, 
                    argument[0].y * argument[1].y, 
                    argument[0].z * argument[1].z
                )
            }
        }
    }    
    static Divide = function() {
        if (is_instanceof(self, Vector3)) {
            if (is_numeric(argument[0])) {
                if (argument[0] == 0) return Zero();
                x /= argument[0];
                y /= argument[0];
                z /= argument[0];
            } else {
                x = (argument[0].x == 0 ? 0 : x / argument[0].x);
                y = (argument[0].y == 0 ? 0 : y / argument[0].y);
                z = (argument[0].z == 0 ? 0 : z / argument[0].z);
            }            
            return self
        } else {
            if (is_numeric(argument[1])) {
                if (argument[1] == 0) return new Vector3(0, 0, 0);
                return new Vector3(
                    argument[0].x / argument[1], 
                    argument[0].y / argument[1], 
                    argument[0].z / argument[1]
                )
            } else {
                return new Vector3(
                    argument[1].x == 0 ? 0 : argument[0].x / argument[1].x,
                    argument[1].y == 0 ? 0 : argument[0].y / argument[1].y,
                    argument[1].z == 0 ? 0 : argument[0].z / argument[1].z
                )
            }
        }
    }
    
    static DistanceTo = function() {
        if (is_instanceof(self, Vector3)) {
            return point_distance_3d(x, y, z, argument[0].x, argument[0].y, argument[0].z);
        } else {
            return point_distance_3d(argument[0].x, argument[0].y, argument[0].z, argument[1].x, argument[1].y, argument[1].z);
        }
    }
    static Magnitude = function() {
        if (is_instanceof(self, Vector3)) {
            return point_distance_3d(0, 0, 0, x, y, z);
        } else {
            return point_distance_3d(0, 0, 0, argument[0].x, argument[0].y, argument[0].z);
        }
    }
    static MagnitudeSq = function() {
        if (is_instanceof(self, Vector3)) {
            return dot_product_3d(x, y, z, x, y, z);
        } else {
            return dot_product_3d(argument[0].x, argument[0].y, argument[0].z, argument[0].x, argument[0].y, argument[0].z);
        }
    }    
    static Dot = function() {
        if (is_instanceof(self, Vector3)) {
            return dot_product_3d(x, y, z, argument[0].x, argument[0].y, argument[0].z);
        } else {
            return dot_product_3d(argument[0].x, argument[0].y, argument[0].z, argument[1].x, argument[1].y, argument[1].z);
        }
    }
    static Cross = function() {
        if (is_instanceof(self, Vector3)) {
            return new Vector3(
                (y * argument[0].z) - (argument[0].y * z),
                (z * argument[0].x) - (argument[0].z * x),
                (x * argument[0].y) - (argument[0].x * y)
            );
        } else {
        return new Vector3(
                (argument[0].y * argument[1].z) - (argument[1].y * argument[0].z),
                (argument[0].z * argument[1].x) - (argument[1].z * argument[0].x),
                (argument[0].x * argument[1].y) - (argument[1].x * argument[0].y)
            );
        }         
    }
    static Normalize = function() {
        if (is_instanceof(self, Vector3)) {
            if (x == 0 && y == 0 && z == 0) return Zero();
            var _mag = point_distance_3d(0, 0, 0, x, y, z);
            x /= _mag;
            y /= _mag;
            z /= _mag;
            return self;
        } else {
            if (argument[0].x == 0 && argument[0].y == 0 && argument[0].z == 0) return new Vector3(0, 0, 0);
            var _mag = point_distance_3d(0, 0, 0, argument[0].x, argument[0].y, argument[0].z);
            return new Vector3(
                argument[0].x / _mag, 
                argument[0].y / _mag, 
                argument[0].z / _mag
            );
        }
    }
    
    static Reflect = function() {
        if (is_instanceof(self, Vector3)) {
            var _normal = argument[0];
            var _dot = Dot(_normal);
            var _scalar = 2 * _dot;
            var _reflected = Vector3.Multiply(_normal, _scalar);
            Subtract(_reflected);
            return self;
        } else {
            var _normal = argument[1];
            var _dot = argument[0].Dot(_normal);
            var _scalar = 2 * _dot;
            var _reflected = Vector3.Multiply(_normal, _scalar);
            return Vector3.Subtract(argument[0], _reflected);
        }
    }
    static Project = function() {
        if (is_instanceof(self, Vector3)) {
            var _denominator = dot_product_3d(argument[0].x, argument[0].y, argument[0].z, argument[0].x, argument[0].y, argument[0].z);
            if (_denominator == 0) return Zero();
            var _factor = dot_product_3d(x, y, z, argument[0].x, argument[0].y, argument[0].z) / _denominator;
            x = argument[0].x * _factor;
            y = argument[0].y * _factor;
            z = argument[0].z * _factor;
            return self;
        } else {
            var _denominator = dot_product_3d(argument[1].x, argument[1].y, argument[1].z, argument[1].x, argument[1].y, argument[1].z);
            if (_denominator == 0) return new Vector3(0, 0, 0);
            var _factor = dot_product_3d(argument[0].x, argument[0].y, argument[0].z, argument[1].x, argument[1].y, argument[1].z) / _denominator;
            return new Vector3(
                argument[1].x * _factor, 
                argument[1].y * _factor,
                argument[1].z * _factor
            );
        }
    }
    
    static Clamp = function() {
        if (is_instanceof(self, Vector3)) {
            if (is_numeric(argument[0])) {
                x = clamp(x, argument[0], argument[1]);
                y = clamp(y, argument[0], argument[1]);
                z = clamp(z, argument[0], argument[1]);
            } else {
                x = clamp(x, argument[0].x, argument[1].x);
                y = clamp(y, argument[0].y, argument[1].y);
                z = clamp(z, argument[0].z, argument[1].z);
            }
            return self;
        } else {
            if (is_numeric(argument[1])) {
                return new Vector3(
                    clamp(argument[0].x, argument[1], argument[2]),
                    clamp(argument[0].y, argument[1], argument[2]),
                    clamp(argument[0].z, argument[1], argument[2])
                )
            } else {
                return new Vector3(
                    clamp(argument[0].x, argument[1].x, argument[2].x), 
                    clamp(argument[0].y, argument[1].y, argument[2].y), 
                    clamp(argument[0].z, argument[1].z, argument[2].z)
                )
            }
        }
    }
    static Min = function() {
        if (is_instanceof(self, Vector3)) {
            if (argument_count > 0) {
                if (is_numeric(argument[0])) {
                    x = min(x, argument[0]);
                    y = min(y, argument[1] ?? argument[0]);
                    z = min(z, argument[2] ?? argument[0]);
                    return self;
                } else {
                    x = min(x, argument[0].x);
                    y = min(y, argument[0].y);
                    z = min(z, argument[0].z);
                    return self;
                }
            } else {
                return min(x, y, z);
            }
        } else {
            if (argument_count > 1) {
                if (is_numeric(argument[1])) {
                    return new Vector3(
                        min(argument[0].x, argument[1]),
                        min(argument[0].y, argument[2] ?? argument[1]),
                        min(argument[0].z, argument[3] ?? argument[1])
                    )
                } else {
                    return new Vector3(
                        min(argument[0].x, argument[1].x),
                        min(argument[0].y, argument[1].y),
                        min(argument[0].z, argument[1].z),
                    )
                }
            } else {
                return min(argument[0].x, argument[0].y, argument[0].z);
            }
        }
    }
    static Max = function() {
        if (is_instanceof(self, Vector3)) {
            if (argument_count > 0) {
                if (is_numeric(argument[0])) {
                    x = max(x, argument[0]);
                    y = max(y, argument[1] ?? argument[0]);
                    z = max(z, argument[2] ?? argument[0]);
                    return self;
                } else {
                    x = max(x, argument[0].x);
                    y = max(y, argument[0].y);
                    z = max(z, argument[0].z);
                    return self;
                }
            } else {
                return max(x, y, z);
            }
        } else {
            if (argument_count > 1) {
                if (is_numeric(argument[1])) {
                    return new Vector3(
                        max(argument[0].x, argument[1]),
                        max(argument[0].y, argument[2] ?? argument[1]),
                        max(argument[0].z, argument[3] ?? argument[1])
                    )
                } else {
                    return new Vector3(
                        max(argument[0].x, argument[1].x),
                        max(argument[0].y, argument[1].y),
                        max(argument[0].z, argument[1].z),
                    )
                }
            } else {
                return max(argument[0].x, argument[0].y, argument[0].z);
            }
        }
    }
    static Floor = function() {
        if (is_instanceof(self, Vector3)) {
            x = floor(x);
            y = floor(y);
            z = floor(z);
            return self;
        } else {
            return new Vector3(
                floor(argument[0].x), 
                floor(argument[0].y), 
                floor(argument[0].z)
            )
        }
    }
    static Ceil = function() {
        if (is_instanceof(self, Vector3)) {
            x = ceil(x);
            y = ceil(y);
            z = ceil(z);
            return self;
        } else {
            return new Vector3(
                ceil(argument[0].x), 
                ceil(argument[0].y), 
                ceil(argument[0].z)
            )
        }
    }
    static Round = function() {
        if (is_instanceof(self, Vector3)) {
            x = round(x);
            y = round(y);
            z = round(z);
            return self;
        } else {
            return new Vector3(
                round(argument[0].x), 
                round(argument[0].y), 
                round(argument[0].z)
            )
        }
    }

    static Transform = function() {
        if (is_instanceof(self, Vector3)) {
            var _v = matrix_transform_vertex(argument[0], x, y, z);
            x = _v[0];
            y = _v[1];
            z = _v[2];
            return self;
        } else {
            var _v = matrix_transform_vertex(argument[1], argument[0].x, argument[0].y, argument[0].z);
            return new Vector3(_v[0], _v[1], _v[2]);
        }
    }
    static Rotate = function() {
        if (is_instanceof(self, Vector3)) {
            var _m = matrix_build(0, 0, 0, argument[0], argument[1], argument[2], 1, 1, 1);
            var _v = matrix_transform_vertex(_m, x, y, z);
            x = _v[0];
            y = _v[1];
            z = _v[2];
            return self;
        } else {
            var _m = matrix_build(0, 0, 0, argument[1], argument[2], argument[3], 1, 1, 1);
            var _v = matrix_transform_vertex(_m, argument[0].x, argument[0].y, argument[0].z);
            return new Vector3(_v[0], _v[1], _v[2]);
        }
    }
    static Lerp = function() {
        if (is_instanceof(self, Vector3)) {
            x = lerp(x, argument[0].x, argument[1]);
            y = lerp(y, argument[0].y, argument[1]);
            z = lerp(z, argument[0].z, argument[1]);
            return self;
        } else {
            return new Vector3(
                lerp(argument[0].x, argument[1].x, argument[2]),
                lerp(argument[0].y, argument[1].y, argument[2]),
                lerp(argument[0].z, argument[1].z, argument[2])
            );
        }
    }    
    static LerpReset = function() {
        if (is_instanceof(self, Vector3)) {
            x = lerp(x, xstart, argument[0]);
            y = lerp(y, ystart, argument[0]);
            z = lerp(z, zstart, argument[0]);
            return self;
        } else {
            return new Vector3(
                lerp(argument[0].x, argument[0].xstart, argument[1]),
                lerp(argument[0].y, argument[0].ystart, argument[1]),
                lerp(argument[0].z, argument[0].zstart, argument[1])
            );
        }    
    }

    static Copy = function() {
        if (is_instanceof(self, Vector3)) {
            var _v = new Vector3(x, y, z);
            _v.xstart = xstart;
            _v.ystart = ystart;
            _v.zstart = zstart;
            return _v
        } else {
            var _v = new Vector3(argument[0].x, argument[0].y, argument[0].z);
            _v.xstart = argument[0].xstart;
            _v.ystart = argument[0].ystart;
            _v.zstart = argument[0].zstart;
            return _v
        }
    }
    static ToString = function() {
        if (is_instanceof(self, Vector3)) {
            return $"x: {x}, y: {y}, z: {z}";
        } else {
            return $"x: {argument[0].x}, y: {argument[0].y}, z: {argument[0].z}";
        }
        
    }
    static ToArray = function() {
        if (is_instanceof(self, Vector3)) {
            return [x, y, z];
        } else {
            return [argument[0].x, argument[0].y, argument[0].z];
        }
    }
}

