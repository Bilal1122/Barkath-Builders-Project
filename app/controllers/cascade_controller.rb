class CascadeController < ApplicationController

  def index
    @users = User.all.where(deleted_at: nil).order(created_at: :asc)
    @soft_deleted_users = User.all.where.not(deleted_at: nil).order(created_at: :asc)
  end

  def hard_delete
    response = DeletionService.new(params[:user_id]).hard_delete
    redirect_to cascade_index_path(response)
  end

  def soft_delete
    response = DeletionService.new(params[:user_id]).soft_delete
    redirect_to cascade_index_path(response)
  end

  def undo_soft_delete
    user = User.find_by(id: params[:user_id])
    user.update(deleted_at: nil) if user.present?
    redirect_to cascade_index_path
  end
end
