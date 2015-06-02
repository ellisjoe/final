class Photo < ActiveRecord::Base

    belongs_to :group_member

    has_many :comments
    has_one :user, :through => :group_member
    has_one :group, :through => :group_member

    validates_presence_of :file_location

end
