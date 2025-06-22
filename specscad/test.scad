// SpecSCAD - BDD-style Specification Testing for OpenSCAD
// Author: Matthias Dittgen <dittgen@gmail.com>
// https://github.com/matths/SpecSCAD
//
// This file is part of SpecSCAD and is licensed under the MIT License.
// See the LICENSE file in the project root for full license text.

include <equality.scad>
include <string.scad>

break = false;
intro = false;

expect = function (actual, expected, comparison_fn = equal)
  function ()
    comparison_fn(actual, expected)
      ? "✔ PASS"
      : str("✘ FAIL (Expected: ", expected, ", Got: ", actual, ")");

it = function (desc, test_fn)
  str("\n  ", intro ? "It: " : "", desc, break ? "\n    " : "  ", test_fn());

describe = function (group, tests)
  let (
    test_output = str_join(tests),
    passed = str_count_char(test_output, "✔"),
    failed = str_count_char(test_output, "✘")
  )
  str(
    "\n",
    intro ? "Describe: " : "",
    group,
    test_output,
    "\n", intro ? "Summary: " : "", passed, " passed, ", failed, " failed.\n"
  );

// echo(describe("some file being tested", [
//   describe("some function being tested", [
//     it("should be false that 1 is 2", expect(1, 2)),
//     it("should be true that 1 is 1", expect(1, 1)),
//   ]),
// ]));
