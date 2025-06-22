include <../specscad/test.scad>
include <clamp.scad>

echo(describe("clamp", [
  it("returns value when within range", expect(
    clamp(5, 0, 10), 5
  )),
  it("fails if value is returned unclamped", expect(
    clamp(-5, 0, 10), -5  // Expected failure
  )),
  it("clamps value below min", expect(
    clamp(-5, 0, 10), 0
  )),
  it("clamps value above max", expect(
    clamp(15, 0, 10), 10
  )),
]));
