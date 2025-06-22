// SpecSCAD - BDD-style Specification Testing for OpenSCAD
// Author: Matthias Dittgen <dittgen@gmail.com>
// https://github.com/matths/SpecSCAD
//
// This file is part of SpecSCAD and is licensed under the MIT License.
// See the LICENSE file in the project root for full license text.

equal = function (a, b)
  a == b;

num_equal = function (a, b, tolerance = 1e-6)
  abs(a - b) < tolerance;

chop = function(value, digits = 4)
  let (factor = pow(10, digits))
  floor(value * factor) / factor;

chop_equal = function(a, b, digits = 4)
  chop(a, digits) == chop(b, digits);

str_equal = function (a, b) str(a) == str(b);

list_equal = function (a, b, comparison_fn = equal)
  is_list(a) && is_list(b) && len(a) == len(b)
    ? max([for (i = [0 : len(a) - 1]) comparison_fn(a[i], b[i]) ? 0 : 1]) == 0
    : comparison_fn(a, b);

list_equal_search = function(a, b, comparison_fn = equal)
  len(a) == len(b) && len(search(
    0,
    [for (i = [0 : len(a) - 1])
      (comparison_fn(a[i], b[i]) ? 1 : 0)]
  )) == 0;

list_str_equal = function (a, b)
  list_equal(a, b, str_equal);

list_num_equal = function (a, b)
  list_equal(a, b, num_equal);

list_chop_equal = function (a, b)
  list_equal(a, b, chop_equal);
