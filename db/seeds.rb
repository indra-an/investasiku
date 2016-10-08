# clear data
Admin.destroy_all

# seeding
Admin.create({ :full_name => 'Dadang Jebred',
               :email => 'web.investasiku@gmail.com',
               :password => 'investasiku2016' })
