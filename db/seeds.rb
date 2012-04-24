# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create({{ name: 'Chicago' }, { name: 'Copenhagen' }}})
#   Mayor.create(name: 'Emanuel', city: cities.first)

# puts ' *** Empty the MongoDB database ***'
# Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

if Spree::User.first.blank?
  puts ' *** Setting up default user login ***'
  # u = Spree::User.create! name: 'Isaac Wooten', username: 'levid', email: 'i.wooten@gmail.com', password: 'wooteni', password_confirmation: 'wooteni', :confirmed_at => DateTime.now
  u = Spree::User.create! name: 'Isaac Wooten', username: 'levid', email: 'i.wooten@gmail.com', password: 'wooteni', password_confirmation: 'wooteni'
  u.add_role :admin
  u.save!
  puts 'New user created: ' << u.name
end

puts ' *** Setting up Rims ***'
for i in 1..7
   unless defined?(u)
    u = Spree::User.find(1)
   end
     
   ImageUploader.enable_processing = true
   
   @image = File.open(File.join(Rails.root,"/app/assets/images/img-home-rim-large#{i}.png"))
   # @image.store!(File.open(File.join(Rails.root,"/app/assets/images/img-home-rim-large#{i}.png")))
   
   @medium_image = File.open(File.join(Rails.root, "/app/assets/images/img-rim-medium#{i}.png"))
   
   # @medium_image = ImageUploader.create! :medium_image => 
   # @medium_image.store!(File.open(File.join(Rails.root, "/app/assets/images/img-rim-medium#{i}.png")))
   
   @small_image = File.open(File.join(Rails.root,"/app/assets/images/img-rim-small#{i}.png"))
   # @small_image = ImageUploader.new u, :small_image
   # @small_image.store!(File.open(File.join(Rails.root,"/app/assets/images/img-rim-small#{i}.png")))

   r = Rim.create!(title: "Rim #{i}", color: "Silver", description: "This is the description for Rim #{i}", size: '24 Inches', fitting: '22x10', image: @image, medium_image: @medium_image, small_image: @small_image)
   # r.title        = "Rim #{i}"
   #   r.color        = "Silver"
   #   r.description  = "This is the description for Rim #{i}"
   #   r.size         = '24 Inches'
   #   r.fitting      = '22x10'
   #   r.image        = @image
   #   r.medium_image = @medium_image
   #   r.small_image  = @small_image
   # r.save!

   puts 'New Rim created: ' << r.title
end

puts ' *** Setting up Contents ***'
Content.create! title: "Pure Titanium Alloy", sub_title: "The world's most technologically advanced rims.", resource_type: "technology", description: "It has been long thought desirable to decorate one's automobile by the addition of decorative wheels. It has further been thought desirable to communicate with others by means of addressable electronic displays. The concept of combining decorative automobile wheels with an addressable electronic display is a relatively new one which produces novel and visually interesting results."
Content.create! title: "Integrated Computer Chip", sub_title: "Sub title goes here", resource_type: "technology", description: "Description goes here"
Content.create! title: "Color Customization", sub_title: "Sub title goes here", resource_type: "technology", description: "Description goes here"
Content.create! title: "LED Lights System", sub_title: "Sub title goes here", resource_type: "technology", description: "Description goes here"
Content.create! title: "Power Generator", sub_title: "Sub title goes here", resource_type: "technology", description: "Description goes here"
Content.create! title: "All-Weather Proof USB Port", sub_title: "Sub title goes here", resource_type: "technology", description: "Description goes here"
Content.create! title: "Pendulum Arm", sub_title: "Sub title goes here", resource_type: "technology", description: "Description goes here"

