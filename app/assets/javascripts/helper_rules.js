function is_valid_coords(row, column) {
  valid_columns = ['a','b','c','d','e','f','g','h'];
  valid_rows = [1,2,3,4,5,6,7,8];
  if (valid_rows.indexOf(row) < 0) {
    return false;
  }
  if (valid_columns.indexOf(column) < 0) {
    return false;
  }
  return true;
}