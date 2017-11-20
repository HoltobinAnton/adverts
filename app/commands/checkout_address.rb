class CheckoutAddress < Rectify::Command
  def initialize(params)
    @params = params[:address]
    @user = User.last
  end

  attr_reader :params

  def call
    return broadcast :invalid if address_form.invalid?
    transaction do
      create_address
    end
    broadcast :valid, @address
  end

  private

  def create_address
    @address = Address.create(address_form.to_h)
  end

  def address_form
    AddressForm.new(city: params[:city],
                    country: params[:country],
                    address: params[:address],
                    state: params[:state],
                    zip: params[:zip],
                    user_id: @user.id)
  end

  def address_params
    params.merge(user_id: @user.id)
  end
end