# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(
  name: 'Home',
  icon: 'https://maps.gstatic.com/mapfiles/ms2/micons/blue-dot.png'
)

Category.create(
  name: 'Food',
  icon: 'https://maps.gstatic.com/mapfiles/ms2/micons/green-dot.png'
)

Category.create(
  name: 'Coffee',
  icon: 'https://maps.gstatic.com/mapfiles/ms2/micons/yellow-dot.png'
)

Category.create(
  name: 'Hardware',
  icon: 'https://maps.gstatic.com/mapfiles/ms2/micons/red-dot.png'
)

Supplier.create(
  name: 'Standout AB',
  address: 'Västergatan 6',
  zip: '352 30 Växjö',
  country: 'Sweden',
  email: 'kontakt@standout.se',
  category: Category.find_by_name('Home')
)

Supplier.create(
  name: '4 Krogar Vid Sjön',
  address: 'Vattentorget 5',
  zip: '352 34 Växjö',
  country: 'Sweden',
  email: 'info@4krogar.se',
  category: Category.find_by_name('Food')
)

Supplier.create(
  name: 'Skåres Konditori',
  address: 'Kungsgatan 13',
  zip: '352 31 Växjö',
  country: 'Sweden',
  email: 'annika@skareskonditori.se',
  category: Category.find_by_name('Coffee')
)

Supplier.create(
  name: 'AB Helmer Nilsson',
  address: 'Mörnersväg 116',
  zip: '350 53 VÄXJÖ',
  country: 'Sweden',
  email: 'sales@helmer-nilsson.se',
  category: Category.find_by_name('Hardware')
)
