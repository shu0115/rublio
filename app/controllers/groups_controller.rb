# coding: utf-8
class GroupsController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @groups = Group.where( user_id: session[:user_id] ).order( "name ASC" ).all
    @group  = Group.new
  end

  #------#
  # show #
  #------#
  def show
    @group = Group.where( id: params[:id] ).first
  end

  #--------#
  # create #
  #--------#
  def create
    group = Group.new( params[:group] )
    group.user_id = session[:user_id]

    if group.save
      message = { notice: "グループを作成しました。" }
    else
      message = { alert: "グループの作成に失敗しました。" }
    end

    redirect_to( { action: "index" }, message )
  end

  #------#
  # edit #
  #------#
  def edit
    @group = Group.where( id: params[:id], user_id: session[:user_id] ).first
  end

  #--------#
  # update #
  #--------#
  def update
    group = Group.where( id: params[:id], user_id: session[:user_id] ).first

    if group.update_attributes( params[:group] )
      message = { notice: "グループを更新しました。" }
    else
      message = { alert: "グループの更新に失敗しました。" }
    end

    redirect_to( { action: "show", id: group.id }, message )
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    group = Group.where( id: params[:id], user_id: session[:user_id] ).first
    group.destroy

    redirect_to( action: "index" )
  end

end
