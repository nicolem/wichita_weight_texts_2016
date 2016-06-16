class User < ActiveRecord::Base
  has_many :histories, dependent: :destroy
  require 'phony'
  def convert_to_e164(raw_phone)
    Phony.format(
        raw_phone,
        :format => :international,
        :spaces => ''
    ).gsub(/\s+/, "") # Phony won't remove all spaces
  end

  def get_group
    if self.score == 1
      return "A"
    elsif self.score > 1 and self.score < 5
      return "B"
    elsif self.score > 4
      return "C"
    end
  end

  def sendpacemessage
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    group = self.get_group
    if group =="A"
      text_str = AMessage.find(self.next_message).text
    elsif group == "B"
      text_str = BMessage.find(self.next_message).text
    elsif group =="C"
      text_str = CMessage.find(self.next_message).text
    end
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => self.phone,
      :body => text_str,
    )
    puts message.to

    #add reminder sent time to history
    note = History.new(:user_id => self.id, :message => "Message ##{self.next_message} sent")
    note.save

  end

  def sendfoodmessage
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    text_str = Message.find(self.next_message).text
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => self.phone,
      :body => text_str,
    )
    puts message.to

    #add reminder sent time to history
    note = History.new(:user_id => self.id, :message => "Message ##{self.next_message} sent")
    note.save

  end

  def sendmiddlemessage
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => ENV['RESEARCHER_PHONE'],
      :body => "Research subject ##{self.id} has finished the first two weeks of the study; bring them in for asssessment for another PACE score.",
    )
  end

  def sendlastmessage
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    text_str = "You have completed the study"
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => self.phone,
      :body => text_str,
    )
    puts message.to

    #add reminder sent time to history
    note = History.new(:user_id => self.id, :message => "Study completed ")
    note.save

    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => ENV['RESEARCHER_PHONE'],
      :body => "Research subject ##{self.id} has completed the study",
    )
  end

  def when_to_run
    time
  end

#   handle_asynchronously :sendmessage
end
