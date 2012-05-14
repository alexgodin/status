class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :email
  default_value_for :password, Settings.default_password
  has_many :updates

  def self.send_update_to_teamates(update)
    (User.all - [self]).each do |user|
      UserMailer.statusUpdate.deliver( :email => user.email, :subject => update.subject, :from => self.email, :body => self.body)
    end
  end
end
