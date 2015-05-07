# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Comment.delete_all
Group.delete_all
GroupMember.delete_all
Picture.delete_all
Post.delete_all
User.delete_all

joe  = User.create({ first_name: 'Joe', last_name: 'Ellis' })
matt = User.create({ first_name: 'Matt', last_name: 'Ellis' })

family = Group.create({ name: "Ellis Family", description: "Group for the Ellis's to talk." })

GroupMember.create([
    { group_id: family.id, user_id: joe.id }, 
    { group_id: family.id, user_id: matt.id }
])
