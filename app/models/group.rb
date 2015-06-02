class Group < ActiveRecord::Base

    has_many :group_members
    has_many :users, :through => :group_members
    has_many :posts, :through => :group_members
    has_many :photos, :through => :group_members

    validates_presence_of :name

end
