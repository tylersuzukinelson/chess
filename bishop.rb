    row = 1
    column = 8
    width = 8
    height = 8

    while row <= 8
      while column >= 1
        new_row = row
        new_column = (column.ord).chr
        puts "[#{row}][#{column}]"
        #[new_row, new_column] if is_valid_position(new_row, new_column)      
        column -= 1
        row += 1
      end
    end 

