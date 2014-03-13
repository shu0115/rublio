class Page < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  scope :mine, ->(user) { where( pages: { user_id: user.id } ) }
end
