# coding: utf-8
class UsersController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @users = User.order( "id DESC" ).page( params[:page] ).per( 500 ).all
  end

  #---------#
  # library #
  #---------#
  def library
    @user = User.where( id: params[:id] ).first

    @groups = Group.where( user_id: @user.id ).includes( :pages ).order( "groups.name ASC, pages.title ASC" ).all
    @group  = Group.new
  end

  #--------------#
  # create_group #
  #--------------#
  def create_group
    group = Group.new( params[:group] )
    group.user_id = session[:user_id]

    if group.save
      message = { notice: "グループを作成しました。" }
    else
      message = { alert: "グループの作成に失敗しました。" }
    end

    redirect_to( { action: "library", id: session[:user_id] }, message )
  end

end
