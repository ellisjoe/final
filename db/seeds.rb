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
Photo.delete_all
Post.delete_all
User.delete_all

joe  = User.create({
    first_name: 'Joe',
    last_name:  'Ellis',
    password:   'joe',
    email:      'joe@gmail.com'
})
matt = User.create({
    first_name: 'Matt',
    last_name:  'Ellis',
    password:   'matt',
    email:      'matt@gmail.com'
})

family = Group.create({
    name: "Ellis Family",
    description: "Group for the Ellis's to talk.",
})

joe_group = Group.create({
    name: "Joe's Group",
    description: "Group just for Joe.",
})

matt_group = Group.create({
    name: "Matt's Group",
    description: "Group just for Matt.",
})

other_group = Group.create({
    name: "Joe's Admin",
    description: "Group with Joe as admin.",
})

members = GroupMember.create([
    { group_id: family.id, user_id: joe.id, admin: true }, 
    { group_id: family.id, user_id: matt.id, admin: true },

    { group_id: joe_group.id, user_id: joe.id, admin: true },

    { group_id: matt_group.id, user_id: matt.id, admin: true },

    { group_id: other_group.id, user_id: joe.id, admin: true },
    { group_id: other_group.id, user_id: matt.id, admin: false },
])

members.each do |member|
    Post.create({
        group_member_id: member.id,
        title: "Test post for #{member.user.first_name}",
        time_posted: DateTime.now,
        content: "Blah blah blah"
    })
end

photo = Photo.create({
    group_member_id: members[0].id,
    time_posted: DateTime.now,
    file_location: Rails.root.join('public', 'uploads', 'rubber-duck.jpg')
})

Comment.create({
    user_id: joe.id,
    photo_id: photo.id,
    time_posted: DateTime.now,
    content: "So cool!",
})
