class Page < ActiveRecord::Base
  attr_accessible :content, :group_id, :title, :user_id, :show_range

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
  # show_range_ok? #
  #----------------#
  # ページ公開判定
  def show_range_ok?( user_id, group )
    print "[ self.show_range ] : " ; p self.show_range;
#    return false if self.nil?

    case self.show_range
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
