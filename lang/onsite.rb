class << please = Object.new
  def us
    puts "Send your resume to: jruby-#{yield}@on-site.com"
  end
end

if your_resume = "rocks"
  please.send(:us) { your_resume }
end
