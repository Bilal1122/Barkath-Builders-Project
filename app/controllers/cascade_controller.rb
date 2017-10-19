class CascadeController < ApplicationController
  # protect_from_forgery with: :exception
  def index
    @users = User.all.where(deleted_at: nil)
    @soft_deleted_users = User.all.where.not(deleted_at: nil)
  end

  def hard_delete
    user = User.find_by(id: params[:user_id])
    if user.present?
      user_name = user.name
      user.destroy
      sucess = true
    else
      sucess = false
    end
    redirect_to cascade_index_path(user_name:user_name,sucess: sucess, hard_del: true)
  end

  def soft_delete
    user = User.find_by(id: params[:user_id])
    if user.present?
      user_name = user.name
      user.update(deleted_at: Time.now)
      sucess = true
    else
      sucess = false
    end
    redirect_to cascade_index_path(user_name:user_name, sucess: sucess, hard_del: false)
  end
end
