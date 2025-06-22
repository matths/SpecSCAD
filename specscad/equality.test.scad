include <equality.scad>

assert(equal(5, 5), "equal: returns true when values are equal");
assert(!equal(5, 6), "equal: returns false when values are not equal");
assert(equal("abc", "abc"), "equal: works with strings");

assert(num_equal(1.0, 1.0), "num_equal: returns true when numbers are exactly equal");
assert(num_equal(1.0000001, 1.0000002), "num_equal: returns true within default tolerance");
assert(!num_equal(1.0001, 1.0002), "num_equal: returns false outside default tolerance");

assert(chop(3.14159265) == 3.1415, "chop: chops a number to 4 digits");
assert(chop_equal(3.14159265, 3.14159999), "chop_equal: is true when chopped values match");
assert(!chop_equal(3.1415, 3.1414), "chop_equal: is false when chopped values differ");

assert(str_equal("OpenSCAD", "OpenSCAD"), "str_equal: returns true when strings are equal");
assert(!str_equal("OpenSCAD", "openscad"), "str_equal: returns false when strings differ");

assert(list_equal([1, 2, 3], [1, 2, 3]), "list_equal: returns true for identical number lists");
assert(!list_equal([1, 2], [1, 2, 3]), "list_equal: returns false for unequal length lists");
assert(!list_equal([1, 2, 3], [3, 2, 1]), "list_equal: returns false for different values");
assert(list_equal(["a", "b"], ["a", "b"], str_equal), "list_equal: returns true using str_equal as comparison");

assert(list_equal_search([1, 2, 3], [1, 2, 3]), "list_equal_search: returns true for matching lists");
assert(!list_equal_search([1, 2, 3], [3, 2, 1]), "list_equal_search: returns false for non-matching lists");

assert(list_str_equal(["hello", "world"], ["hello", "world"]), "list_str_equal: returns true for identical string lists");
assert(!list_str_equal(["hello", "world"], ["HELLO", "WORLD"]), "list_str_equal: returns false for mismatched string lists");

assert(list_num_equal([1.0000001, 2.0000001], [1.0000002, 2.0000002]), "list_num_equal: returns true for close numbers");
assert(!list_num_equal([1.0001, 2.0001], [1.0002, 2.0002]), "list_num_equal: returns false for numbers too far apart");

assert(list_chop_equal([3.1415926, 2.7182818], [3.1415999, 2.7182899]), "list_chop_equal: returns true when chopped numbers are equal");
assert(!list_chop_equal([3.1415, 2.7182], [3.1414, 2.7181]), "list_chop_equal: returns false when chopped numbers differ");
