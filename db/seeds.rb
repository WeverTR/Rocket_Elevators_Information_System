# Employee creation data
  11.times do
    # jsonData
  end

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
  Employee.create(user_id: user.id, last_name: 'Houde', first_name: 'Mattieu', email: 'mathieu.houde@codeboxx.biz', title: 'Captain')
  Employee.create(user_id: user.id, last_name: 'Thibault', first_name: 'Patrick', email: 'patrick.thibault@codeboxx.biz', title: 'Engineer')
  Employee.create(user_id: user.id, last_name: 'Patry-Jessop', first_name: 'Francis', email: 'francis.patry-jessop@codeboxx.biz', title: 'Engineer')
  Employee.create(user_id: user.id, last_name: 'Akeeb', first_name: 'Abdul', email: 'abdul.akeeb@codebozz.biz', title: 'Engineer')
  Employee.create(user_id: user.id, last_name: 'Amyot', first_name: 'David', email: 'david.amyot@codeboxx.biz', title: 'Engineer')
  Employee.create(user_id: user.id, last_name: 'Carrier', first_name: 'Thomas', email: 'thomas.carrier@codeboxx.biz', title: 'Developer')
  Employee.create(user_id: user.id, last_name: 'Wever', first_name: 'Timothy', email: 'timothy.wever@codeboxx.biz', title: 'Developer')
  Employee.create(user_id: user.id, last_name: 'Kleinerman', first_name: 'Kiril', email: 'kiril.kleinerman@codeboxx.biz', title: 'Developer')
  Employee.create(user_id: user.id, last_name: 'Derilus', first_name: 'Emmanuela', email: 'emmanuela.derilus@codeboxx.biz', title: 'Developer')
  Employee.create(user_id: user.id, last_name: 'Goupil', first_name: 'Marie-Ève', email: 'marie-eve.goupil@codeboxx.biz', title: 'Developer')
  Employee.create(user_id: user.id, last_name: 'Sawatsky', first_name: 'Perry', email: 'perry.sawatsky@codeboxx.biz', title: 'Developer')
  
# Faker generation data
# From 2019 to 2022
  100.times do
    user = User.create(
      last_name: Faker::Name.last_name, 
      first_name: Faker::Name.first_name, 
      email: Faker::Internet.email, password: 123456, 
      created_at: Faker::Date.between(from: '2019-01-01', to: Date.today)
    )

    json = File.read("rrad/addresses-us-all.min.json")
    hash = JSON.parse(json, object_class: OpenStruct)
    randAdd = hash['addresses'].sample
    typeAddress = ["residential", "commercial", "corporate", "hybrid"]
    addEntity = ""
    address2 = ""

    if randAdd.address2.length != 0
      addEntity = randAdd.address1 + ", " + randAdd.address2 + ", "  + randAdd.city + ", "  + randAdd.state + ", "  + randAdd.postalCode
      address2 = randAdd.address2
    else
      addEntity = randAdd.address1 + ", "  + randAdd.city + ", "  + randAdd.state + ", "  + randAdd.postalCode
      address2 = "N/A"
    end

    address = Address.create( 
      type_of_address: typeAddress.sample,
      entity: addEntity,
      number_and_street:randAdd.address1,
      suite_appartment: address2,
      city: randAdd.city,
      postal_code: randAdd.postalCode,
      country: randAdd.state
  )

    customer = Customer.create(
      customer_creation_date: user.created_at,
      full_name_company_contact: Faker::Company.name,
      company_contact_phone: Faker::PhoneNumber.phone_number,
      email_company: Faker::Internet.email,
      company_description: Faker::Company.bs,
      full_name_service_technical_authority: (user.first_name + user.last_name),
      technical_authority_phone: Faker::PhoneNumber.phone_number,
      technical_authority_email: user.email,
      created_at: user.created_at,
      user_id: user.id,
      address_id: address.id
    )

    building = Building.create(

    )

  end