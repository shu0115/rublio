class Page < ActiveRecord::Base
  attr_accessible :content, :group_id, :title, :user_id

  belongs_to :user
  belongs_to :group

  #-----------#
  # is_owner? #
  #-----------#
  def is_owner?( user_id )
    return true if self.user_id == user_id
    return false
  end

end
