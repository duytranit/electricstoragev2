# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Attachment.delete_all
Reply.delete_all
Feedback.delete_all
Invoicedetail.delete_all
Invoice.delete_all
Project.delete_all
Procategory.delete_all
User.delete_all

User.create(
	email: 'staff1@gmail.com',
	password: '123123123',
	first_name: 'Le Duy',
	last_name: 'Staff',
	role: 'staff',
	status: true
	)

User.create(
	email: 'customer1@gmail.com',
	password: '123123123',
	first_name: 'Le Duy',
	last_name: 'Customer',
	role: 'customer',
	status: true
	)

procategory = Procategory.create(
	name: '...',
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: nil,
	procategory_id: 0
	)
(1..9).each do |flag|
	child = procategory.procategories.create(
		name: 'Category '+flag.to_s,
		status: true
		)

	(1..9).each do |cflag|
		child.procategories.create(
			name: 'Category '+flag.to_s+cflag.to_s,
			status: true
			)
	end
end