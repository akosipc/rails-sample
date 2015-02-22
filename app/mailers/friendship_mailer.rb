class FriendshipMailer < ActionMailer::Base

  def requesting(requester, requestee, options = {})
    @requester = requester
    @requestee = requestee
    @options = options

    mail  to:       @requestee.email,
          from:     Rails.application.secrets.no_reply_email,
          subject:  "#{@requester.full_name} wants to be friends on RigPirate"
  end

  def confirmed(requester, requestee, options = {})
    @requester = requester
    @requestee = requestee
    @options = options

    mail  to:       @requestee.email,
          from:     Rails.application.secrets.no_reply_email,
          subject:  "#{@requester.full_name} has confirmed your friend request"
  end

end
