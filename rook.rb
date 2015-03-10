    row = 1
    column =  1


       output = []
    while row <= 8
            puts "[#{row}][#{column}]"

      #output << [row, column] if is_valid_position(row, column)      
      row += 1 
    end  
    output.compact 