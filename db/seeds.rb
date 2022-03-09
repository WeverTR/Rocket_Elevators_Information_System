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

first_name	last_name	title	email	
Mathieu	Houde	Captain	mathieu.houde@codeboxx.biz	
Patrick 	Thibault	Engineer	patrick.thibault@codeboxx.biz	
Francis	Patry-Jessop	Engineer	francis.patry-jessop@codeboxx.biz	
Abdul	Akeeb	Engineer	abdul.akeeb@codebozz.biz	
David	Amyot	Engineer	david.amyot@codeboxx.biz	
Thomas	Carrier	Developer	thomas.carrier@codeboxx.biz	
Timothy	Wever	Developer	timothy.wever@codeboxx.biz	
Kiril	Kleinerman	Developer	kiril.kleinerman@codeboxx.biz	
Emmanuela	Derilus	Developer	emmanuela.derilus@codeboxx.biz	
Marie-Ève 	Goupil	Developer	marie-eve.goupil@codeboxx.biz	
Perry	Sawatsky	Developer	perry.sawatsky@codeboxx.biz

11.times do |i|
Employee.create(user_id: {i} first_name: "Product ##{i}", last_name: "##{i}", email: "##{i}")
  end