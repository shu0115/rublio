class Page < ActiveRecord::Base
  attr_accessible :content, :group_id, :title, :user_id, :permission

  belongs_to :user
  belongs_to :group

  #-----------#
  # is_owner? #
  #-----------#
  # ページ所有者判定
  def is_owner?( user_id )
    return true if self.user_id == user_id
    return false
  end

  #----------------#
  # permission_ok? #
  #----------------#
  # ページ公開判定
  def permission_ok?( user_id, group )
    case self.permission
    when "private"
      return true if self.user_id == user_id
    when "group"
      return true if group.user_id == user_id
    when "public"
      return true
    else
      return false
    end

    return false
  end

end
