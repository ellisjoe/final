class Comment < ActiveRecord::Base

    belongs_to :group_member

    validates_presence_of :content

end
