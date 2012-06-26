class Page < ActiveRecord::Base
  attr_accessible :content, :group_id, :title, :user_id

  belongs_to :user
  belongs_to :group

end
