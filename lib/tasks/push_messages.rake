namespace :push_messages do
  desc "move to next message"
  task :pacem => :environment do
    t = Time.now
    if !t.saturday? && !t.sunday?
    # grab all users
      users = User.all
      # send messages to users
      users.each do |u|
        if u.active?
          # reschedule reminders
          u.sendpacemessage
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

  task :foodm => :environment do
    t = Time.now
    if !t.saturday? && !t.sunday?
    # grab all users
      users = User.all
      # send messages to users
      users.each do |u|
        if u.active?
          # reschedule reminders
          u.sendfoodmessage
        end
      end
    end
  end
end
