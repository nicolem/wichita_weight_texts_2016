namespace :push_messages do
  desc "move to next message"
  task :pm => :environment do
    t = Time.now
    if !t.saturday? && !t.sunday?
    # grab all users
      users = User.all
      # send messages to users
      users.each do |u|
        if u.active?
          # reschedule reminders
          u.sendmessage
          u.next_message = u.next_message + 1
          u.save!
          if(u.next_message==11)
            u.sendmiddlemessage
          end
          if(u.next_message>=31)
            u.active = false
            u.save!
            u.sendlastmessage
          end
        end
      end
    end
  end
end