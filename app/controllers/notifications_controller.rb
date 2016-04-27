class NotificationsController < ApplicationController
respond_to :json

  def create

    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    # text_person = params['']


    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => '+15138959488',
      :to => '+15132953508',
      :body => 'Holy Crap, slice-it sends texts!',
      :media_url => 'http://farm2.static.flickr.com/1075/1404618563_3ed9a44a3a.jpg',
    })
    render nothing: true, status: 200, content_type: "json"

  end


end
