class AdminUsersController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

  def index
    @admin_users = AdminUser.sorted(:last_name).sorted(:first_name)
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_params)
    if @admin_user.save
      flash[:notice] = "New Admin created"
      redirect_to(admin_users_path)
    else
      logger.debug(@admin_user.errors.full_messages)
      flash[:notice] = @admin_user.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update(admin_params)
      flash[:notice] = "Admin Updated"
      redirect_to(admin_users_path)
    else
      flash[:notice] = "error updating user"
      render 'edit'
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy
    flash[:notice] = "#{@admin_user.user_name} successfully deleted"
    redirect_to(admin_users_path)
  end


  private

  def admin_params
    params.require(:admin_user).permit(
        :first_name, :last_name, :user_name, :password, :email)
  end
end
