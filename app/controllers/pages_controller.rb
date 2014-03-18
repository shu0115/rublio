class PagesController < ApplicationController
  permits :user_id, :group_id, :title, :content

  def index(group_id)
    @pages = Page.where(group_id: group_id).mine(current_user).includes(:user, :group)
    @group = Group.find_by(id: group_id, user_id: current_user.id)
  end

  def show(id)
    @page = Page.includes(:group).mine(current_user).find_by(id: id)

    redirect_to :root, alert: '該当するページがありません。' and return if @page.blank?
  end

  def new(group_id)
    @group = Group.mine(current_user).find_by(id: group_id)
    @page = Page.new
  end

  def edit(id)
    @page   = Page.includes(:group).mine(current_user).find_by(id: id)
    @groups = Group.where(user_id: current_user.id).order("name ASC")
  end

  def create(page, group_id)
    page = Page.new(page.permit!)
    page.user_id  = current_user.id
    page.group_id = group_id

    if page.save
      message = { notice: 'ページを作成しました。' }
    else
      message = { alert: 'ページの作成に失敗しました。' }
    end

    redirect_to page_path(page), message
  end

  def update(id, page)
    @page = Page.mine(current_user).find_by(id: id)

    if @page.update(page.permit!)
      # message = { notice: "ページを更新しました。" }
      message = { notice: '' }
    else
      message = { alert: 'ページの更新に失敗しました。' }
    end

    redirect_to page_path(@page), message
  end

  def destroy(id)
    page = Page.mine(current_user).find_by(id: id)
    page.destroy

    redirect_to my_library_path(anchor: "group_#{page.group_id}")
  end
end
