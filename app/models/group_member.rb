class GroupMember < ActiveRecord::Base

    belongs_to :group
    belongs_to :user

    has_many :posts
    has_many :photos

end
