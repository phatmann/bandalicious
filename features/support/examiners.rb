After('@leave_the_window_open') do |scenario|
  if scenario.respond_to?(:status) && scenario.status == :failed
    print "Step Failed. Press Return to close browser"
    STDIN.getc
  end
end