class GroupsController < ApplicationController
  permits :user_id, :name, :default_flag

  # 作成
  def create(group)
    group = Group.new(group.permit!)
    group.user_id = current_user.id

    if group.save
      # message = { notice: "グループを作成しました。" }
      message = { notice: "" }
    else
      message = { alert: "グループの作成に失敗しました。" }
    end

    redirect_to my_library_path, message
  end

  # 詳細
  def show(id)
    @group = Group.includes(:pages).mine(current_user).find_by(id: id)
  end

  # 編集
  def edit(id)
    @group = Group.mine(current_user).find_by(id: id)
  end

  # 更新
  def update(id, group)
    @group = Group.mine(current_user).find_by(id: id)

    if @group.update(group)
      # message = { notice: "グループを更新しました。" }
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
