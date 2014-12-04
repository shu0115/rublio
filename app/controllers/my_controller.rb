class MyController < ApplicationController
  # ライブラリ
  def library(controller, action)
    @active = { "#{controller}_#{action}" => "active" }

    @user   = User.find_by(id: current_user.id)
    # @groups = Group.where(user_id: current_user.id).includes(:pages).order("groups.name ASC, pages.title ASC").references(:pages)
    @groups = Group.where(user_id: current_user.id).order("groups.name ASC").references(:pages)
    @group  = Group.new
  end

  # 検索
  def search(word, search_type)
    if word.blank? or search_type.blank?
      redirect_to my_library_path and return
    end

    @pages = Page.all

    # 半角スペースor全角スペースで分割する
    words = word.split(/ |　/)
    words.each do |w|
      # @pages = Page.where("pages.#{search_type} LIKE :word", word: "%#{w}%")
      @pages = @pages.where(Page.arel_table[search_type].matches("%#{w}%"))
    end
  end
end
