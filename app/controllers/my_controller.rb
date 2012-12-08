# coding: utf-8
class MyController < ApplicationController

  #---------#
  # library #
  #---------#
  def library( controller, action )
    @active = { "#{controller}_#{action}" => "active" }

    @user = User.where( id: session[:user_id] ).first
    @groups = Group.where( user_id: session[:user_id] ).includes( :pages ).order( "groups.name ASC, pages.title ASC" ).all
    @group  = Group.new
  end

  #--------#
  # search #
  #--------#
  # 検索
  def search( word, search_type )
    if word.blank? or search_type.blank?
      redirect_to my_library_path and return
    end

    # 半角スペースor全角スペースで分割する
    words = word.split(/ |　/)
    words.each{ |w|
#      @pages = Page.where( "pages.title LIKE :word OR pages.content LIKE :word", word: "%#{w}%" )
      @pages = Page.where( "pages.#{search_type} LIKE :word", word: "%#{w}%" )
    }
    puts "[ ---------- @pages ---------- ]" ; @pages.to_sql.tapp ;
  end

  #--------------#
  # create_group #
  #--------------#
  def create_group
    group = Group.new( params[:group] )
    group.user_id = session[:user_id]

    if group.save
      GroupMember.create( group_id: group.id, user_id: group.user_id )
      message = { notice: "グループを作成しました。" }
    else
      message = { alert: "グループの作成に失敗しました。" }
    end

    redirect_to( { action: "library" }, message )
  end

  #--------------#
  # delete_group #
  #--------------#
  def delete_group
    group = Group.where( id: params[:id], user_id: session[:user_id] ).first
    group.destroy

    redirect_to( action: "library" )
  end
end
