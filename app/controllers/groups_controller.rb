# coding: utf-8
class GroupsController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @groups = Group.where( user_id: session[:user_id] ).order( "name ASC" ).all
  end

  #--------#
  # update #
  #--------#
  def update
    group = Group.where( id: params[:id], user_id: session[:user_id] ).first

    if group.update_attributes( params[:group] )
      message = { notice: "グループ名を更新しました。" }
    else
      message = { alert: "グループ名の更新に失敗しました。" }
    end

    redirect_to( { action: "index" }, message )
  end

end
