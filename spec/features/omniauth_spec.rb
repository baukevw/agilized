require 'rails_helper'

feature "Omniauth", :type => :feature do
  context 'OAuth' do
    describe 'Facebook' do
      it 'can login' do
        OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
            {
                info: {
                    provider: 'facebook',
                    uid: Faker::Number.number(8),
                    email: Faker::Internet.email
                }
            }
        )
        visit new_user_session_path
        expect { click_link 'Sign in with Facebook' } .to change(User, :count)
                                                              .by (1)
      end
      it 'redirects back when email is not present' do
        OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
            {
                info: {
                    provider: 'facebook',
                    uid: Faker::Number.number(8),
                }
            }
        )
        visit new_user_session_path
        # click_link 'Sign in with Facebook'
        expect { click_link 'Sign in with Facebook' }
            .to raise_error(Capybara::InfiniteRedirectError)
      end

    end
  end
end
