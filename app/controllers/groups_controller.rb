class GroupsController < ApplicationController
  permits :user_id, :name, :default_flag

  # 作成
  def create(group)
    group = Group.new(group.permit!)
    group.user_id = current_user.id

    if group.save
      message = { notice: "グループを作成しました。" }
    else
      message = { alert: "グループの作成に失敗しました。" }
    end

    redirect_to my_library_path, message
  end

  # 編集
  def edit(id)
    @group = Group.mine(current_user).find_by(id: id)
  end

  # 更新
  def update(id, group)
    @group = Group.mine(current_user).find_by(id: id)

    if @group.update(group)
      message = { notice: "グループを更新しました。" }
    else
      message = { alert: "グループの更新に失敗しました。" }
    end

    redirect_to( { controller: "my", action: "library", anchor: "group_#{@group.id}" }, message )
  end

  # 削除
  def delete(id)
    group = Group.mine(current_user).find_by(id: id)
    group.destroy

    redirect_to my_library_path
  end

  # def members
  #   @group = Group.where( id: params[:id] ).includes( :users ).order( "group_members.created_at ASC" ).first

  #   if @group.blank?
  #     redirect_to( :root, alert: "該当するグループがありません。" ) and return
  #   end
  # end

  # #-------------#
  # # member_list #
  # #-------------#
  # def member_list
  #   exist_members = GroupMember.where( group_id: params[:group_id] ).pluck(:user_id)

  #   users = User.order( "screen_name ASC" )
  #   users = users.where( "id NOT IN ( #{exist_members.join(',')} )" ) unless exist_members.blank?
  #   users = users.limit(100).map{ |u| { id: u.id, name: u.screen_name } }.delete_if{ |x| x[:name].downcase.index( params[:q] ).nil? }

  #   respond_to do |format|
  #     format.json { render json: users }
  #   end
  # end

  # #------------#
  # # add_member #
  # #------------#
  # def add_member
  #   group = params[:group]

  #   if group.blank?
  #     redirect_to( { action: "index" }, alert: "グループ情報がありません。" ) and return
  #   else
  #     user_ids = group[:group_members].split(",")

  #     if user_ids.blank?
  #       redirect_to( { action: "members", id: group[:id] }, alert: "メンバーを入力して下さい。" ) and return
  #     end

  #     user_ids.each{ |user_id|
  #       GroupMember.create( group_id: group[:id], user_id: user_id )
  #     }

  #     redirect_to( action: "members", id: group[:id] ) and return
  #   end
  # end

  # #---------------#
  # # delete_member #
  # #---------------#
  # def delete_member
  #   member = GroupMember.where( group_id: params[:group_id], user_id: params[:user_id] ).first
  #   member.destroy

  #   redirect_to( action: "members", id: params[:group_id] ) and return
  # end

end
