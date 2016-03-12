# require 'rails_helper'

# feature 'Omniauth', type: :feature do
#   context 'OAuth' do
#     describe 'Facebook' do
#       it 'can login' do
#         OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
#           provider: 'facebook',
#           uid: Faker::Number.number(8),
#           info: {
#             email: Faker::Internet.email
#           }
#         )
#         visit new_user_session_path
#         expect { click_link 'Sign in with Facebook' } .to change(User, :count)
#           .by 1
#       end
#       it 'redirects back when email is not present' do
#         OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
#           provider: 'facebook',
#           uid: Faker::Number.number(8),
#           info: {
#           }
#         )
#         visit new_user_session_path
#         # click_link 'Sign in with Facebook'
#         expect { click_link 'Sign in with Facebook' }
#           .to raise_error(Capybara::InfiniteRedirectError)
#       end
#     end
#     describe 'GitHub' do
#       it 'can login' do
#         OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
#           provider: 'github',
#           uid: Faker::Number.number(8),
#           info: {
#             email: Faker::Internet.email
#           }
#         )
#         visit new_user_session_path
#         expect { click_link 'Sign in with GitHub' }.to change(User, :count).by 1
#       end
#     end
#     context 'Already signed in once' do
#       before :each do
#         email = Faker::Internet.email
#         OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
#           provider: 'github',
#           uid: Faker::Number.number(8),
#           info: {
#             email: email
#           }
#         )
#         OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
#           provider: 'facebook',
#           uid: Faker::Number.number(8),
#           info: {
#             email: email
#           }
#         )
#         visit new_user_session_path
#         click_link 'Sign in with Facebook'
#         click_link 'Log out'
#         visit new_user_session_path
#       end

#       describe 'Multi Scope Authentication' do
#         it 'Logs in from different scope without a new user' do
#           expect { click_link 'Sign in with GitHub' }
#             .to change(User, :count).by 0
#         end
#         it 'adds a fresh Identity' do
#           expect { click_link 'Sign in with GitHub' }
#             .to change(Identity, :count).by 1
#         end
#       end

#       describe 'Returning Users' do
#         it 'logs them in without creating a new user' do
#           expect { click_link 'Sign in with Facebook' }
#             .to change(User, :count).by 0
#         end
#         it 'logs them in without creating a new identity do' do
#           expect { click_link 'Sign in with Facebook' }
#             .to change(Identity, :count).by 0
#         end
#       end
#     end

#     describe 'Failed OAuth' do
#       before :each do
#         %w(facebook github).each do |name|
#           OmniAuth.config.mock_auth[name.to_sym] = OmniAuth::AuthHash.new(
#             info: {
#               email: Faker::Internet.email
#             }
#           )
#           visit new_user_session_path
#         end
#       end

#       it 'doesn\'t create a new GH user' do
#         expect { click_link 'Sign in with GitHub' } .to change(User, :count).by 0
#       end
#       it 'doesn\'t create a new FB user' do
#         expect { click_link 'Sign in with Facebook' } .to change(User, :count).by 0
#       end
#     end
#   end
# end
