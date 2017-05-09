class MyController < ApplicationController
  def library(controller: nil, action: nil, group_name: nil)
    @active = { "#{controller}_#{action}" => "active" }
    @groups = Group.where(user_id: current_user.id).order('groups.name ASC').references(:pages)
    @groups.where!("groups.name LIKE :name", name: "%#{group_name}%") if group_name.present?
    @group  = Group.new
  end

  def search(word: nil, search_type: nil, title: nil, content: nil)
    redirect_to my_library_path and return if word.blank?

    @pages = Page.all

    # 半角スペースor全角スペースで分割する
    word.split(/ |　/).each do |w|
      # 大文字小文字区別なしAND検索
      if title.present?
        @pages.where!("pages.title LIKE :word", word: "%#{w}%")
      elsif content.present?
        @pages.where!("pages.content LIKE :word", word: "%#{w}%")
      end
    end
  end
end
