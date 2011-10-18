class SongMailer < ActionMailer::Base
  default from: "info@massyfergusonband.com"

  def setlist_email(recipient, setlist)
    @setlist_name = "Setlist for #{setlist.name}"
    @setlist_name << " (#{setlist.date.to_formatted_s(:long)})" if setlist.date
    @setlist = setlist
    mail(:to => recipient, :subject => @setlist_name)
  end
end
