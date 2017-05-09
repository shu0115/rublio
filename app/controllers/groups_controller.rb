class GroupsController < ApplicationController
  permits :user_id, :name, :default_flag

  # 作成
  def create(group: nil, search: nil, create: nil)
    if search.present?
      redirect_to my_library_path(group_name: group[:name]) and return
    elsif create.present?
      group = Group.new(group.permit!)
      group.user_id = current_user.id
      group.save!
    end

    redirect_to group_path(group)
  end

  # 詳細
  def show(id)
    @group = Group.includes(:pages).mine(current_user).order("pages.title ASC").find_by(id: id)
  end

  # 編集
  def edit(id)
    @group = Group.mine(current_user).find_by(id: id)
  end

  # 更新
  def update(id, group)
    @group = Group.mine(current_user).find_by(id: id)

    if @group.update(group)
      message = { notice: "" }
    else
      message = { alert: "グループの更新に失敗しました。" }
    end

    redirect_to group_path(@group)
  end

  # 削除
  def destroy(id)
    group = Group.mine(current_user).find_by(id: id)
    group.destroy

    redirect_to my_library_path
  end
end
