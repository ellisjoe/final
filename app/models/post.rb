class Post < ActiveRecord::Base

    belongs_to :group_member

    validates_presence_of :title
    validates_presence_of :content

end
