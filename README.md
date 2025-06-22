# SpecSCAD

BDD-style Specification Testing for OpenSCAD

---

## Introduction

[OpenSCAD](https://openscad.org/) is a fantastic tool for parametric 3D modeling, but it doesn’t provide native support for unit testing your functions. **SpecSCAD** fills this gap by offering a simple, readable BDD-style testing framework inspired by JavaScript tools like Mocha and Jest. It enables you to write structured tests for your OpenSCAD functions using describe, it, and expect.

---

## Prerequisites

* OpenSCAD installed and accessible from the command line (i.e., openscad command works).
* Bash shell environment (Linux, macOS, or Windows Subsystem for Linux).

---

## Usage

You can run tests on your spec files using the included shell script:

```bash
./run_tests.sh example/clamp.spec.scad     # Run a single spec file
./run_tests.sh example/*.spec.scad         # Run all spec files in a directory
```

This script runs OpenSCAD in headless mode and outputs test results to the console.
Make sure to specify one or more spec files.

---

## Example

Suppose you have a `clamp()` function that restricts a value `x` to the range `[min, max]`:

```scad
// clamp.scad
clamp = function(x, min_val, max_val)
  max(min(x, max_val), min_val);
```

### using plain asserts

OpenScad offers an `assert()` function to use.

note: evaluation stops at the first failure.

```scad
// clamp.test.scad
include <clamp.scad>

assert(clamp(5, 0, 10) == 5, "clamp: returns value when within range");
assert(clamp(-5, 0, 10) == -5, "clamp: fails if value is returned unclamped");  // Expected failure
assert(clamp(-5, 0, 10) == 0, "clamp: clamps value below min");
assert(clamp(15, 0, 10) == 10, "clamp: clamps value above max");
```

### using SpecSCAD’s BDD-style tests

**SpecSCAD**  offers BDD-style methods `describe`, `it`, and `expect`.

All tests are evaluated, whether they pass or fail.

```scad
// clamp.spec.scad
include <../test.scad>
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
```

### sample output

```
Running OpenSCAD on 'example/clamp.spec.scad'...

clamp
  returns value when within range  ✔ PASS
  fails if value is returned unclamped  ✘ FAIL (Expected: -5, Got: 0)
  clamps value below min  ✔ PASS
  clamps value above max  ✔ PASS
3 passed, 1 failed.
```

---

## Notes

* SpecSCAD tests **only functions** (not modules), encouraging you to place core logic into reusable functions.
* The framework is lightweight and simple—no external dependencies beyond OpenSCAD and Bash.

---

## Contributing

Contributions, feedback, and ideas are very welcome! Feel free to open issues or submit pull requests to improve SpecSCAD.

---

## License

[MIT License](LICENSE)

