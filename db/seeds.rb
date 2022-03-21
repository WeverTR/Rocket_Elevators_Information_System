  # Employee creation data
  Rake::Task["dwh:truncateMysql"].invoke
    json = File.read("rrad/employee-data.json")
    hash = JSON.parse(json, object_class: OpenStruct)
    users = hash['data']

    users.each do |user|
        user = User.create!(
          last_name: user['last_name'],
          first_name: user['first_name'],
          email: user['email'],
          password: 123456,
          title: user['title']
        )
        employee = Employee.create!(
          last_name: user.last_name,
          first_name: user.first_name,
          email: user.email,
          title: user.title,
          user_id: user.id
        )
    end

    # Faker generation data
    100.times do |i|
    json = File.read("rrad/addresses-us-all.min.json")
    hash = JSON.parse(json, object_class: OpenStruct)
    randAdd = hash['addresses'].sample
    typeAddress = ["residential", "commercial", "corporate", "hybrid"]
    # if randAdd.address2.length != 0
      fullAddress = randAdd.address1 + ", " + randAdd.city + ", "  + randAdd.state + ", "  + randAdd.postalCode
      # address2 = randAdd.address2
    # else
    #   fullAddress = randAdd.address1 + ", "  + randAdd.city + ", "  + randAdd.state + ", "  + randAdd.postalCode
    #   address2 = "N/A"
    # end

    user = User.create(
    last_name: Faker::Name.last_name.gsub(/\W/, ''), 
    first_name: Faker::Name.first_name.gsub(/\W/, ''), 
    email: Faker::Internet.email, 
    password: 123456, 
    created_at: Faker::Date.between(from: '2019-01-01', to: Date.today)
    )
    address = Address.create!(
      type_of_address: typeAddress.sample,
      entity: "N/A",
      number_and_street:randAdd.address1,
      city: randAdd.city,
      postal_code: randAdd.postalCode,
      country: randAdd.state,
    )
    customer = Customer.create!(
      customer_creation_date: user.created_at,
      company_name: Faker::Company.name.gsub(/\W/, ''),
      full_name_company_contact: Faker::Name.name.gsub(/\W/, ''),
      company_contact_phone: Faker::PhoneNumber.phone_number.gsub(/\W/, ''),
      email_company: Faker::Internet.email.gsub(/\W/, ''),
      company_description: Faker::Company.bs,
      full_name_service_technical_authority: (user.first_name + user.last_name),
      technical_authority_phone: Faker::PhoneNumber.phone_number,
      technical_authority_email: user.email,
      created_at: user.created_at,
      user_id: user.id,
      address_id: address.id
    )
    quote = Quote.create!(
      buildingtype: ["residential", "commercial", "corporate", "hybrid"].sample,
      numofapt: Random.new.rand(5..40),
      numoffloors: Random.new.rand(5..100),
      numofbase: Random.new.rand(5..10),
      numofpark: Random.new.rand(30..100),
      numofcomp: Random.new.rand(5..100),
      numofelev: Random.new.rand(1..100),
      maxocc: Random.new.rand(100..500),
      bushrs: Random.new.rand(5..100),
      corp: Random.new.rand(1..20),
      liftCage: Random.new.rand(5..100),
      elevatorNum: Random.new.rand(5..100),
      unitPrice: ["$7,565", "$12,345", "$15,400"].sample,
      totalPriceElevators: "$" + "#{Random.new.rand(10000..30000)}",
      installFees: "$" + "#{Random.new.rand(10000..50000)}",
      totalPrice: "$" + "#{Random.new.rand(30000..200000)}",
      companyname: customer.company_name,
      email: customer.email_company,
      created_at: Faker::Date.between(from: '2019-01-01', to: Date.today)
      )
      building = Building.create!(
          building_address: randAdd.address1,
          full_name_building_admin: Faker::Name.name.gsub(/\W/, ''),
          email_building_admin: Faker::Internet.email.gsub(/\W/, ''),
          phone_building_admin: Faker::PhoneNumber.phone_number,
          full_name_technical_contact: customer.full_name_service_technical_authority,
          email_technical_contact: customer.technical_authority_email,
          phone_technical_contact: customer.technical_authority_phone,
          address_id: address.id,
          customer_id: customer.id
          )
          buildingDetail = BuildingDetail.create(
            building_id: building.id,
            information_key: ["type","year_of_construction","architecture","maximum_number_of_occupants","number_of_floors"],
            value: [['Residential', 'Commercial', 'Corporate'].sample,Faker::Date.between(from: '2018-09-23', to: '2022-03-17'),["Ancient Roman architecture","Resort architecture","Art Deco"].sample,Faker::Number.within(range: 1..100)]
          )
          rand(1..3).times do
              battery = Battery.create!(
                building_id: building.id,
                employee_id: Random.new.rand(1..11),
                types: address.type_of_address,
                status: ["active", "inactive"].sample,
                date_of_commissioning: Faker::Date.between(from: '2018-09-23', to: '2022-03-17'),
                date_of_last_inspection: Faker::Date.between(from: '2019-09-23', to: '2022-03-17'),
                certificate_of_operations: Faker::Date.between(from: '2018-09-23', to: '2022-03-17'),
                information: "Let me tell you 'bout my battery.",
                notes: Faker::Company.bs
              )
              rand(1..4).times do
                column = Column.create!(
                  types: battery.types,
                  number_of_floors_served: Random.new.rand(10..100),
                  status: battery.status,
                  information: "Let me tell you 'bout my column.",
                  notes: battery.notes,
                  battery_id: battery.id
                )
                rand(1..6).times do
                  elevator = Elevator.create!(
                    column_id: column.id,
                    serial_number: Faker::Number.leading_zero_number(digits: 10),
                    model: ["standard", "premium", "excelium"].sample,
                    types: column.types,
                    status: ["idle", "moving", "maintenance" "stopped"].sample,
                    date_of_commissioning: battery.date_of_commissioning,
                    date_of_last_inspection: battery.date_of_last_inspection,
                    certificate_of_inspection: battery.certificate_of_operations,
                    information: "Let me tell you 'bout my elevator.",
                    notes: column.notes
                  )
                  end
              end
          end
          puts "Seed ##{i + 1} successful."
      end

    rand(20..40).times do
      lead = Leads.create(
        fullname: Faker::Name.name.gsub(/\W/, ''),
        companyname: Faker::Company.name.gsub(/\W/, ''),
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        projectname: Faker::Company.industry,
        projectdescription: Faker::Company.bs,
        departmentincharge: Faker::IndustrySegments.sector,
        message: Faker::Company.catch_phrase,
        created_at: Faker::Date.between(from: '2018-09-23', to: '2022-03-17')
      )
    end
