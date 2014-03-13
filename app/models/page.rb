class Page < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  scope :mine, ->(user) { where( pages: { user_id: user.id } ) }

  # ページ所有者判定
  # def is_owner?( user_id )
  #   return true if self.user_id == user_id
  #   return false
  # end

  # ページ閲覧権限
  # def permission_ok?( user_id, group )
  #   case self.permission
  #   when "private"
  #     return true if self.user_id == user_id
  #   when "group"
  #     return true if GroupMember.where( group_id: group.id, user_id: user_id ).exists?
  #   when "public"
  #     return true
  #   else
  #     return false
  #   end

  #   return false
  # end

  # ページ編集権限
  # def edit_ok?( user_id, group )
  #   case self.permission
  #   when "private"
  #     return true if self.user_id == user_id
  #   when "group"
  #     return true if GroupMember.where( group_id: group.id, user_id: user_id ).exists?
  #   when "public"
  #     return true if self.user_id == user_id
  #   else
  #     return false
  #   end

  #   return false
  # end
end
