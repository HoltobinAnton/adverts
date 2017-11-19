class CheckoutAddress < Rectify::Command
  def initialize(params)
    puts 'params ----------------------------------------'
    @params = params
    p @params
    puts 'params ----------------------------------------'
    p params[:address]
    @params = params[:address]
    @user = User.last
    puts 'params ----------------------------------------'

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
    puts "*******************8"
    p address_form
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