class Group < ActiveRecord::Base
  belongs_to :user
  has_many   :pages, dependent: :delete_all

  scope :mine, ->(user) { where( groups: { user_id: user.id } ) }

  private

  # デフォルトグループ作成
  def self.create_default(user)
    # 作成済みでなければ
    unless Group.where(user_id: user.id, default_flag: true).exists?
      Group.create(user_id: user.id, name: "Default", default_flag: true)
    end
  end
end
