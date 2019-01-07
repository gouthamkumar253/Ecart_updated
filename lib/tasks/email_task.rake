desc 'send digest email'
task send_digest_email: :environment do
  # ... set options if any
  @users= User.all
  @users.each do |user|
  	UsermailMailer.digest_email(user).deliver!
	end
end