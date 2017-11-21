module SupportParams
  def address_params
    { address: { state: 'TestState', country: 'country', city: 'city',
                 address: 'addresstest', zip: '49000' } }
  end

  def personal_params
    { user: { login: 'test', email: 'email@gmail.com', password: '123456',
              password_confirmation: '123456', birthday: '>Sun, 19 Nov 2017',
              full_name: 'fwafwfw', role_id: '1' } }
  end

  def missing_params
    { user: {} }
  end
end