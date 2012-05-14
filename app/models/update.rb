class Update < ActiveRecord::Base
  attr_accessible :body, :user_id, :subject
  belongs_to :user
  after_create :send_to_teammates

  def self.create_from_postmark(request)
      email = Postmark::Mitt.new(request.read)
    if email.from_email.match /@#{Settings.domain}/
      update = new
      update.subject = email.subject
      unless email.html_body
        update.body = email.text_body
      else
        update.body = email.html_body
      end
      update.user = User.find_or_create_by_email(email.from_email)
      update.save
      update
    else
      return false
    end
  end

  def self.send_to_teammates
    self.user.send_update_to_teamates(self)
  end
end
