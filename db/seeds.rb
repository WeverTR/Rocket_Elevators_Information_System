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


  30.times do |i|
    i+=1
    x = i +12

    bType= ["residential","commerical","corporate","hybrid"].sample
    if(bType == "residential")
      bEntity = ["Person", "Coorporation"]
   else
     bEntity = ["Person","Coorporation", "Business", "LLC"].sample
   end
    User.create(
        email: Faker::Internet.email,
        password:123456
    )
    Customer.create(
      full_name_company_contact: Faker::Name.name_with_middle,
      company_contact_phone: Faker::PhoneNumber.cell_phone,
      email_company: Faker::Internet.email,
      full_name_service_technical_authority: Faker::Name.name_with_middle,
      technical_autority_phone: Faker::PhoneNumber.cell_phone,
      technical_autority_email: Faker::Internet.email,
      user_id: x
    )

    

    Address.create(
      type_of_address: bType,
      status: ["active", "inactive"].sample,
      number_and_street: rand(6000).to_s + " " +   [ "Summit Street",
      "Brandywine Drive",
      "Front Street South",
      "River Street",
      "Forest Street",
      "Route 9",
      "14th Street",
      "Hillcrest Avenue",
      "Cedar Lane",
      "11th Street",
      "5th Street South",
      "Laurel Lane",
      "12th Street East",
      "Willow Lane",
      "Bridge Street",
      "Bank Street",
      "Linden Avenue",
      "Valley View Road",
      "Hudson Street",
      "Poplar Street",
      "Willow Avenue",
      "Linden Street",
      "Locust Street",
      "Augusta Drive",
      "Briarwood Court"].sample,
      city: ["Montreal", "Quebec"].sample,
      country: ["Canada", "USA"].sample,
      entity: bEntity
    )

    Building.create(customer_id: i, address_id: i,
      full_name_building_admin: Faker::Name.name_with_middle,
      email_building_admin: Faker::Internet.email,
      phone_building_admin: Faker::PhoneNumber.cell_phone,
      full_name_technical_contact: Faker::Name.name_with_middle,
      email_technical_contact: Faker::Internet.email,
      phone_technical_contact: Faker::PhoneNumber.cell_phone
    )

  infosKey = ["type", "Construction year", "Value"]
 if infosKey == "type"
    valueKey = bType
 elsif infosKey == "Construction year"
  valueKey = [1998,1986,1981,2001,2009,2020,2022].sample.to_s
 else
  valueKey = ["1,23M$", "1,152M$", "40,6M$", "2,5M$"].sample
 end

    # Building_detail.create(
    #   building_id: i,
    #   information_key: infosKey, 
    #   value: valueKey
    # )
    

    Battery.create(
      building_id: i,
      employee_id: [1,2,3,4,5,6,7,8,9,10,11].sample,
      status: ["active","inactive"].sample
    )


   
    ([1,3,5].sample).times do |z|
      z+=1
      model_elevator = ['standard','premium','excelium'].sample
      Column.create(
        battery_id: i,
        status: ["active", "inactive"].sample,
        Number_of_floor_served: rand(60)
      )
      ([2,5,8].sample).times do |g|
        
        Elevator.create(
          serial_number: rand(100000..200000),
          model: model_elevator,
          status: ["active", "inactive"].sample,
          column_id:z
        )
      end
    end
    


  end
