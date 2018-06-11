# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Client.create(name: "Rogério")
Client.create(name: "Fábio")
Client.create(name: "Vilmar")
Client.create(name: "Robson")

Product.create(description: "Faca", value: 1 , cost_value: 0.7 )
Product.create(description: "Colher", value: 1 , cost_value: 0.7 )
Product.create(description: "Garfo", value: 1, cost_value: 0.7 )
Product.create(description: "Copo", value: 3, cost_value: 1.4 )
Product.create(description: "Prato", value: 4, cost_value: 1.8 )