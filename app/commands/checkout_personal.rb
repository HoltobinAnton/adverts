class CheckoutPersonal < Rectify::Command
  def initialize(params)
    @params = params
  end

  attr_reader :params

  def call
    return broadcast :invalid if personal_form.invalid?
    transaction do
      set_user
    end
    broadcast :valid, @user
  end

  private

  def set_user
    @user = User.create(personal_form.to_h)
  end

  def personal_form
    @personal_form ||= PersonalForm.from_params(params[:user])
  end
end