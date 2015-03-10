    row = 8
    column = 1
    width = 8
    height = 8


        while row >= 1
      while column <= 8
        new_row = row
        new_column = (column.ord).chr
        puts "[#{row}][#{column}]"
#        [new_row, new_column] if is_valid_position(new_row, new_column)      
        column += 1
        row -= 1
      end
    end  

