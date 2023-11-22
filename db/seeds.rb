ActiveRecord::Base.transaction do
  u = User.create(name: 'Admin', email: "admin@tutorme.com", password: "test1234", admin: true)
  Course.create!(prefix: 'WEB', num: 3200, title: 'Dynamic languages for WEB', 
    description: "TBD", created_by: u, updated_by: u)
  
  tu = User.create(name: 'Test User', email: 'test@tutorme.com', password: 'test1234', tutor: true)
  t = Tutor.create(name: 'John Smith', bio: 'test', user: tu)
  #Availability.create(...., tutor=t)



end