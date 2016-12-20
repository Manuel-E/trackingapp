# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#create states

s1=State.find_or_create_by(name:"En Bodega")
s2=State.find_or_create_by(name:"En Transporte")
s3=State.find_or_create_by(name:"Entregado")
s4=State.find_or_create_by(name:"Cancelado")


user=User.find_or_create_by(email:"test@ideaware.co")
user.password="123456"
user.save
user.add_role "admin"

b=City.find_or_create_by(name:"Barranquilla")
m=City.find_or_create_by(name:"Medellin")
c=City.find_or_create_by(name:"Cali")

f1=Fleet.find_or_create_by(name:"Flota 1",city:b)
f2=Fleet.find_or_create_by(name:"Flota 2",city:m)
f3=Fleet.find_or_create_by(name:"Flota 3",city:c)

t1=Truck.find_or_create_by(name:"Truck 1",fleet:f1)
t2=Truck.find_or_create_by(name:"Truck 2",fleet:f1)
t3=Truck.find_or_create_by(name:"Truck 3",fleet:f1)


package1=Package.find_or_create_by(content:"Video Game",weight:"150.0",current_location:Location.create(latitude:10.990991469741862,longitude:-74.78479385375977),origin:Location.create(address:"fake origin street 1"),destination:Location.create(address:"fake destination street 1"),state:s1,truck:t1)
package2=Package.find_or_create_by(content:"Xbox One",weight:"150.0",current_location:Location.create(latitude:10.926444088838405,longitude:-74.79891300201416),origin:Location.create(address:"fake origin street 2"),destination:Location.create(address:"fake destination street 2"),state:s1,truck:t1)
package3=Package.find_or_create_by(content:"Keyboard",weight:"150.0",current_location:Location.create(latitude:10.937820954203058,longitude:-74.7865104675293),origin:Location.create(address:"fake origin street 3"),destination:Location.create(address:"fake destination street 3"),state:s2,truck:t1)
package4=Package.find_or_create_by(content:"Laptop ",weight:"150.0",current_location:Location.create(latitude:11.007336741007515,longitude:-74.80749607086182),origin:Location.create(address:"fake origin street 4"),destination:Location.create(address:"fake destination street 4"),state:s3,truck:t1)

#medellin
package2=Package.find_or_create_by(content:"Clothes",weight:"150.0",current_location:Location.create(latitude:6.240561749874363,longitude:-75.58834075927734),origin:Location.create(address:"fake origin street 5"),destination:Location.create(address:"fake destination street 2"),state:s1,truck:t2)
#bogoa
package3=Package.find_or_create_by(content:"Fridge",weight:"150.0",current_location:Location.create(latitude:4.64281410703892,longitude:-74.0701675415039),origin:Location.create(address:"fake origin street 6"),destination:Location.create(address:"fake destination street 2"),state:s3,truck:t3)
