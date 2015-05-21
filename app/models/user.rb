class User < ActiveRecord::Base

    has_many :group_members
    has_many :groups, :through => :group_members

    validates :email, :uniqueness => true, :allow_nil => false
    validates :password, :presence => true

end
