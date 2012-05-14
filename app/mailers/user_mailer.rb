class UserMailer < ActionMailer::Base
  default :from "status@dispatch.io"

  def statusUpdate(args)
    mail(:to => args[:email], :subject => args[:subject], :from => args[:from])
    render :text => args[:body]
  end
end
