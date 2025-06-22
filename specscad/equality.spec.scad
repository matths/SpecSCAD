include <equality.scad>
include <test.scad>

echo(describe("equality.scad", [

  describe("equal", [
    it("returns true when values are equal", expect(
      equal(5, 5),
      true
    )),
    it("returns false when values are not equal", expect(
      equal(5, 6),
      false
    )),
    it("works with strings", expect(
      equal("abc", "abc"),
      true
    ))
  ]),

  describe("num_equal", [
    it("returns true when numbers are exactly equal", expect(
      num_equal(1.0, 1.0),
      true
    )),
    it("returns true within default tolerance", expect(
      num_equal(1.0000001, 1.0000002),
      true
    )),
    it("returns false outside default tolerance", expect(
      num_equal(1.0001, 1.0002),
      false
    ))
  ]),

  describe("chop & chop_equal", [
    it("chops a number to 4 digits", expect(
      chop(3.14159265),
      3.1415
    )),
    it("chop_equal is true when chopped values match", expect(
      chop_equal(3.14159265, 3.14159999),
      true
    )),
    it("chop_equal is false when chopped values differ", expect(
      chop_equal(3.1415, 3.1414),
      false
    ))
  ]),

  describe("str_equal", [
    it("returns true when strings are equal", expect(
      str_equal("OpenSCAD", "OpenSCAD"),
      true
    )),
    it("returns false when strings differ", expect(
      str_equal("OpenSCAD", "openscad"),
      false
    ))
  ]),

  describe("list_equal", [
    it("returns true for identical number lists", expect(
      list_equal([1, 2, 3], [1, 2, 3]),
      true
    )),
    it("returns false for unequal length lists", expect(
      list_equal([1, 2], [1, 2, 3]),
      false
    )),
    it("returns false for different values", expect(
      list_equal([1, 2, 3], [3, 2, 1]),
      false
    )),
    it("returns true using str_equal as comparison", expect(
      list_equal(["a", "b"], ["a", "b"], str_equal),
      true
    ))
  ]),

  describe("list_equal_search", [
    it("returns true for matching lists", expect(
      list_equal_search([1, 2, 3], [1, 2, 3]),
      true
    )),
    it("returns false for non-matching lists", expect(
      list_equal_search([1, 2, 3], [3, 2, 1]),
      false
    ))
  ]),

  describe("list_str_equal", [
    it("returns true for identical string lists", expect(
      list_str_equal(["hello", "world"], ["hello", "world"]),
      true
    )),
    it("returns false for mismatched string lists", expect(
      list_str_equal(["hello", "world"], ["HELLO", "WORLD"]),
      false
    ))
  ]),

  describe("list_num_equal", [
    it("returns true for close numbers", expect(
      list_num_equal([1.0000001, 2.0000001], [1.0000002, 2.0000002]),
      true
    )),
    it("returns false for numbers too far apart", expect(
      list_num_equal([1.0001, 2.0001], [1.0002, 2.0002]),
      false
    ))
  ]),

  describe("list_chop_equal", [
    it("returns true when chopped numbers are equal", expect(
      list_chop_equal([3.1415926, 2.7182818], [3.1415999, 2.7182899]),
      true
    )),
    it("returns false when chopped numbers differ", expect(
      list_chop_equal([3.1415, 2.7182], [3.1414, 2.7181]),
      false
    ))
  ])


]));