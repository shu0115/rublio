class MyController < ApplicationController
  # ライブラリ
  def library( controller, action )
    @active = { "#{controller}_#{action}" => "active" }

    @user = User.where( id: session[:user_id] ).first
    @groups = Group.where( user_id: session[:user_id] ).includes( :pages ).order( "groups.name ASC, pages.title ASC" ).all
    @group  = Group.new
  end

  # 検索
  def search( word, search_type )
    if word.blank? or search_type.blank?
      redirect_to my_library_path and return
    end

    # 半角スペースor全角スペースで分割する
    words = word.split(/ |　/)
    words.each do |w|
      @pages = Page.where( "pages.#{search_type} LIKE :word", word: "%#{w}%" )
    end
  end
end
