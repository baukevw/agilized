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
    describe 'GitHub' do
      it 'can login' do
        OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
            {
                info: {
                    provider: 'github',
                    uid: Faker::Number.number(8),
                    email: Faker::Internet.email
                }
            }
        )
        visit new_user_session_path
        expect { click_link 'Sign in with GitHub' }.to change(User, :count).by 1
      end
    end

    describe 'Multi Scope Authentication' do
      it 'can authenticate from multiple sources' do
        OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
            {
                info: {
                    provider: 'github',
                    uid: Faker::Number.number(8),
                    email: 'same@example.org'
                }
            }
        )
        OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
            {
                info: {
                    provider: 'facebook',
                    uid: Faker::Number.number(8),
                    email: 'same@example.org'
                }
            }
        )
        visit new_user_session_path
        click_link 'Sign in with Facebook'
        click_link 'Log out'
        visit new_user_session_path
        expect { click_link 'Sign in with GitHub' } .to change(User, :count).by 0
        puts Identity.all.inspect
      end
    end
  end
end
