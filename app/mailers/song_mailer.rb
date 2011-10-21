class SongMailer < ActionMailer::Base
  def setlist_email(band, recipients, setlist)
    @setlist_name = "Setlist for #{setlist.name}"
    @setlist_name << " (#{setlist.date.to_formatted_s(:long)})" if setlist.date
    @setlist = setlist
    mail(:from => band.email, :to => recipients, :subject => @setlist_name)
  end
end
