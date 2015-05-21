class Picture < ActiveRecord::Base

    belongs_to :group_member

    validates_presence_of :file_location

end
