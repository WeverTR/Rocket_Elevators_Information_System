# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# first_name	last_name	title	email	
# Mathieu	Houde	Captain	mathieu.houde@codeboxx.biz	
# Patrick 	Thibault	Engineer	patrick.thibault@codeboxx.biz	
# Francis	Patry-Jessop	Engineer	francis.patry-jessop@codeboxx.biz	
# Abdul	Akeeb	Engineer	abdul.akeeb@codebozz.biz	
# David	Amyot	Engineer	david.amyot@codeboxx.biz	
# Thomas	Carrier	Developer	thomas.carrier@codeboxx.biz	
# Timothy	Wever	Developer	timothy.wever@codeboxx.biz	
# Kiril	Kleinerman	Developer	kiril.kleinerman@codeboxx.biz	
# Emmanuela	Derilus	Developer	emmanuela.derilus@codeboxx.biz	
# Marie-Ève 	Goupil	Developer	marie-eve.goupil@codeboxx.biz	
# Perry	Sawatsky	Developer	perry.sawatsky@codeboxx.biz

  User.create(email: 'mathieu.houde@codeboxx.biz', password: 123456)
  User.create(email: 'patrick.thibault@codeboxx.biz', password: 123456)
  User.create(email: 'francis.patry-jessop@codeboxx.biz', password: 123456)
  User.create(email: 'abdul.akeeb@codebozz.biz', password: 123456)
  User.create(email: 'david.amyot@codeboxx.biz', password: 123456)
  User.create(email: 'thomas.carrier@codeboxx.biz', password: 123456)
  User.create(email: 'timothy.wever@codeboxx.biz', password: 123456)
  User.create(email: 'kiril.kleinerman@codeboxx.biz', password: 123456)
  User.create(email: 'emmanuela.derilus@codeboxx.biz', password: 123456)
  User.create(email: 'marie-eve.goupil@codeboxx.biz', password: 123456)
  User.create(email: 'perry.sawatsky@codeboxx.biz', password: 123456)
  Employee.create(user_id: 1, last_name: 'Houde', first_name: 'Mattieu', email: 'mathieu.houde@codeboxx.biz', title: 'Captain')
  Employee.create(user_id: 2, last_name: 'Thibault', first_name: 'Patrick', email: 'patrick.thibault@codeboxx.biz', title: 'Engineer')
  Employee.create(user_id: 3, last_name: 'Patry-Jessop', first_name: 'Francis', email: 'francis.patry-jessop@codeboxx.biz', title: 'Engineer')
  Employee.create(user_id: 4, last_name: 'Akeeb', first_name: 'Abdul', email: 'abdul.akeeb@codebozz.biz', title: 'Engineer')
  Employee.create(user_id: 5, last_name: 'Amyot', first_name: 'David', email: 'david.amyot@codeboxx.biz', title: 'Engineer')
  Employee.create(user_id: 6, last_name: 'Carrier', first_name: 'Thomas', email: 'thomas.carrier@codeboxx.biz', title: 'Developer')
  Employee.create(user_id: 7, last_name: 'Wever', first_name: 'Timothy', email: 'timothy.wever@codeboxx.biz', title: 'Developer')
  Employee.create(user_id: 8, last_name: 'Kleinerman', first_name: 'Kiril', email: 'kiril.kleinerman@codeboxx.biz', title: 'Developer')
  Employee.create(user_id: 9, last_name: 'Derilus', first_name: 'Emmanuela', email: 'emmanuela.derilus@codeboxx.biz', title: 'Developer')
  Employee.create(user_id: 10, last_name: 'Goupil', first_name: 'Marie-Ève', email: 'marie-eve.goupil@codeboxx.biz', title: 'Developer')
  Employee.create(user_id: 11, last_name: 'Sawatsky', first_name: 'Perry', email: 'perry.sawatsky@codeboxx.biz', title: 'Developer')
  