puts ' *** Setting up Privacy Policy ***'
Privacy.create! title: "test", content: %{<div> <h2>What information do we collect?</h2> <br> <br>We collect information from you when you register on our site or place an order. <br> <br>When ordering or registering on our site, as appropriate, you may be asked to
enter your: name, e-mail address, mailing address, phone number or credit card information. You may, however, visit our site anonymously. <br> <br> <strong>What do we use your information for?</strong> <br> <br>Any of the
information we collect from you may be used in one of the following ways: <br> <br>; To personalize your experience<br>(your information helps us to better respond to your individual needs) <br> <br>; To improve our
website<br>(we continually strive to improve our website offerings based on the information and feedback we receive from you) <br> <br>; To improve customer service<br>(your information helps us to more effectively respond to
your customer service requests and support needs) <br> <br>; To process transactions <br> <blockquote>Your information, whether public or private, will not be sold, exchanged, transferred, or given to any other company for any
reason whatsoever, without your consent, other than for the express purpose of delivering the purchased product or service requested.</blockquote> <br>; To send periodic emails <br> <blockquote>The email address you provide
for order processing, will only be used to send you information and updates pertaining to your order.</blockquote> <br> <br> <strong>How do we protect your information?</strong> <br> <br>We implement a variety of security
measures to maintain the safety of your personal information when you place an order or enter, submit, or access your personal information. <br> <br>We offer the use of a secure server. All supplied sensitive/credit
information is transmitted via Secure Socket Layer (SSL) technology and then encrypted into our Payment gateway providers database only to be accessible by those authorized with special access rights to such systems, and are
required to?keep the information confidential. <br> <br>After a transaction, your private information (credit cards, social security numbers, financials, etc.) will not be kept on file for more than 60 days. <br> <br>
<strong>Do we use cookies?</strong> <br> <br>Yes (Cookies are small files that a site or its service provider transfers to your computers hard drive through your Web browser (if you allow) that enables the sites or service
providers systems to recognize your browser and capture and remember certain information <br> <br> We use cookies to help us remember and process the items in your shopping cart and understand and save your preferences for
future visits. <br> <br> <strong>Do we disclose any information to outside parties?</strong> <br> <br>We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information. This does not
include trusted third parties who assist us in operating our website, conducting our business, or servicing you, so long as those parties agree to keep this information confidential. We may also release your information when
we believe release is appropriate to comply with the law, enforce our site policies, or protect ours or others rights, property, or safety. However, non-personally identifiable visitor information may be provided to other
parties for marketing, advertising, or other uses. <br> <br> <strong>Childrens Online Privacy Protection Act Compliance</strong> <br> <br>We are in compliance with the requirements of COPPA (Childrens Online Privacy Protection
Act), we do not collect any information from anyone under 13 years of age. Our website, products and services are all directed to people who are at least 13 years old or older. <br> <br> <strong>Online Privacy Policy
Only</strong> <br> <br>This online privacy policy applies only to information collected through our website and not to information collected offline. <br> <br> <strong>Terms and Conditions</strong> <br> <br>Please also visit
our Terms and Conditions section establishing the use, disclaimers, and limitations of liability governing the use of our website at <a class="blue" href="http://www.dubleds.com">http://www.dubleds.com</a> <br> <br>
<strong>Your Consent</strong> <br> <br>By using our site, you consent to our <a href="http://www.freeprivacypolicy.com/" target="_blank">online privacy policy</a>. <br> <br> <strong>Changes to our Privacy Policy</strong> <br>
<br>If we decide to change our privacy policy, we will post those changes on this page. <br> <br> <strong>Contacting Us</strong> <br> <br>If there are any questions regarding this privacy policy you may contact us using the
information below. <br> <br>http://www.dubleds.com <br> <br>United States <br> <br> <span></span> <span></span>This policy is powered by Free Privacy Policy and Rhino Support <a href="http://www.rhinosupport.com"
target="_blank">helpdesk software</a>. <span></span> <span></span> <span></span> <!-- END PRIVACY POLICY CODE --> </div>}

Privacy.create! title: "test2", content: %{<div> <h2>What information do we collect?</h2> <br> <br>We collect information from you when you register on our site or place an order. <br> <br>When ordering or registering on our site, as appropriate, you may be asked to
enter your: name, e-mail address, mailing address, phone number or credit card information. You may, however, visit our site anonymously. <br> <br> <strong>What do we use your information for?</strong> <br> <br>Any of the
information we collect from you may be used in one of the following ways: <br> <br>; To personalize your experience<br>(your information helps us to better respond to your individual needs) <br> <br>; To improve our
website<br>(we continually strive to improve our website offerings based on the information and feedback we receive from you) <br> <br>; To improve customer service<br>(your information helps us to more effectively respond to
your customer service requests and support needs) <br> <br>; To process transactions <br> <blockquote>Your information, whether public or private, will not be sold, exchanged, transferred, or given to any other company for any
reason whatsoever, without your consent, other than for the express purpose of delivering the purchased product or service requested.</blockquote> <br>; To send periodic emails <br> <blockquote>The email address you provide
for order processing, will only be used to send you information and updates pertaining to your order.</blockquote> <br> <br> <strong>How do we protect your information?</strong> <br> <br>We implement a variety of security
measures to maintain the safety of your personal information when you place an order or enter, submit, or access your personal information. <br> <br>We offer the use of a secure server. All supplied sensitive/credit
information is transmitted via Secure Socket Layer (SSL) technology and then encrypted into our Payment gateway providers database only to be accessible by those authorized with special access rights to such systems, and are
required to?keep the information confidential. <br> <br>After a transaction, your private information (credit cards, social security numbers, financials, etc.) will not be kept on file for more than 60 days. <br> <br>
<strong>Do we use cookies?</strong> <br> <br>Yes (Cookies are small files that a site or its service provider transfers to your computers hard drive through your Web browser (if you allow) that enables the sites or service
providers systems to recognize your browser and capture and remember certain information <br> <br> We use cookies to help us remember and process the items in your shopping cart and understand and save your preferences for
future visits. <br> <br> <strong>Do we disclose any information to outside parties?</strong> <br> <br>We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information. This does not
include trusted third parties who assist us in operating our website, conducting our business, or servicing you, so long as those parties agree to keep this information confidential. We may also release your information when
we believe release is appropriate to comply with the law, enforce our site policies, or protect ours or others rights, property, or safety. However, non-personally identifiable visitor information may be provided to other
parties for marketing, advertising, or other uses. <br> <br> <strong>Childrens Online Privacy Protection Act Compliance</strong> <br> <br>We are in compliance with the requirements of COPPA (Childrens Online Privacy Protection
Act), we do not collect any information from anyone under 13 years of age. Our website, products and services are all directed to people who are at least 13 years old or older. <br> <br> <strong>Online Privacy Policy
Only</strong> <br> <br>This online privacy policy applies only to information collected through our website and not to information collected offline. <br> <br> <strong>Terms and Conditions</strong> <br> <br>Please also visit
our Terms and Conditions section establishing the use, disclaimers, and limitations of liability governing the use of our website at <a class="blue" href="http://www.dubleds.com">http://www.dubleds.com</a> <br> <br>
<strong>Your Consent</strong> <br> <br>By using our site, you consent to our <a href="http://www.freeprivacypolicy.com/" target="_blank">online privacy policy</a>. <br> <br> <strong>Changes to our Privacy Policy</strong> <br>
<br>If we decide to change our privacy policy, we will post those changes on this page. <br> <br> <strong>Contacting Us</strong> <br> <br>If there are any questions regarding this privacy policy you may contact us using the
information below. <br> <br>http://www.dubleds.com <br> <br>United States <br> <br> <span></span> <span></span>This policy is powered by Free Privacy Policy and Rhino Support <a href="http://www.rhinosupport.com"
target="_blank">helpdesk software</a>. <span></span> <span></span> <span></span> <!-- END PRIVACY POLICY CODE --> </div>}

puts ' *** Setting up Refund Policy ***'
Refund.create! title: "test", content: %{<div class="cnt"> <p style="margin-top:0px;"> <b class="boldTxt">Important information for corporate / business sellers regarding returns</b> </p> <p style="">Corporate / business sellers may be obliged to accept returns in
certain circumstances under Australian law, as described below. &nbsp;</p> <p style="margin-bottom: 0px;">Under the Trade Practices Act 1974 and state fair trading legislation, your return policy must allow a refund to a buyer
if the consumer goods you sold:</p> <ul style="margin-top: 6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">are or become defective through no fault of the buyer;</p> </div> </li> <li
class="unorderedList"> <div style="padding-left:4px;"> <p style="">are not for the purpose you stated or the purpose the buyer made known to you;</p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p
style="">don’t match your description or sample; or</p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">have defects that were not obvious or that you did not bring to the buyer's
attention.</p> </div> </li> </ul> <p style="">When a product does not meet the above requirements, the buyer can ask for a refund within a reasonable period of time. There is no set time limit for a buyer to obtain a refund.
You can ask a buyer for proof of purchase. You can also ask them to demonstrate that any problem with the goods was not their fault.</p> <p style=""> <b class="boldTxt">Note:</b> Even though eBay provides the ability for
sellers to state a time limit in their return policy, business sellers should <b class="boldTxt">not</b> do so as applicable legislation overrides any conditions you may state in your listing. Furthermore, you could be seen as
misleading buyers about their rights. For example, if your policy states ' No refunds after 7 days’ this may mislead consumers about their rights under applicable legislation. </p> <p style="">If the buyer prefers, you may
arrange for goods to be exchanged or repaired, or offer credit (at your discretion).</p> <p style="">You are not required to offer a refund if the buyer simply changes their mind. You should therefore encourage buyers to
choose carefully.</p> <p style="">For more information about warranties and refunds contact the ACCC Infocentre on 1300 302 502 or visit the ACCC website at www.accc.gov.au.&nbsp;</p> <p style="">The above information is
general in nature and is not intended to constitute legal advice.&nbsp; For advice specific to your circumstances, eBay recommends that you consult with a legal advisor.</p> <p style=""> <b class="boldTxt">Important
information for buyers: legal rights to obtain refunds</b> </p> <p style="">As described above, when consumer goods are purchased from sellers carrying on a business, the buyer has a legal right to return the goods to the
seller and obtain a refund if the goods are either faulty, not fit for their purpose (don't do what they are supposed to do), or do not match the seller's description or sample. To obtain a refund the buyer should return the
goods within a reasonable time and not dispose of, lose, destroy or damage the goods.&nbsp;</p> <p style=""> The <a href="www.accc.gov.au" target="_blank">Australian Competition and Consumer Commission website</a> <a
href="http://www.accc.gov.au"></a>contains more information on rights to refunds, under the section headed “Publications”. </p> <p style=""> <b class="boldTxt">A clear return policy can reassure buyers</b> </p> <p
style="">Even if you are not required by law to provide returns to your buyers, there are other good reasons for doing so.&nbsp;If you have a clear return policy, chances are you're more successful than other sellers on eBay.
eBay’s research shows that difficulty in returning items is the most common shopping barrier for buyers. So if you clearly spell out return policies in your listings you'll have an edge on the competition.</p> <p
style="">eBay’s research also shows that only a very small percentage of sold items are actually returned.</p> <p style="margin-bottom: 0px;"> <b class="boldTxt">Return policy options to consider:</b> </p> <ul
style="margin-top: 6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Refund</b>(for example, returns accepted for full money back or store credit if goods are faulty). </p> </div>
</li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">100% satisfaction guaranteed</b>(for example, returns accepted, no questions asked. Make sure you are prepared to do this). </p>
</div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Time limit</b>(for example, returns accepted within a reasonable time after the item is delivered). </p> </div> </li> </ul>
<p style=""> <b class="boldTxt">Mention the details up front</b> </p> <p style="margin-bottom: 0px;">Consider including details like the following to make your return policy clear and complete:</p> <ul style="margin-top:
6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Postage and handling charges:</b>Clearly state who would pay for return postage and handling, you or the buyer and if you will
refund the original postage charges. </p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Item condition:</b>Clearly state the condition of the returned item that would be
acceptable to you, for example, "unopened box" or "opened box with all original materials." </p> </div> </li> </ul> <p style=""> <b class="boldTxt">How to specify your return policy</b> </p> <p style="margin-bottom: 0px;">In
the Additional Information section of the Sell Your Item form, take the following steps:</p> <ul style="margin-top: 6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">Select "Returns accepted"</p>
</div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">Select the time limit within which the buyer must return the item to you.</p> </div> </li> <li class="unorderedList"> <div
style="padding-left:4px;"> <p style="">Select the type of refund you will give if the item is returned.</p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">Enter all other details about your
return policy in the Return Policy Details text box.</p> </div> </li> </ul> </div>}

Refund.create! title: "test2", content: %{<div class="cnt"> <p style="margin-top:0px;"> <b class="boldTxt">Important information for corporate / business sellers regarding returns</b> </p> <p style="">Corporate / business sellers may be obliged to accept returns in
certain circumstances under Australian law, as described below. &nbsp;</p> <p style="margin-bottom: 0px;">Under the Trade Practices Act 1974 and state fair trading legislation, your return policy must allow a refund to a buyer
if the consumer goods you sold:</p> <ul style="margin-top: 6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">are or become defective through no fault of the buyer;</p> </div> </li> <li
class="unorderedList"> <div style="padding-left:4px;"> <p style="">are not for the purpose you stated or the purpose the buyer made known to you;</p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p
style="">don’t match your description or sample; or</p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">have defects that were not obvious or that you did not bring to the buyer's
attention.</p> </div> </li> </ul> <p style="">When a product does not meet the above requirements, the buyer can ask for a refund within a reasonable period of time. There is no set time limit for a buyer to obtain a refund.
You can ask a buyer for proof of purchase. You can also ask them to demonstrate that any problem with the goods was not their fault.</p> <p style=""> <b class="boldTxt">Note:</b> Even though eBay provides the ability for
sellers to state a time limit in their return policy, business sellers should <b class="boldTxt">not</b> do so as applicable legislation overrides any conditions you may state in your listing. Furthermore, you could be seen as
misleading buyers about their rights. For example, if your policy states ' No refunds after 7 days’ this may mislead consumers about their rights under applicable legislation. </p> <p style="">If the buyer prefers, you may
arrange for goods to be exchanged or repaired, or offer credit (at your discretion).</p> <p style="">You are not required to offer a refund if the buyer simply changes their mind. You should therefore encourage buyers to
choose carefully.</p> <p style="">For more information about warranties and refunds contact the ACCC Infocentre on 1300 302 502 or visit the ACCC website at www.accc.gov.au.&nbsp;</p> <p style="">The above information is
general in nature and is not intended to constitute legal advice.&nbsp; For advice specific to your circumstances, eBay recommends that you consult with a legal advisor.</p> <p style=""> <b class="boldTxt">Important
information for buyers: legal rights to obtain refunds</b> </p> <p style="">As described above, when consumer goods are purchased from sellers carrying on a business, the buyer has a legal right to return the goods to the
seller and obtain a refund if the goods are either faulty, not fit for their purpose (don't do what they are supposed to do), or do not match the seller's description or sample. To obtain a refund the buyer should return the
goods within a reasonable time and not dispose of, lose, destroy or damage the goods.&nbsp;</p> <p style=""> The <a href="www.accc.gov.au" target="_blank">Australian Competition and Consumer Commission website</a> <a
href="http://www.accc.gov.au"></a>contains more information on rights to refunds, under the section headed “Publications”. </p> <p style=""> <b class="boldTxt">A clear return policy can reassure buyers</b> </p> <p
style="">Even if you are not required by law to provide returns to your buyers, there are other good reasons for doing so.&nbsp;If you have a clear return policy, chances are you're more successful than other sellers on eBay.
eBay’s research shows that difficulty in returning items is the most common shopping barrier for buyers. So if you clearly spell out return policies in your listings you'll have an edge on the competition.</p> <p
style="">eBay’s research also shows that only a very small percentage of sold items are actually returned.</p> <p style="margin-bottom: 0px;"> <b class="boldTxt">Return policy options to consider:</b> </p> <ul
style="margin-top: 6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Refund</b>(for example, returns accepted for full money back or store credit if goods are faulty). </p> </div>
</li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">100% satisfaction guaranteed</b>(for example, returns accepted, no questions asked. Make sure you are prepared to do this). </p>
</div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Time limit</b>(for example, returns accepted within a reasonable time after the item is delivered). </p> </div> </li> </ul>
<p style=""> <b class="boldTxt">Mention the details up front</b> </p> <p style="margin-bottom: 0px;">Consider including details like the following to make your return policy clear and complete:</p> <ul style="margin-top:
6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Postage and handling charges:</b>Clearly state who would pay for return postage and handling, you or the buyer and if you will
refund the original postage charges. </p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Item condition:</b>Clearly state the condition of the returned item that would be
acceptable to you, for example, "unopened box" or "opened box with all original materials." </p> </div> </li> </ul> <p style=""> <b class="boldTxt">How to specify your return policy</b> </p> <p style="margin-bottom: 0px;">In
the Additional Information section of the Sell Your Item form, take the following steps:</p> <ul style="margin-top: 6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">Select "Returns accepted"</p>
</div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">Select the time limit within which the buyer must return the item to you.</p> </div> </li> <li class="unorderedList"> <div
style="padding-left:4px;"> <p style="">Select the type of refund you will give if the item is returned.</p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">Enter all other details about your
return policy in the Return Policy Details text box.</p> </div> </li> </ul> </div>}

# puts ' *** Setting up Contents ***'
# 
# Fixtures.create_fixtures("#{Rails.root}/db/fixtures", "contents")
# 
# puts ' *** Setting up Privacy Policy ***'
# 
# Fixtures.create_fixtures("#{Rails.root}/db/fixtures", "privacies")
# 
# puts ' *** Setting up Refund Policy ***'
# 
# Fixtures.create_fixtures("#{Rails.root}/db/fixtures", "refunds")
# 
puts ' *** Setting up Spree Store ***'

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

puts ' *** DB Setup Complete *** '
