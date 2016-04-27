class NotificationsController < ApplicationController
respond_to :json

  def create

    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    text_destination = params[:phone]
    text_amount = params[:price]
    text_amount = ((text_amount.to_f*100).to_i)/100.00

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => '+15138959488',
      :to => text_destination,
      :body => "Hey, buddy, you owe someone $#{text_amount} so you better pay up!",
      :media_url => 'http://farm2.static.flickr.com/1075/1404618563_3ed9a44a3a.jpg'
    })
    render nothing: true, status: 200, content_type: "json"

  end


end
