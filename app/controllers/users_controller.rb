class UsersController < ApplicationController
  load_and_authorize_resource only: [:update, :destroy, :edit]
  include Wicked::Wizard

  steps :personal, :address

  def new
    redirect_to wizard_path(steps.first)
  end

  def show
    render_wizard
  end

  def edit
    @user = User.find(params[:address][:user_id])
    CheckoutAddress.call(params) unless params[:address].nil?
  end

  def update
    @user = current_user
    if @user.update(user_params)
      bypass_sign_in(@user)
      flash[:success] = t('flash.user.success')
      redirect_to root_path
    else
      render :edit
    end
  end

  def look_at
    @user = User.find(params[:format])
  end

  def create
    case step
    when :personal
      CheckoutPersonal.call(params) do
        on(:invalid) { render_wizard }
        on(:valid) { redirect_to next_wizard_path }
      end
    when :address
      CheckoutAddress.call(params) do
        on(:invalid) { redirect_to wizard_path step }
        on(:valid) do |address|
          sign_in(address.user)
          redirect_to root_path
        end
      end
    end
  end

  def show_users
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation,
                                 :email, :login, :full_name, :birthday)
  end
end