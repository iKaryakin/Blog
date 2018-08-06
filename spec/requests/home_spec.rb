require 'rails_helper'

# module AuthHelper
#     def http_login
#       user = 'username'
#       pw = 'password'
#       request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
#     end
#   end
  

describe ArticlesController, :type => :controller do
    # before(:each) do
    #     @controller = ArticlesController.new
    # end
    # @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("dhh:secret")
    # page.driver.browser.authorize 'dhh', 'secret'
    # it 'does something' do
    #     credentials = ActionController::HttpAuthentication::Basic.encode_credentials 'dhh', 'secret'
    #     request.env['HTTP_AUTHORIZATION'] = credentials
    # end
    it 'visits new and creates an article' do
        credentials = ActionController::HttpAuthentication::Basic.encode_credentials 'dhh', 'secret'
        request.env['HTTP_AUTHORIZATION'] = credentials

        get "new"
        assert_response :success

        post "create",
            params: { article: { slug: "can_create", title: "can create", text: "article successfully." } }
        assert_response :redirect
        # assert_response :success
        # follow_redirect!
        response.should redirect_to("/articles/can_create")
        assert_response :redirect
        # assert_select "p", "Title:\n  can create"
    end
end


# RSpec.describe "GET '/users' - from API", :type => :feature do
#     it 'checks the first user in the database' do
#       visit('http://localhost:3000')
#       expect(page).to have_content("Rails")
#       puts 'cool, rails is in the house!'
#     end
#   end