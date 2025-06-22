// SpecSCAD - BDD-style Specification Testing for OpenSCAD
// Author: Matthias Dittgen <dittgen@gmail.com>
// https://github.com/matths/SpecSCAD
//
// This file is part of SpecSCAD and is licensed under the MIT License.
// See the LICENSE file in the project root for full license text.

str_join = function (list, sep = "", i = 0, result = "") 
  let (list = is_list(list) ? list : [list])
  i >= len(list) - 1 
    ? (i == len(list) ? result : str(result, list[i])) 
    : str_join(list, sep, i + 1, str(result, list[i], sep));

str_count_char = function (str, char, i = 0, count = 0) 
  i >= len(str) ? count : str_count_char(str, char, i + 1, count + (str[i] == char ? 1 : 0));
