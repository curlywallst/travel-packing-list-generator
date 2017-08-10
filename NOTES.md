Include choices of common Items
Include templates for different types of trips - eg: beach, city, ski
Models
  User - includes login with passport, has_many trips, has_many categories through trips
  Trip - has_many categories, has_many items through categories, belongs_to a trip
  Item  - belongs_to a category
  Category - has_many items, belongs_to_many trips
  Todo - before I go list of things to do to get ready
