include <string.scad>

assert(str_join(["a", "b", "c"]) == "abc", "str_join: joins with no separator");
assert(str_join(["a", "b", "c"], "-") == "a-b-c", "str_join: joins with dash separator");
assert(str_join(["x"]) == "x", "str_join: single-element list");
assert(str_join([]) == "", "str_join: empty list");
assert(str_join("z") == "z", "str_join: non-list input");
assert(str_join([1, 2, 3], ", ") == "1, 2, 3", "str_join: joins numbers as strings");

assert(str_count_char("abc", "a") == 1, "str_count_char: one match");
assert(str_count_char("banana", "a") == 3, "str_count_char: multiple matches");
assert(str_count_char("hello", "z") == 0, "str_count_char: no matches");
assert(str_count_char("", "a") == 0, "str_count_char: empty string");
assert(str_count_char("123123", "4") == 0, "str_count_char: missing char");
assert(str_count_char("1223334444", "4") == 4, "str_count_char: numeric chars");
