# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

Product.create!(
	title: 'Barrel Cover',
	description: %{
		<p>Covers your barrel so you don't
		accidentally shoot someone's eye out.</p>},
	image_url: "http://hudsonvalleyairsoft.com/images/cover.jpg",
	price: 6.5
	)

Product.create!(
	title: 'Save Phace Goggles',
	description: %{
		<p>Non-fogging goggles, high quality.</p>},
	image_url: "http://ecx.images-amazon.com/images/I/41-iKgjY83L._SY300_.jpg",
	price: 19.95
	)

Product.create!(
	title: 'Ultrasonic BBs',
	description: %{
		<p>10,000 BBs, yellow.</p>},
	image_url: "http://www.big5sportinggoods.com/photos/product/giant/4782420S163580/airsoft-pellets/10-000-airsoft-bbs-with-bonus-airsoft-pistol.jpg",
	price: 12.95
	)