class Group < ActiveRecord::Base
  # attr_accessible :name, :user_id, :default_flag, :permission
#  attr_accessor :group_members

  belongs_to :user
  has_many   :pages, dependent: :delete_all
  # has_many :group_members, :dependent => :destroy
  # belongs_to :user, :through => :group_members

  scope :mine, ->(user) { where( groups: { user_id: user.id } ) }

  # グループオーナー判定
  # def is_owner?( user_id )
  #   return true if self.user_id == user_id
  #   return false
  # end

  # グループ閲覧権限
  # def permission_ok?( user_id )
  #   case self.permission
  #   when "private"
  #     return true if self.user_id == user_id
  #   when "group"
  #     return true if GroupMember.where( group_id: self.id, user_id: user_id ).exists?
  #   when "public"
  #     return true
  #   else
  #     return false
  #   end

  #   return false
  # end

  private

  # デフォルトグループ作成
  def self.create_default(user)
    # 作成済みでなければ
    unless Group.where(user_id: user.id, default_flag: true).exists?
      Group.create(user_id: user.id, name: "Default", default_flag: true)
    end
  end
end
