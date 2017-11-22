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

  def valid_comment
    { comment: { description: 'testdescription', advert_id: advert.id,
                 user_id: user.id } }
  end

  def invalid_comment
    { comment: { description: 'test', advert_id: 0,
                 user_id: 0 } }
  end

  def valid_advert
   { advert: { description: 'test', user_id: user.id, avatar: 'test.jpg'}}
  end
end