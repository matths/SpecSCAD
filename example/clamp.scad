// SpecSCAD - BDD-style Specification Testing for OpenSCAD
// Author: Matthias Dittgen <dittgen@gmail.com>
// https://github.com/matths/SpecSCAD
//
// This file is part of SpecSCAD and is licensed under the MIT License.
// See the LICENSE file in the project root for full license text.

clamp = function(x, min_val, max_val)
  max(min(x, max_val), min_val);
