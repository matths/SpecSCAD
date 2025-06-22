include <clamp.scad>

assert(clamp(5, 0, 10) == 5, "clamp: returns value when within range");
assert(clamp(-5, 0, 10) == -5, "clamp: fails if value is returned unclamped");  // Expected failure
assert(clamp(-5, 0, 10) == 0, "clamp: clamps value below min");
assert(clamp(15, 0, 10) == 10, "clamp: clamps value above max");
