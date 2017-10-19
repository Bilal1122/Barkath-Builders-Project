class DeletionService

  def initialize(user_id)
    @user = User.find_by(id: user_id)
    @user_name = @user.name if @user.present?
    @success = false
  end

  def hard_delete
    if @user.present?
      @user.destroy
      @success = true
    end
    return {success: @success, user_name: @user_name, hard_del: true}
  end

  def soft_delete
    # binding.pry
    if @user.present?
      @user.update(deleted_at: Time.now)
      @success = true
    end
    # binding.pry
    return {success: @success, user_name: @user_name, hard_del: false}
  end
end