# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

coords = [
  [1, "a" ],[1, "b" ],[1, "c" ],[1, "d" ],[1, "e" ],[1, "f" ],[1, "g" ],[1, "h" ],
  [2, "a" ],[2, "b" ],[2, "c" ],[2, "d" ],[2, "e" ],[2, "f" ],[2, "g" ],[2, "h" ],
  [3, "a" ],[3, "b" ],[3, "c" ],[3, "d" ],[3, "e" ],[3, "f" ],[3, "g" ],[3, "h" ],
  [4, "a" ],[4, "b" ],[4, "c" ],[4, "d" ],[4, "e" ],[4, "f" ],[4, "g" ],[4, "h" ],
  [5, "a" ],[5, "b" ],[5, "c" ],[5, "d" ],[5, "e" ],[5, "f" ],[5, "g" ],[5, "h" ],
  [6, "a" ],[6, "b" ],[6, "c" ],[6, "d" ],[6, "e" ],[6, "f" ],[6, "g" ],[6, "h" ],
  [7, "a" ],[7, "b" ],[7, "c" ],[7, "d" ],[7, "e" ],[7, "f" ],[7, "g" ],[7, "h" ],
  [8, "a" ],[8, "b" ],[8, "c" ],[8, "d" ],[8, "e" ],[8, "f" ],[8, "g" ],[8, "h" ]
]

coords.each do |row, column|
  BoardSquare.create(row: row, column: column)
end


