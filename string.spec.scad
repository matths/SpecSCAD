include <string.scad>
include <test.scad>

echo(describe("string.scad", [
  
  describe("str_join", [
    it("joins a list of strings with no separator", expect(
      str_join(["a", "b", "c"]),
      "abc"
    )),
    it("joins a list of strings with a dash separator", expect(
      str_join(["a", "b", "c"], "-"),
      "a-b-c"
    )),
    it("joins a single-element list", expect(
      str_join(["x"]),
      "x"
    )),
    it("joins an empty list", expect(
      str_join([]),
      ""
    )),
    it("joins a non-list input", expect(
      str_join("z"),
      "z"
    )),
    it("joins numbers as strings", expect(
      str_join([1, 2, 3], ", "),
      "1, 2, 3"
    ))
  ]),

  describe("str_count_char", [
    it("counts one character match", expect(
      str_count_char("abc", "a"),
      1
    )),
    it("counts multiple character matches", expect(
      str_count_char("banana", "a"),
      3
    )),
    it("counts zero matches", expect(
      str_count_char("hello", "z"),
      0
    )),
    it("counts characters in an empty string", expect(
      str_count_char("", "a"),
      0
    )),
    it("counts with a character not in string", expect(
      str_count_char("123123", "4"),
      0
    )),
    it("counts numeric characters", expect(
      str_count_char("1223334444", "4"),
      4
    ))
  ])

]));
