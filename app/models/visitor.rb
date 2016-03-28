class Visitor
	include ActiveModel::Model
	attr_accessor :email, :string
	validates_presence_of :email
	validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

  def subscribe
    mailchimp = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
    list_id = Rails.application.secrets.mailchimp_list_id
    Rails.logger.debug("*"*40)
    Rails.logger.debug("mailchimp #{mailchimp.inspect}")
    Rails.logger.debug("*"*40)
   
    Rails.logger.debug("list_id #{list_id.inspect}")
    Rails.logger.debug("*"*40)

    result = mailchimp.lists(list_id).members.create(
      body: {
        email_address: self.email,
        status: 'subscribed'
    })
    Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
  end

end

# 	def subscribe
# 		mailchimp = Gibbon::API.new(Rails.application.secrets.mailchimp_api_key)
# 		result = mailchimp.lists.subscribe({
# 			:id => Rails.application.secrets.mailchimp_list_id,
# 			:email => {:email => self.email},
# 			:double_optin => false,
# 			:update_existing => true,
# 			:send_welcome => true
# 			})
# 		Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
# 	end
# end