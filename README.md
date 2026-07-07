[![GitHub license](https://img.shields.io/github/license/Kruger0/VecTools)](https://github.com/Kruger0/VecTools/blob/main/LICENSE)
[![GitHub release](https://img.shields.io/github/v/release/Kruger0/VecTools)](https://github.com/Kruger0/VecTools/releases)
[![GameMaker](https://img.shields.io/badge/GameMaker-2026_LTS+-blue?logo=gamemaker)](https://gamemaker.io/)
[![GitHub last commit](https://img.shields.io/github/last-commit/Kruger0/VecTools)](https://github.com/Kruger0/VecTools/commits)
<div align="center">
  <h1>VecTools 1.0.0</h1>
</div>

VecTools is a 2D and 3D math vector library for GameMaker. It provides `Vector2` and `Vector3` constructor structs with a full suite of arithmetic, geometric, and interpolation operations via a fluent method-chaining API.

## How to use!

1. Copy the Vector scripts into your project.
2. Create a vector and chain operations:
```js
   var _vel = new Vector2(3, 4);
   _vel.Normalize().Mul(5);  // normalized, then scaled to length 5
```
3. Use `Clone()` when you need a modified copy without mutating the original:
```js
   var _dir = _vel.Clone().Normalize();
```

## Features

### Method Chaining
All mutating methods return `self`, so operations can be chained:
```js
new Vector3(1, 0, 0)
    .Rotate(new Vector3(0, 0, 1), 45)
    .Mul(10)
    .Add(new Vector3(0, 5, 0));
```

### Scalar Overloads
Most methods accept either a vector or a plain number:
```js
vec.Add(new Vector2(2, 3));  // vector
vec.Add(5);                  // scalar applied to both components
```

### Interpolation
```js
var _a = new Vector2(0, 0);
var _b = new Vector2(100, 100);
_a.Lerp(_b, 0.5);    // linear
_a.Slerp(_b, 0.5);   // spherical, preserves arc
_a.Approach(_b, 5);  // move at most 5 units toward _b
```

### Coordinate System
Follows GameMaker's default: X right, Y down. `Rotate()` uses degrees (via `dcos`/`dsin`). `Slerp` uses radians internally.

## Complete API Reference

### Vector2

**Constructors & Constants**
- `new Vector2([x], [y])` — defaults to `(0, 0)`; single arg sets both components
- `.Zero()` `.One()` `.Infinity()` — set to common constants

**Arithmetic**
- `.Add(v)` `.Sub(v)` `.Mul(v)` `.Div(v)` — component-wise; scalar overload
- `.Negate()` `.Abs()` `.Sign()`
- `.Floor()` `.Ceil()` `.Round()`
- `.Clamp(mn, mx)` `.Min([v])` `.Max([v])`

> `Min()` / `Max()` with no argument returns the smaller/larger component as a scalar.

**Geometry**
- `.Length()` — magnitude
- `.LengthSq()` — squared magnitude, cheaper for comparisons
- `.Normalize()` — mutates to unit vector
- `.Dot(v)` — scalar dot product
- `.Cross(v)` — scalar cross product (signed area)
- `.Reflect(v)` — reflect across normal `v`
- `.Project(v)` — project onto `v`
- `.DistTo(v)` — distance to another vector or scalar point
- `.Perpendicular()` — returns a **new** `Vector2(-y, x)`

**Transform & Interpolation**
- `.Rotate(angle)` — rotate by degrees
- `.Transform(matrix)` — apply a GM matrix
- `.Lerp(v, amt)` `.Slerp(v, amt)` `.Approach(v, step)`

**Angle / Polar**
- `.Angle()` — direction from origin in degrees
- `.AngleTo(v)` — direction toward another vector in degrees
- `.FromPolar(angle, [length])` — set from polar coordinates

**Utility**
- `.Set(v)` `.Clone()` `.Equals(v)`
- `.ToString([format])` `.ToArray()`

---

### Vector3

**Constructors & Constants**
- `new Vector3([x], [y], [z])` — defaults to `(0, 0, 0)`; single arg sets all components
- `.Zero()` `.One()` `.Infinity()`

**Arithmetic**
- `.Add(v)` `.Sub(v)` `.Mul(v)` `.Div(v)`
- `.Negate()` `.Abs()` `.Sign()`
- `.Floor()` `.Ceil()` `.Round()`
- `.Clamp(mn, mx)` `.Min([v])` `.Max([v])`

**Geometry**
- `.Length()` `.LengthSq()` `.Normalize()`
- `.Dot(v)` — scalar dot product
- `.Cross(v)` — returns a **new** `Vector3` (perpendicular vector)
- `.Reflect(v)` `.Project(v)` `.DistTo(v)`
- `.Orthogonalize(n)` — Gram-Schmidt orthogonalization against normal `n`

**Transform & Interpolation**
- `.Rotate(axis, angle)` — Rodrigues rotation, axis is a `Vector3`, angle in degrees
- `.Transform(matrix)` — apply a GM matrix
- `.Lerp(v, amt)` `.Slerp(v, amt)` `.Approach(v, step)`

**Utility**
- `.Set(v)` `.Clone()` `.Equals(v)`
- `.ToString([format])` `.ToArray()`