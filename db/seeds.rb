# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#create states

State.create(name:"En Bodega")
State.create(name:"En Transporte")
State.create(name:"Entregado")
State.create(name:"Cancelado")

user=User.create!(email:"test@ideaware.co",password:"123456")
user.add_role "admin"

b=City.create(name:"Barranquilla")
m=City.create(name:"Medellin")
c=City.create(name:"Cali")

f1=Fleet.create(name:"Flota 1",city:b)
Fleet.create(name:"Flota 2",city:b)
Fleet.create(name:"Flota 3",city:b)

Truck.create(name:"Truck 1",fleet:f1)
Truck.create(name:"Truck 2",fleet:f1)
Truck.create(name:"Truck 3",fleet:f1)
