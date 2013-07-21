-- phpMyAdmin SQL Dump
-- version 3.4.11.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 29, 2012 at 12:25 PM
-- Server version: 5.0.96
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dubleds_prod`
--

USE `dub_leds_dev`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) NOT NULL default '',
  `encrypted_password` varchar(128) NOT NULL default '',
  `failed_attempts` int(11) default '0',
  `unlock_token` varchar(255) default NULL,
  `locked_at` datetime default NULL,
  `sign_in_count` int(11) default '0',
  `current_sign_in_at` datetime default NULL,
  `last_sign_in_at` datetime default NULL,
  `current_sign_in_ip` varchar(255) default NULL,
  `last_sign_in_ip` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `authentications`
--

CREATE TABLE IF NOT EXISTS `authentications` (
  `id` int(11) NOT NULL auto_increment,
  `uuid` varchar(255) default NULL,
  `provider` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `token` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `subject` varchar(255) default NULL,
  `body` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `body`, `created_at`, `updated_at`) VALUES
(1, 'Donna Gabriel', 'donnagabriel401@gmail.com', 'General Inquiry', 'We can increase rankings of your website in search engines. Please reply back for more details.', '2012-10-03 09:13:18', '2012-10-03 09:13:18'),
(2, 'justine', 'justine.dharni@gmail.com', 'General Inquiry', 'SOOOOOOO COOOOOOOOOOOL ', '2012-10-25 21:53:14', '2012-10-25 21:53:14');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(11) NOT NULL auto_increment,
  `page_content` text,
  `title` varchar(255) default NULL,
  `sub_title` text,
  `resource_type` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `page_content`, `title`, `sub_title`, `resource_type`, `created_at`, `updated_at`) VALUES
(1, '', 'Technology', 'BRAINS & BEAUTY', 'technology', '2012-08-03 00:31:24', '2012-10-08 21:42:40'),
(2, 'All parts are machined from 6061 billet aluminum, superior to most rims on the market.', 'Pure Billet Aluminum', 'Elite manufacturing', 'technology_modal', '2012-08-03 00:31:24', '2012-10-08 21:44:55'),
(3, 'Integrated circuit board that integrates all components of directional and speed sensors located on the rim device. Utilizes energy driven by the force of the pendulum and calculates the precise mathematics to project a stable image at any given speeds.', 'Integrated Computer Chip', 'Processing at light speed', 'technology_modal', '2012-08-03 00:31:24', '2012-10-08 21:44:41'),
(4, 'Choose between various colors of the rim & lip, over cap, bolts, generator cover and  pendulum arm.', 'Color Customization', 'Appealing to every eye', 'technology_modal', '2012-08-03 00:31:24', '2012-10-08 21:38:06'),
(5, 'Super bright all-weather display series. Visible during both day and night.', 'LED Lights System', 'Source of the vision', 'technology_modal', '2012-08-03 00:31:24', '2012-10-08 21:38:35'),
(6, 'Powerhouse of the rim and it’s mechanics of display. Power is generated as the wheel spins. Self-reliable source of energy. Never a need to plug in, charge, or replace batteries.', 'Power Generator', 'Bringing wheels to life', 'technology_modal', '2012-08-03 00:31:24', '2012-10-08 21:38:57'),
(7, 'Plug in your computer and use our Rim Designer software to upload your images. ', 'All-Weather Proof USB Port', 'Connect your device', 'technology_modal', '2012-08-03 00:31:24', '2012-10-08 21:39:16'),
(8, 'Supported by a ball-bearing system, the pendulum arm acts as a stabilizer device and allows the generator to produce power.', 'Pendulum Arm', 'Gravity for power', 'technology_modal', '2012-08-03 00:31:24', '2012-10-08 21:39:45'),
(9, '<ul> <li>Digital images displayed on Rims</li> <li>No-hassle easy install, no wires to plug into the car battery</li> <li>Self-Generating power</li> <li>USB Port built-in</li> </ul> <ul> <li>Wireless remote control</li> <li>Turn off / switch next to image while driving</li> <li>Universal fit on most vehicles!</li> </ul>', 'The world''s most technologically advanced rim', 'It has been long thought desirable to decorate one''s automobile by the addition of decorative wheels. It has further been thought desirable to communicate with others by means of addressable electronic displays. The concept of combining decorative automobile wheels with an addressable electronic display is a relatively new one which produces novel and visually interesting results.', 'home', '2012-08-03 00:31:24', '2012-10-10 04:33:44'),
(10, 'Use the form below to contact us or email us at:<a class="fade" href="mailto:info@dubleds.com?subject=General Inquiry" style="color: rgb(0, 169, 237); ">info@dubleds.com</a>and we''ll get back to you as soon as possible.', 'Contact Us', 'Have questions about DUB LEDS?', 'contact', '2012-08-03 00:31:24', '2012-08-03 00:31:24'),
(11, '', 'Media', 'Visuals on the road.', 'media', '2012-08-03 00:31:24', '2012-08-03 00:31:24'),
(12, 'Want to see how your images will look on your rims? Take a virtual test drive ...', 'Generator', 'Generate your own LED RIM images.', 'generator', '2012-08-03 00:31:24', '2012-08-03 00:31:24'),
(13, '', 'Copyright', '(c) 2011 LED Wheels, Inc.', 'copyright', '2012-08-03 00:31:24', '2012-08-03 00:31:24'),
(14, '', 'Facebook', 'http://www.facebook.com', 'sharing_links', '2012-08-03 00:31:24', '2012-08-03 00:31:24'),
(15, '', 'Twitter', 'http://www.twitter.com', 'sharing_links', '2012-08-03 00:31:24', '2012-08-03 00:31:24'),
(16, '', 'Flickr', 'http://www.flickr.com', 'sharing_links', '2012-08-03 00:31:24', '2012-08-03 00:31:24'),
(17, '', 'Linkedin', 'http://www.linkedin.com', 'sharing_links', '2012-08-03 00:31:24', '2012-08-03 00:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `generators`
--

CREATE TABLE IF NOT EXISTS `generators` (
  `id` int(11) NOT NULL auto_increment,
  `thumbnail` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `generators`
--

INSERT INTO `generators` (`id`, `thumbnail`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'img-uploaded.png', '2012-08-03 00:31:22', '2012-08-03 00:31:22', NULL),
(2, 'crystal4faces.JPG', '2012-08-06 22:41:18', '2012-10-05 06:00:25', NULL),
(3, 'KANYE-WEST.jpg', '2012-10-05 06:00:25', '2012-10-05 06:01:16', NULL),
(4, 'JLENON.jpg', '2012-10-05 06:01:16', '2012-10-05 06:02:17', NULL),
(5, 'SmartBags-logo.jpg', '2012-10-05 06:02:17', '2012-10-05 06:02:17', 2);

-- --------------------------------------------------------

--
-- Table structure for table `homes`
--

CREATE TABLE IF NOT EXISTS `homes` (
  `id` int(11) NOT NULL auto_increment,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `video_url` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `title`, `description`, `video_url`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 'Video 1', 'This is the description for Video 1', 'http://player.vimeo.com/video/27974233', 'media-thumb1.png', '2012-08-03 00:31:15', '2012-08-03 00:31:15'),
(2, 'Video 2', 'This is the description for Video 2', 'http://player.vimeo.com/video/27974233', 'media-thumb2.png', '2012-08-03 00:31:16', '2012-08-03 00:31:16'),
(3, 'Video 3', 'This is the description for Video 3', 'http://player.vimeo.com/video/27974233', 'media-thumb3.png', '2012-08-03 00:31:17', '2012-08-03 00:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE IF NOT EXISTS `newsletters` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'amar@mindctrl.com', '2012-10-29 09:05:52', '2012-10-29 09:05:52'),
(2, 'aman@dubleds.com', '2012-10-29 09:06:01', '2012-10-29 09:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `privacies`
--

CREATE TABLE IF NOT EXISTS `privacies` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `privacies`
--

INSERT INTO `privacies` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 'test', '<div> <h2>What information do we collect?</h2> <br> <br>We collect information from you when you register on our site or place an order. <br> <br>When ordering or registering on our site, as appropriate, you may be asked to\nenter your: name, e-mail address, mailing address, phone number or credit card information. You may, however, visit our site anonymously. <br> <br> <strong>What do we use your information for?</strong> <br> <br>Any of the\ninformation we collect from you may be used in one of the following ways: <br> <br>; To personalize your experience<br>(your information helps us to better respond to your individual needs) <br> <br>; To improve our\nwebsite<br>(we continually strive to improve our website offerings based on the information and feedback we receive from you) <br> <br>; To improve customer service<br>(your information helps us to more effectively respond to\nyour customer service requests and support needs) <br> <br>; To process transactions <br> <blockquote>Your information, whether public or private, will not be sold, exchanged, transferred, or given to any other company for any\nreason whatsoever, without your consent, other than for the express purpose of delivering the purchased product or service requested.</blockquote> <br>; To send periodic emails <br> <blockquote>The email address you provide\nfor order processing, will only be used to send you information and updates pertaining to your order.</blockquote> <br> <br> <strong>How do we protect your information?</strong> <br> <br>We implement a variety of security\nmeasures to maintain the safety of your personal information when you place an order or enter, submit, or access your personal information. <br> <br>We offer the use of a secure server. All supplied sensitive/credit\ninformation is transmitted via Secure Socket Layer (SSL) technology and then encrypted into our Payment gateway providers database only to be accessible by those authorized with special access rights to such systems, and are\nrequired to?keep the information confidential. <br> <br>After a transaction, your private information (credit cards, social security numbers, financials, etc.) will not be kept on file for more than 60 days. <br> <br>\n<strong>Do we use cookies?</strong> <br> <br>Yes (Cookies are small files that a site or its service provider transfers to your computers hard drive through your Web browser (if you allow) that enables the sites or service\nproviders systems to recognize your browser and capture and remember certain information <br> <br> We use cookies to help us remember and process the items in your shopping cart and understand and save your preferences for\nfuture visits. <br> <br> <strong>Do we disclose any information to outside parties?</strong> <br> <br>We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information. This does not\ninclude trusted third parties who assist us in operating our website, conducting our business, or servicing you, so long as those parties agree to keep this information confidential. We may also release your information when\nwe believe release is appropriate to comply with the law, enforce our site policies, or protect ours or others rights, property, or safety. However, non-personally identifiable visitor information may be provided to other\nparties for marketing, advertising, or other uses. <br> <br> <strong>Childrens Online Privacy Protection Act Compliance</strong> <br> <br>We are in compliance with the requirements of COPPA (Childrens Online Privacy Protection\nAct), we do not collect any information from anyone under 13 years of age. Our website, products and services are all directed to people who are at least 13 years old or older. <br> <br> <strong>Online Privacy Policy\nOnly</strong> <br> <br>This online privacy policy applies only to information collected through our website and not to information collected offline. <br> <br> <strong>Terms and Conditions</strong> <br> <br>Please also visit\nour Terms and Conditions section establishing the use, disclaimers, and limitations of liability governing the use of our website at <a class="blue" href="http://www.dubleds.com">http://www.dubleds.com</a> <br> <br>\n<strong>Your Consent</strong> <br> <br>By using our site, you consent to our <a href="http://www.freeprivacypolicy.com/" target="_blank">online privacy policy</a>. <br> <br> <strong>Changes to our Privacy Policy</strong> <br>\n<br>If we decide to change our privacy policy, we will post those changes on this page. <br> <br> <strong>Contacting Us</strong> <br> <br>If there are any questions regarding this privacy policy you may contact us using the\ninformation below. <br> <br>http://www.dubleds.com <br> <br>United States <br> <br> <span></span> <span></span>This policy is powered by Free Privacy Policy and Rhino Support <a href="http://www.rhinosupport.com"\ntarget="_blank">helpdesk software</a>. <span></span> <span></span> <span></span> <!-- END PRIVACY POLICY CODE --> </div>', '2012-08-03 00:31:24', '2012-08-03 00:31:24'),
(2, 'test2', '<div> <h2>What information do we collect?</h2> <br> <br>We collect information from you when you register on our site or place an order. <br> <br>When ordering or registering on our site, as appropriate, you may be asked to\nenter your: name, e-mail address, mailing address, phone number or credit card information. You may, however, visit our site anonymously. <br> <br> <strong>What do we use your information for?</strong> <br> <br>Any of the\ninformation we collect from you may be used in one of the following ways: <br> <br>; To personalize your experience<br>(your information helps us to better respond to your individual needs) <br> <br>; To improve our\nwebsite<br>(we continually strive to improve our website offerings based on the information and feedback we receive from you) <br> <br>; To improve customer service<br>(your information helps us to more effectively respond to\nyour customer service requests and support needs) <br> <br>; To process transactions <br> <blockquote>Your information, whether public or private, will not be sold, exchanged, transferred, or given to any other company for any\nreason whatsoever, without your consent, other than for the express purpose of delivering the purchased product or service requested.</blockquote> <br>; To send periodic emails <br> <blockquote>The email address you provide\nfor order processing, will only be used to send you information and updates pertaining to your order.</blockquote> <br> <br> <strong>How do we protect your information?</strong> <br> <br>We implement a variety of security\nmeasures to maintain the safety of your personal information when you place an order or enter, submit, or access your personal information. <br> <br>We offer the use of a secure server. All supplied sensitive/credit\ninformation is transmitted via Secure Socket Layer (SSL) technology and then encrypted into our Payment gateway providers database only to be accessible by those authorized with special access rights to such systems, and are\nrequired to?keep the information confidential. <br> <br>After a transaction, your private information (credit cards, social security numbers, financials, etc.) will not be kept on file for more than 60 days. <br> <br>\n<strong>Do we use cookies?</strong> <br> <br>Yes (Cookies are small files that a site or its service provider transfers to your computers hard drive through your Web browser (if you allow) that enables the sites or service\nproviders systems to recognize your browser and capture and remember certain information <br> <br> We use cookies to help us remember and process the items in your shopping cart and understand and save your preferences for\nfuture visits. <br> <br> <strong>Do we disclose any information to outside parties?</strong> <br> <br>We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information. This does not\ninclude trusted third parties who assist us in operating our website, conducting our business, or servicing you, so long as those parties agree to keep this information confidential. We may also release your information when\nwe believe release is appropriate to comply with the law, enforce our site policies, or protect ours or others rights, property, or safety. However, non-personally identifiable visitor information may be provided to other\nparties for marketing, advertising, or other uses. <br> <br> <strong>Childrens Online Privacy Protection Act Compliance</strong> <br> <br>We are in compliance with the requirements of COPPA (Childrens Online Privacy Protection\nAct), we do not collect any information from anyone under 13 years of age. Our website, products and services are all directed to people who are at least 13 years old or older. <br> <br> <strong>Online Privacy Policy\nOnly</strong> <br> <br>This online privacy policy applies only to information collected through our website and not to information collected offline. <br> <br> <strong>Terms and Conditions</strong> <br> <br>Please also visit\nour Terms and Conditions section establishing the use, disclaimers, and limitations of liability governing the use of our website at <a class="blue" href="http://www.dubleds.com">http://www.dubleds.com</a> <br> <br>\n<strong>Your Consent</strong> <br> <br>By using our site, you consent to our <a href="http://www.freeprivacypolicy.com/" target="_blank">online privacy policy</a>. <br> <br> <strong>Changes to our Privacy Policy</strong> <br>\n<br>If we decide to change our privacy policy, we will post those changes on this page. <br> <br> <strong>Contacting Us</strong> <br> <br>If there are any questions regarding this privacy policy you may contact us using the\ninformation below. <br> <br>http://www.dubleds.com <br> <br>United States <br> <br> <span></span> <span></span>This policy is powered by Free Privacy Policy and Rhino Support <a href="http://www.rhinosupport.com"\ntarget="_blank">helpdesk software</a>. <span></span> <span></span> <span></span> <!-- END PRIVACY POLICY CODE --> </div>', '2012-08-03 00:31:24', '2012-08-03 00:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE IF NOT EXISTS `refunds` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `refunds`
--

INSERT INTO `refunds` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 'test', '<div class="cnt"> <p style="margin-top:0px;"> <b class="boldTxt">Important information for corporate / business sellers regarding returns</b> </p> <p style="">Corporate / business sellers may be obliged to accept returns in\ncertain circumstances under Australian law, as described below. &nbsp;</p> <p style="margin-bottom: 0px;">Under the Trade Practices Act 1974 and state fair trading legislation, your return policy must allow a refund to a buyer\nif the consumer goods you sold:</p> <ul style="margin-top: 6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">are or become defective through no fault of the buyer;</p> </div> </li> <li\nclass="unorderedList"> <div style="padding-left:4px;"> <p style="">are not for the purpose you stated or the purpose the buyer made known to you;</p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p\nstyle="">don’t match your description or sample; or</p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">have defects that were not obvious or that you did not bring to the buyer''s\nattention.</p> </div> </li> </ul> <p style="">When a product does not meet the above requirements, the buyer can ask for a refund within a reasonable period of time. There is no set time limit for a buyer to obtain a refund.\nYou can ask a buyer for proof of purchase. You can also ask them to demonstrate that any problem with the goods was not their fault.</p> <p style=""> <b class="boldTxt">Note:</b> Even though eBay provides the ability for\nsellers to state a time limit in their return policy, business sellers should <b class="boldTxt">not</b> do so as applicable legislation overrides any conditions you may state in your listing. Furthermore, you could be seen as\nmisleading buyers about their rights. For example, if your policy states '' No refunds after 7 days’ this may mislead consumers about their rights under applicable legislation. </p> <p style="">If the buyer prefers, you may\narrange for goods to be exchanged or repaired, or offer credit (at your discretion).</p> <p style="">You are not required to offer a refund if the buyer simply changes their mind. You should therefore encourage buyers to\nchoose carefully.</p> <p style="">For more information about warranties and refunds contact the ACCC Infocentre on 1300 302 502 or visit the ACCC website at www.accc.gov.au.&nbsp;</p> <p style="">The above information is\ngeneral in nature and is not intended to constitute legal advice.&nbsp; For advice specific to your circumstances, eBay recommends that you consult with a legal advisor.</p> <p style=""> <b class="boldTxt">Important\ninformation for buyers: legal rights to obtain refunds</b> </p> <p style="">As described above, when consumer goods are purchased from sellers carrying on a business, the buyer has a legal right to return the goods to the\nseller and obtain a refund if the goods are either faulty, not fit for their purpose (don''t do what they are supposed to do), or do not match the seller''s description or sample. To obtain a refund the buyer should return the\ngoods within a reasonable time and not dispose of, lose, destroy or damage the goods.&nbsp;</p> <p style=""> The <a href="www.accc.gov.au" target="_blank">Australian Competition and Consumer Commission website</a> <a\nhref="http://www.accc.gov.au"></a>contains more information on rights to refunds, under the section headed “Publications”. </p> <p style=""> <b class="boldTxt">A clear return policy can reassure buyers</b> </p> <p\nstyle="">Even if you are not required by law to provide returns to your buyers, there are other good reasons for doing so.&nbsp;If you have a clear return policy, chances are you''re more successful than other sellers on eBay.\neBay’s research shows that difficulty in returning items is the most common shopping barrier for buyers. So if you clearly spell out return policies in your listings you''ll have an edge on the competition.</p> <p\nstyle="">eBay’s research also shows that only a very small percentage of sold items are actually returned.</p> <p style="margin-bottom: 0px;"> <b class="boldTxt">Return policy options to consider:</b> </p> <ul\nstyle="margin-top: 6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Refund</b>(for example, returns accepted for full money back or store credit if goods are faulty). </p> </div>\n</li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">100% satisfaction guaranteed</b>(for example, returns accepted, no questions asked. Make sure you are prepared to do this). </p>\n</div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Time limit</b>(for example, returns accepted within a reasonable time after the item is delivered). </p> </div> </li> </ul>\n<p style=""> <b class="boldTxt">Mention the details up front</b> </p> <p style="margin-bottom: 0px;">Consider including details like the following to make your return policy clear and complete:</p> <ul style="margin-top:\n6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Postage and handling charges:</b>Clearly state who would pay for return postage and handling, you or the buyer and if you will\nrefund the original postage charges. </p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Item condition:</b>Clearly state the condition of the returned item that would be\nacceptable to you, for example, "unopened box" or "opened box with all original materials." </p> </div> </li> </ul> <p style=""> <b class="boldTxt">How to specify your return policy</b> </p> <p style="margin-bottom: 0px;">In\nthe Additional Information section of the Sell Your Item form, take the following steps:</p> <ul style="margin-top: 6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">Select "Returns accepted"</p>\n</div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">Select the time limit within which the buyer must return the item to you.</p> </div> </li> <li class="unorderedList"> <div\nstyle="padding-left:4px;"> <p style="">Select the type of refund you will give if the item is returned.</p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">Enter all other details about your\nreturn policy in the Return Policy Details text box.</p> </div> </li> </ul> </div>', '2012-08-03 00:31:24', '2012-08-03 00:31:24'),
(2, 'test2', '<div class="cnt"> <p style="margin-top:0px;"> <b class="boldTxt">Important information for corporate / business sellers regarding returns</b> </p> <p style="">Corporate / business sellers may be obliged to accept returns in\ncertain circumstances under Australian law, as described below. &nbsp;</p> <p style="margin-bottom: 0px;">Under the Trade Practices Act 1974 and state fair trading legislation, your return policy must allow a refund to a buyer\nif the consumer goods you sold:</p> <ul style="margin-top: 6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">are or become defective through no fault of the buyer;</p> </div> </li> <li\nclass="unorderedList"> <div style="padding-left:4px;"> <p style="">are not for the purpose you stated or the purpose the buyer made known to you;</p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p\nstyle="">don’t match your description or sample; or</p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">have defects that were not obvious or that you did not bring to the buyer''s\nattention.</p> </div> </li> </ul> <p style="">When a product does not meet the above requirements, the buyer can ask for a refund within a reasonable period of time. There is no set time limit for a buyer to obtain a refund.\nYou can ask a buyer for proof of purchase. You can also ask them to demonstrate that any problem with the goods was not their fault.</p> <p style=""> <b class="boldTxt">Note:</b> Even though eBay provides the ability for\nsellers to state a time limit in their return policy, business sellers should <b class="boldTxt">not</b> do so as applicable legislation overrides any conditions you may state in your listing. Furthermore, you could be seen as\nmisleading buyers about their rights. For example, if your policy states '' No refunds after 7 days’ this may mislead consumers about their rights under applicable legislation. </p> <p style="">If the buyer prefers, you may\narrange for goods to be exchanged or repaired, or offer credit (at your discretion).</p> <p style="">You are not required to offer a refund if the buyer simply changes their mind. You should therefore encourage buyers to\nchoose carefully.</p> <p style="">For more information about warranties and refunds contact the ACCC Infocentre on 1300 302 502 or visit the ACCC website at www.accc.gov.au.&nbsp;</p> <p style="">The above information is\ngeneral in nature and is not intended to constitute legal advice.&nbsp; For advice specific to your circumstances, eBay recommends that you consult with a legal advisor.</p> <p style=""> <b class="boldTxt">Important\ninformation for buyers: legal rights to obtain refunds</b> </p> <p style="">As described above, when consumer goods are purchased from sellers carrying on a business, the buyer has a legal right to return the goods to the\nseller and obtain a refund if the goods are either faulty, not fit for their purpose (don''t do what they are supposed to do), or do not match the seller''s description or sample. To obtain a refund the buyer should return the\ngoods within a reasonable time and not dispose of, lose, destroy or damage the goods.&nbsp;</p> <p style=""> The <a href="www.accc.gov.au" target="_blank">Australian Competition and Consumer Commission website</a> <a\nhref="http://www.accc.gov.au"></a>contains more information on rights to refunds, under the section headed “Publications”. </p> <p style=""> <b class="boldTxt">A clear return policy can reassure buyers</b> </p> <p\nstyle="">Even if you are not required by law to provide returns to your buyers, there are other good reasons for doing so.&nbsp;If you have a clear return policy, chances are you''re more successful than other sellers on eBay.\neBay’s research shows that difficulty in returning items is the most common shopping barrier for buyers. So if you clearly spell out return policies in your listings you''ll have an edge on the competition.</p> <p\nstyle="">eBay’s research also shows that only a very small percentage of sold items are actually returned.</p> <p style="margin-bottom: 0px;"> <b class="boldTxt">Return policy options to consider:</b> </p> <ul\nstyle="margin-top: 6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Refund</b>(for example, returns accepted for full money back or store credit if goods are faulty). </p> </div>\n</li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">100% satisfaction guaranteed</b>(for example, returns accepted, no questions asked. Make sure you are prepared to do this). </p>\n</div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Time limit</b>(for example, returns accepted within a reasonable time after the item is delivered). </p> </div> </li> </ul>\n<p style=""> <b class="boldTxt">Mention the details up front</b> </p> <p style="margin-bottom: 0px;">Consider including details like the following to make your return policy clear and complete:</p> <ul style="margin-top:\n6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Postage and handling charges:</b>Clearly state who would pay for return postage and handling, you or the buyer and if you will\nrefund the original postage charges. </p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style=""><b class="boldTxt">Item condition:</b>Clearly state the condition of the returned item that would be\nacceptable to you, for example, "unopened box" or "opened box with all original materials." </p> </div> </li> </ul> <p style=""> <b class="boldTxt">How to specify your return policy</b> </p> <p style="margin-bottom: 0px;">In\nthe Additional Information section of the Sell Your Item form, take the following steps:</p> <ul style="margin-top: 6px;"> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">Select "Returns accepted"</p>\n</div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">Select the time limit within which the buyer must return the item to you.</p> </div> </li> <li class="unorderedList"> <div\nstyle="padding-left:4px;"> <p style="">Select the type of refund you will give if the item is returned.</p> </div> </li> <li class="unorderedList"> <div style="padding-left:4px;"> <p style="">Enter all other details about your\nreturn policy in the Return Policy Details text box.</p> </div> </li> </ul> </div>', '2012-08-03 00:31:24', '2012-08-03 00:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `rims`
--

CREATE TABLE IF NOT EXISTS `rims` (
  `id` int(11) NOT NULL auto_increment,
  `product_id` int(11) default NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `color` varchar(255) default NULL,
  `size` varchar(255) default NULL,
  `fitting` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `medium_image` varchar(255) default NULL,
  `small_image` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `rims`
--

INSERT INTO `rims` (`id`, `product_id`, `title`, `description`, `color`, `size`, `fitting`, `image`, `medium_image`, `small_image`, `created_at`, `updated_at`) VALUES
(1, 12, 'Chrome', 'All chrome rim and overcap', 'Chrome', '22/24 Inch', '22x10', 'dub_leds_chrome.png', 'img_rim_medium_chrome.png', 'img_rim_small_chrome.png', '2012-08-03 00:30:56', '2012-10-29 10:48:39'),
(2, 1, 'Matte Black', 'All matte black rim and overcap', 'Matte Black', '22/24 Inch', '22x10', 'Homepage_Rims_Matte_Black.png', 'img_rim_medium_matte_black.png', 'img_rim_small_matte_black.png', '2012-08-03 00:30:59', '2012-10-29 10:12:04'),
(3, 1, 'Matte White', 'All matte white rim and overcap', 'Matt White', '22/24 Inch', '22x10', 'Homepage_Rims_Large_matte_white.png', 'img_rim_medium_matte_white.png', 'img_rim_small_matte_white.png', '2012-08-03 00:31:02', '2012-10-29 10:12:21'),
(4, 1, 'Carbon Fiber', 'All carbon fiber rim and overcap', 'Carbon Fiber', '22/24 Inch', '22x10', 'Homepage_Rims_Large_all_carbon.png', 'img_rim_medium_all_carbon.png', 'img_rim_small_all_carbon.png', '2012-08-03 00:31:05', '2012-10-29 09:49:16'),
(5, 1, 'Custom Carbon', 'Carbon fiber lip and custom <br>gloss overcap.', 'Custom Carbon', '22/24 Inch', '22x10', 'Homepage_Rims_Large_Carbon_Custom.png', 'img_rim_medium_carbon_custom.png', 'img_rim_small_carbon_custom.png', '2012-08-03 00:31:08', '2012-10-29 10:10:15'),
(6, 1, 'Custom Matte', 'Custom matte lip and custom <br>matte overcap.', 'Custom Matte', '22/24 Inch', '22x10', 'Homepage_Rims_Large_custom_matte.png', 'img_rim_medium_custom_matte.png', 'img_rim_small_custom_matte.png', '2012-08-03 00:31:10', '2012-10-29 10:11:21');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20111114023424'),
('20111130203307'),
('20111130203349'),
('20111130203358'),
('20111130203416'),
('20111217001549'),
('20120318193130'),
('20120409052957'),
('20120409055645'),
('20120409060220'),
('20120422043157'),
('20120603041858'),
('20120603041859'),
('20120603041860'),
('20120603041861'),
('20120603041862'),
('20120603041863'),
('20120603041864'),
('20120603041865'),
('20120603041866'),
('20120603041867'),
('20120603041868'),
('20120603041869'),
('20120603041870'),
('20120603041871'),
('20120603041872'),
('20120603041873'),
('20120603041874'),
('20120603041875'),
('20120603041876'),
('20120603041877'),
('20120603041878'),
('20120603041879'),
('20120603041880'),
('20120603041881'),
('20120603041882'),
('20120603041883'),
('20120603041884'),
('20120603041885'),
('20120603041886'),
('20120603041887'),
('20120603041888'),
('20120603041889'),
('20120603041890'),
('20120603041891'),
('20120603041892'),
('20120603041893'),
('20120603041894'),
('20120603041895'),
('20120603041896'),
('20120603041897'),
('20120603041898'),
('20120603041899'),
('20120603041900'),
('20120603041901'),
('20120603041902'),
('20120603041903'),
('20120603041904'),
('20120603041905'),
('20120603041906'),
('20120603041907'),
('20120603041908'),
('20120603041909'),
('20120603041910'),
('20120603041911'),
('20120603041912'),
('20120603041913'),
('20120603041914'),
('20120603041915'),
('20120603041916'),
('20120603041917'),
('20120603041918'),
('20120603041919'),
('20120603041920'),
('20120603041921'),
('20120603041922'),
('20120603041923'),
('20120603041924'),
('20120603041925'),
('20120603041926'),
('20120603041927'),
('20120603041928'),
('20120603041929'),
('20120603041930'),
('20120603041931'),
('20120603041932'),
('20120603041933'),
('20120603041934'),
('20120603041935'),
('20120603041936'),
('20120603041937'),
('20120603041938'),
('20120603041939'),
('20120603041940'),
('20120603041941'),
('20120603041942'),
('20120603041943'),
('20120603041944'),
('20120603041945'),
('20120603041946'),
('20120603041947'),
('20120603041948'),
('20120603041949'),
('20120603041950'),
('20120603041951'),
('20120603041952'),
('20120603041953'),
('20120603041954'),
('20120603041955'),
('20120603041956'),
('20120603041957'),
('20120603041958'),
('20120603041959'),
('20120603041960'),
('20120603041961'),
('20120603041962'),
('20120603041963'),
('20120603041964'),
('20120603041965'),
('20120603041966'),
('20120603041967'),
('20120603041968'),
('20120603041969'),
('20120603041970'),
('20120603041971'),
('20120603041972'),
('20120603041973'),
('20120603041974'),
('20120603041975'),
('20120603041976'),
('20121421235318'),
('20121422014843'),
('20121422015076'),
('20121422015079'),
('20121422015080'),
('20121422015081'),
('20121422015082'),
('20121422015083'),
('20121422015084');

-- --------------------------------------------------------

--
-- Table structure for table `softwares`
--

CREATE TABLE IF NOT EXISTS `softwares` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `download_url` varchar(255) default NULL,
  `default_id` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `softwares`
--

INSERT INTO `softwares` (`id`, `name`, `image`, `download_url`, `default_id`, `created_at`, `updated_at`) VALUES
(1, 'DUB LED Software 1', 'PimpStar_Designer2.png', 'http://www.dubleds.com', '1', '2012-08-03 00:31:18', '2012-10-05 06:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `spree_activators`
--

CREATE TABLE IF NOT EXISTS `spree_activators` (
  `id` int(11) NOT NULL auto_increment,
  `description` varchar(255) default NULL,
  `expires_at` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `starts_at` datetime default NULL,
  `name` varchar(255) default NULL,
  `event_name` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `usage_limit` int(11) default NULL,
  `match_policy` varchar(255) default 'all',
  `code` varchar(255) default NULL,
  `advertise` tinyint(1) default '0',
  `path` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_addresses`
--

CREATE TABLE IF NOT EXISTS `spree_addresses` (
  `id` int(11) NOT NULL auto_increment,
  `firstname` varchar(255) default NULL,
  `lastname` varchar(255) default NULL,
  `address1` varchar(255) default NULL,
  `address2` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `zipcode` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `state_name` varchar(255) default NULL,
  `alternative_phone` varchar(255) default NULL,
  `state_id` int(11) default NULL,
  `country_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `company` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_addresses_on_firstname` (`firstname`),
  KEY `index_addresses_on_lastname` (`lastname`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `spree_addresses`
--

INSERT INTO `spree_addresses` (`id`, `firstname`, `lastname`, `address1`, `address2`, `city`, `zipcode`, `phone`, `state_name`, `alternative_phone`, `state_id`, `country_id`, `created_at`, `updated_at`, `company`) VALUES
(1, 'Isaac', 'Wooten', '419 Enclave Circle Apt 304', 'Apt 304', 'Costa Mesa', '92626', '2067782357', NULL, NULL, 276110813, 214, '2012-08-03 01:44:11', '2012-08-03 01:44:11', NULL),
(2, 'Isaac', 'Wooten', '419 Enclave Circle Apt 304', 'Apt 304', 'Costa Mesa', '92626', '2067782357', NULL, NULL, 276110813, 214, '2012-08-03 01:44:11', '2012-08-03 01:49:06', NULL),
(3, 'Isaac', 'Wooten', '419 Enclave Circle #304', '', 'Costa Mesa', '92626', '2067782357', NULL, NULL, 276110813, 214, '2012-08-03 09:26:17', '2012-08-03 09:26:17', NULL),
(4, 'Isaac', 'Wooten', '419 Enclave Circle #304', '', 'Costa Mesa', '92626', '2067782357', NULL, NULL, 276110813, 214, '2012-08-03 09:26:17', '2012-08-03 09:26:17', NULL),
(5, 'Isaac', 'Wooten', '419 Enclave Circle Apt 304', '', 'Costa Mesa', '92626', '2067782357', NULL, NULL, 276110813, 214, '2012-08-03 19:33:37', '2012-08-03 19:33:37', NULL),
(6, 'Isaac', 'Wooten', '419 Enclave Circle Apt 304', '', 'Costa Mesa', '92626', '2067782357', NULL, NULL, 276110813, 214, '2012-08-03 19:33:37', '2012-08-03 19:33:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `spree_adjustments`
--

CREATE TABLE IF NOT EXISTS `spree_adjustments` (
  `id` int(11) NOT NULL auto_increment,
  `source_id` int(11) default NULL,
  `amount` decimal(8,2) default NULL,
  `label` varchar(255) default NULL,
  `source_type` varchar(255) default NULL,
  `adjustable_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `mandatory` tinyint(1) default NULL,
  `locked` tinyint(1) default NULL,
  `originator_id` int(11) default NULL,
  `originator_type` varchar(255) default NULL,
  `eligible` tinyint(1) default '1',
  `adjustable_type` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_adjustments_on_order_id` (`adjustable_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `spree_adjustments`
--

INSERT INTO `spree_adjustments` (`id`, `source_id`, `amount`, `label`, `source_type`, `adjustable_id`, `created_at`, `updated_at`, `mandatory`, `locked`, `originator_id`, `originator_type`, `eligible`, `adjustable_type`) VALUES
(1, 1, '0.00', 'Shipping', 'Spree::Shipment', 1, '2012-08-03 01:49:15', '2012-08-03 01:49:15', 1, NULL, 1, 'Spree::ShippingMethod', 1, 'Spree::Order'),
(2, 2, '0.00', 'Shipping', 'Spree::Shipment', 3, '2012-08-03 09:26:30', '2012-08-03 09:26:30', 1, NULL, 1, 'Spree::ShippingMethod', 1, 'Spree::Order'),
(3, 3, '0.00', 'Shipping', 'Spree::Shipment', 4, '2012-08-03 19:33:41', '2012-08-03 19:33:41', 1, NULL, 1, 'Spree::ShippingMethod', 1, 'Spree::Order');

-- --------------------------------------------------------

--
-- Table structure for table `spree_assets`
--

CREATE TABLE IF NOT EXISTS `spree_assets` (
  `id` int(11) NOT NULL auto_increment,
  `viewable_id` int(11) default NULL,
  `attachment_width` int(11) default NULL,
  `attachment_height` int(11) default NULL,
  `attachment_file_size` int(11) default NULL,
  `position` int(11) default NULL,
  `viewable_type` varchar(50) default NULL,
  `attachment_content_type` varchar(255) default NULL,
  `attachment_file_name` varchar(255) default NULL,
  `type` varchar(75) default NULL,
  `attachment_updated_at` datetime default NULL,
  `alt` text,
  PRIMARY KEY  (`id`),
  KEY `index_assets_on_viewable_id` (`viewable_id`),
  KEY `index_assets_on_viewable_type_and_type` (`viewable_type`,`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `spree_assets`
--

INSERT INTO `spree_assets` (`id`, `viewable_id`, `attachment_width`, `attachment_height`, `attachment_file_size`, `position`, `viewable_type`, `attachment_content_type`, `attachment_file_name`, `type`, `attachment_updated_at`, `alt`) VALUES
(1, 2, 514, 533, 171421, 1, 'Spree::Variant', 'image/png', 'img-rim-medium2.png', 'Spree::Image', '2012-08-03 00:35:06', 'Rim 2'),
(2, 1, 980, 980, 900807, 1, 'Spree::Variant', 'image/png', 'Homepage_Rims_Large.png', 'Spree::Image', '2012-10-08 17:50:52', ''),
(4, 16, 980, 980, 900807, 1, 'Spree::Variant', 'image/png', 'Homepage_Rims_Large.png', 'Spree::Image', '2012-10-08 18:38:28', ''),
(5, 21, 980, 980, 900807, 1, 'Spree::Variant', 'image/png', 'Homepage_Rims_Large.png', 'Spree::Image', '2012-10-08 18:47:20', ''),
(8, 27, 514, 533, 250631, 1, 'Spree::Variant', 'image/png', 'img_rim_medium_chrome.png', 'Spree::Image', '2012-10-08 19:05:35', 'Chrome'),
(9, 29, 514, 533, 158859, 1, 'Spree::Variant', 'image/png', 'img_rim_medium_matte_black.png', 'Spree::Image', '2012-10-08 19:06:11', ''),
(10, 36, 420, 409, 151133, 1, 'Spree::Variant', 'image/png', 'img_rim_medium_matteblack.png', 'Spree::Image', '2012-10-08 21:29:00', ''),
(11, 37, 420, 409, 151133, 1, 'Spree::Variant', 'image/png', 'img_rim_medium_matteblack.png', 'Spree::Image', '2012-10-08 21:29:15', ''),
(12, 38, 420, 409, 151133, 1, 'Spree::Variant', 'image/png', 'img_rim_medium_matteblack.png', 'Spree::Image', '2012-10-08 21:29:49', ''),
(13, 39, 420, 409, 240913, 1, 'Spree::Variant', 'image/png', 'img_rim_medium_chrome.png', 'Spree::Image', '2012-10-29 10:20:02', ''),
(14, 15, 420, 409, 240989, 1, 'Spree::Variant', 'image/png', 'store_rim_medium_chrome.png', 'Spree::Image', '2012-10-29 10:34:04', 'Chrome'),
(15, 40, 420, 409, 240989, 1, 'Spree::Variant', 'image/png', 'store_rim_medium_chrome.png', 'Spree::Image', '2012-10-29 10:35:55', 'Chrome'),
(16, 49, 420, 409, 240989, 1, 'Spree::Variant', 'image/png', 'store_rim_medium_chrome.png', 'Spree::Image', '2012-10-29 10:38:11', 'Chrome'),
(19, 22, 420, 409, 150679, 1, 'Spree::Variant', 'image/png', 'store_rim_medium_matte_black.png', 'Spree::Image', '2012-10-29 10:43:02', ''),
(20, 50, 420, 409, 150679, 1, 'Spree::Variant', 'image/png', 'store_rim_medium_matte_black.png', 'Spree::Image', '2012-10-29 10:44:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `spree_calculators`
--

CREATE TABLE IF NOT EXISTS `spree_calculators` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(255) default NULL,
  `calculable_id` int(11) NOT NULL,
  `calculable_type` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `spree_calculators`
--

INSERT INTO `spree_calculators` (`id`, `type`, `calculable_id`, `calculable_type`, `created_at`, `updated_at`) VALUES
(1, 'Spree::Calculator::FlatPercentItemTotal', 1, 'Spree::ShippingMethod', '2012-08-03 00:34:15', '2012-08-03 00:34:15'),
(2, 'Spree::Calculator::FlatPercentItemTotal', 2, 'Spree::ShippingMethod', '2012-08-03 00:34:28', '2012-08-03 00:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `spree_configurations`
--

CREATE TABLE IF NOT EXISTS `spree_configurations` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `type` varchar(50) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `index_configurations_on_name_and_type` (`name`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_countries`
--

CREATE TABLE IF NOT EXISTS `spree_countries` (
  `id` int(11) NOT NULL auto_increment,
  `iso_name` varchar(255) default NULL,
  `iso` varchar(255) default NULL,
  `iso3` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `numcode` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=227 ;

--
-- Dumping data for table `spree_countries`
--

INSERT INTO `spree_countries` (`id`, `iso_name`, `iso`, `iso3`, `name`, `numcode`) VALUES
(1, 'AFGHANISTAN', 'AF', 'AFG', 'Afghanistan', 4),
(2, 'ALBANIA', 'AL', 'ALB', 'Albania', 8),
(3, 'ALGERIA', 'DZ', 'DZA', 'Algeria', 12),
(4, 'AMERICAN SAMOA', 'AS', 'ASM', 'American Samoa', 16),
(5, 'ANDORRA', 'AD', 'AND', 'Andorra', 20),
(6, 'ANGOLA', 'AO', 'AGO', 'Angola', 24),
(7, 'ANGUILLA', 'AI', 'AIA', 'Anguilla', 660),
(8, 'ANTIGUA AND BARBUDA', 'AG', 'ATG', 'Antigua and Barbuda', 28),
(9, 'ARGENTINA', 'AR', 'ARG', 'Argentina', 32),
(10, 'ARMENIA', 'AM', 'ARM', 'Armenia', 51),
(11, 'ARUBA', 'AW', 'ABW', 'Aruba', 533),
(12, 'AUSTRALIA', 'AU', 'AUS', 'Australia', 36),
(13, 'AUSTRIA', 'AT', 'AUT', 'Austria', 40),
(14, 'AZERBAIJAN', 'AZ', 'AZE', 'Azerbaijan', 31),
(15, 'BAHAMAS', 'BS', 'BHS', 'Bahamas', 44),
(16, 'BAHRAIN', 'BH', 'BHR', 'Bahrain', 48),
(17, 'BANGLADESH', 'BD', 'BGD', 'Bangladesh', 50),
(18, 'BARBADOS', 'BB', 'BRB', 'Barbados', 52),
(19, 'BELARUS', 'BY', 'BLR', 'Belarus', 112),
(20, 'BELGIUM', 'BE', 'BEL', 'Belgium', 56),
(21, 'BELIZE', 'BZ', 'BLZ', 'Belize', 84),
(22, 'BENIN', 'BJ', 'BEN', 'Benin', 204),
(23, 'BERMUDA', 'BM', 'BMU', 'Bermuda', 60),
(24, 'BHUTAN', 'BT', 'BTN', 'Bhutan', 64),
(25, 'BOLIVIA', 'BO', 'BOL', 'Bolivia', 68),
(26, 'BOSNIA AND HERZEGOVINA', 'BA', 'BIH', 'Bosnia and Herzegovina', 70),
(27, 'BOTSWANA', 'BW', 'BWA', 'Botswana', 72),
(28, 'BRAZIL', 'BR', 'BRA', 'Brazil', 76),
(29, 'BRUNEI DARUSSALAM', 'BN', 'BRN', 'Brunei Darussalam', 96),
(30, 'BULGARIA', 'BG', 'BGR', 'Bulgaria', 100),
(31, 'BURKINA FASO', 'BF', 'BFA', 'Burkina Faso', 854),
(32, 'BURUNDI', 'BI', 'BDI', 'Burundi', 108),
(33, 'CAMBODIA', 'KH', 'KHM', 'Cambodia', 116),
(34, 'CAMEROON', 'CM', 'CMR', 'Cameroon', 120),
(35, 'CANADA', 'CA', 'CAN', 'Canada', 124),
(36, 'CAPE VERDE', 'CV', 'CPV', 'Cape Verde', 132),
(37, 'CAYMAN ISLANDS', 'KY', 'CYM', 'Cayman Islands', 136),
(38, 'CENTRAL AFRICAN REPUBLIC', 'CF', 'CAF', 'Central African Republic', 140),
(39, 'CHAD', 'TD', 'TCD', 'Chad', 148),
(40, 'CHILE', 'CL', 'CHL', 'Chile', 152),
(41, 'CHINA', 'CN', 'CHN', 'China', 156),
(42, 'COLOMBIA', 'CO', 'COL', 'Colombia', 170),
(43, 'COMOROS', 'KM', 'COM', 'Comoros', 174),
(44, 'CONGO', 'CG', 'COG', 'Congo', 178),
(45, 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'CD', 'COD', 'Congo, the Democratic Republic of the', 180),
(46, 'COOK ISLANDS', 'CK', 'COK', 'Cook Islands', 184),
(47, 'COSTA RICA', 'CR', 'CRI', 'Costa Rica', 188),
(48, 'COTE D''IVOIRE', 'CI', 'CIV', 'Cote D''Ivoire', 384),
(49, 'CROATIA', 'HR', 'HRV', 'Croatia', 191),
(50, 'CUBA', 'CU', 'CUB', 'Cuba', 192),
(51, 'CYPRUS', 'CY', 'CYP', 'Cyprus', 196),
(52, 'CZECH REPUBLIC', 'CZ', 'CZE', 'Czech Republic', 203),
(53, 'DENMARK', 'DK', 'DNK', 'Denmark', 208),
(54, 'DJIBOUTI', 'DJ', 'DJI', 'Djibouti', 262),
(55, 'DOMINICA', 'DM', 'DMA', 'Dominica', 212),
(56, 'DOMINICAN REPUBLIC', 'DO', 'DOM', 'Dominican Republic', 214),
(57, 'ECUADOR', 'EC', 'ECU', 'Ecuador', 218),
(58, 'EGYPT', 'EG', 'EGY', 'Egypt', 818),
(59, 'EL SALVADOR', 'SV', 'SLV', 'El Salvador', 222),
(60, 'EQUATORIAL GUINEA', 'GQ', 'GNQ', 'Equatorial Guinea', 226),
(61, 'ERITREA', 'ER', 'ERI', 'Eritrea', 232),
(62, 'ESTONIA', 'EE', 'EST', 'Estonia', 233),
(63, 'ETHIOPIA', 'ET', 'ETH', 'Ethiopia', 231),
(64, 'FALKLAND ISLANDS (MALVINAS)', 'FK', 'FLK', 'Falkland Islands (Malvinas)', 238),
(65, 'FAROE ISLANDS', 'FO', 'FRO', 'Faroe Islands', 234),
(66, 'FIJI', 'FJ', 'FJI', 'Fiji', 242),
(67, 'FINLAND', 'FI', 'FIN', 'Finland', 246),
(68, 'FRANCE', 'FR', 'FRA', 'France', 250),
(69, 'FRENCH GUIANA', 'GF', 'GUF', 'French Guiana', 254),
(70, 'FRENCH POLYNESIA', 'PF', 'PYF', 'French Polynesia', 258),
(71, 'GABON', 'GA', 'GAB', 'Gabon', 266),
(72, 'GAMBIA', 'GM', 'GMB', 'Gambia', 270),
(73, 'GEORGIA', 'GE', 'GEO', 'Georgia', 268),
(74, 'GERMANY', 'DE', 'DEU', 'Germany', 276),
(75, 'GHANA', 'GH', 'GHA', 'Ghana', 288),
(76, 'GIBRALTAR', 'GI', 'GIB', 'Gibraltar', 292),
(77, 'GREECE', 'GR', 'GRC', 'Greece', 300),
(78, 'GREENLAND', 'GL', 'GRL', 'Greenland', 304),
(79, 'GRENADA', 'GD', 'GRD', 'Grenada', 308),
(80, 'GUADELOUPE', 'GP', 'GLP', 'Guadeloupe', 312),
(81, 'GUAM', 'GU', 'GUM', 'Guam', 316),
(82, 'GUATEMALA', 'GT', 'GTM', 'Guatemala', 320),
(83, 'GUINEA', 'GN', 'GIN', 'Guinea', 324),
(84, 'GUINEA-BISSAU', 'GW', 'GNB', 'Guinea-Bissau', 624),
(85, 'GUYANA', 'GY', 'GUY', 'Guyana', 328),
(86, 'HAITI', 'HT', 'HTI', 'Haiti', 332),
(87, 'HOLY SEE (VATICAN CITY STATE)', 'VA', 'VAT', 'Holy See (Vatican City State)', 336),
(88, 'HONDURAS', 'HN', 'HND', 'Honduras', 340),
(89, 'HONG KONG', 'HK', 'HKG', 'Hong Kong', 344),
(90, 'HUNGARY', 'HU', 'HUN', 'Hungary', 348),
(91, 'ICELAND', 'IS', 'ISL', 'Iceland', 352),
(92, 'INDIA', 'IN', 'IND', 'India', 356),
(93, 'INDONESIA', 'ID', 'IDN', 'Indonesia', 360),
(94, 'IRAN, ISLAMIC REPUBLIC OF', 'IR', 'IRN', 'Iran, Islamic Republic of', 364),
(95, 'IRAQ', 'IQ', 'IRQ', 'Iraq', 368),
(96, 'IRELAND', 'IE', 'IRL', 'Ireland', 372),
(97, 'ISRAEL', 'IL', 'ISR', 'Israel', 376),
(98, 'ITALY', 'IT', 'ITA', 'Italy', 380),
(99, 'JAMAICA', 'JM', 'JAM', 'Jamaica', 388),
(100, 'JAPAN', 'JP', 'JPN', 'Japan', 392),
(101, 'JORDAN', 'JO', 'JOR', 'Jordan', 400),
(102, 'KAZAKHSTAN', 'KZ', 'KAZ', 'Kazakhstan', 398),
(103, 'KENYA', 'KE', 'KEN', 'Kenya', 404),
(104, 'KIRIBATI', 'KI', 'KIR', 'Kiribati', 296),
(105, 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'KP', 'PRK', 'North Korea', 408),
(106, 'KOREA, REPUBLIC OF', 'KR', 'KOR', 'South Korea', 410),
(107, 'KUWAIT', 'KW', 'KWT', 'Kuwait', 414),
(108, 'KYRGYZSTAN', 'KG', 'KGZ', 'Kyrgyzstan', 417),
(109, 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'LA', 'LAO', 'Lao People''s Democratic Republic', 418),
(110, 'LATVIA', 'LV', 'LVA', 'Latvia', 428),
(111, 'LEBANON', 'LB', 'LBN', 'Lebanon', 422),
(112, 'LESOTHO', 'LS', 'LSO', 'Lesotho', 426),
(113, 'LIBERIA', 'LR', 'LBR', 'Liberia', 430),
(114, 'LIBYAN ARAB JAMAHIRIYA', 'LY', 'LBY', 'Libyan Arab Jamahiriya', 434),
(115, 'LIECHTENSTEIN', 'LI', 'LIE', 'Liechtenstein', 438),
(116, 'LITHUANIA', 'LT', 'LTU', 'Lithuania', 440),
(117, 'LUXEMBOURG', 'LU', 'LUX', 'Luxembourg', 442),
(118, 'MACAO', 'MO', 'MAC', 'Macao', 446),
(119, 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'MK', 'MKD', 'Macedonia', 807),
(120, 'MADAGASCAR', 'MG', 'MDG', 'Madagascar', 450),
(121, 'MALAWI', 'MW', 'MWI', 'Malawi', 454),
(122, 'MALAYSIA', 'MY', 'MYS', 'Malaysia', 458),
(123, 'MALDIVES', 'MV', 'MDV', 'Maldives', 462),
(124, 'MALI', 'ML', 'MLI', 'Mali', 466),
(125, 'MALTA', 'MT', 'MLT', 'Malta', 470),
(126, 'MARSHALL ISLANDS', 'MH', 'MHL', 'Marshall Islands', 584),
(127, 'MARTINIQUE', 'MQ', 'MTQ', 'Martinique', 474),
(128, 'MAURITANIA', 'MR', 'MRT', 'Mauritania', 478),
(129, 'MAURITIUS', 'MU', 'MUS', 'Mauritius', 480),
(130, 'MEXICO', 'MX', 'MEX', 'Mexico', 484),
(131, 'MICRONESIA, FEDERATED STATES OF', 'FM', 'FSM', 'Micronesia, Federated States of', 583),
(132, 'MOLDOVA, REPUBLIC OF', 'MD', 'MDA', 'Moldova, Republic of', 498),
(133, 'MONACO', 'MC', 'MCO', 'Monaco', 492),
(134, 'MONGOLIA', 'MN', 'MNG', 'Mongolia', 496),
(135, 'MONTSERRAT', 'MS', 'MSR', 'Montserrat', 500),
(136, 'MOROCCO', 'MA', 'MAR', 'Morocco', 504),
(137, 'MOZAMBIQUE', 'MZ', 'MOZ', 'Mozambique', 508),
(138, 'MYANMAR', 'MM', 'MMR', 'Myanmar', 104),
(139, 'NAMIBIA', 'NA', 'NAM', 'Namibia', 516),
(140, 'NAURU', 'NR', 'NRU', 'Nauru', 520),
(141, 'NEPAL', 'NP', 'NPL', 'Nepal', 524),
(142, 'NETHERLANDS', 'NL', 'NLD', 'Netherlands', 528),
(143, 'NETHERLANDS ANTILLES', 'AN', 'ANT', 'Netherlands Antilles', 530),
(144, 'NEW CALEDONIA', 'NC', 'NCL', 'New Caledonia', 540),
(145, 'NEW ZEALAND', 'NZ', 'NZL', 'New Zealand', 554),
(146, 'NICARAGUA', 'NI', 'NIC', 'Nicaragua', 558),
(147, 'NIGER', 'NE', 'NER', 'Niger', 562),
(148, 'NIGERIA', 'NG', 'NGA', 'Nigeria', 566),
(149, 'NIUE', 'NU', 'NIU', 'Niue', 570),
(150, 'NORFOLK ISLAND', 'NF', 'NFK', 'Norfolk Island', 574),
(151, 'NORTHERN MARIANA ISLANDS', 'MP', 'MNP', 'Northern Mariana Islands', 580),
(152, 'NORWAY', 'NO', 'NOR', 'Norway', 578),
(153, 'OMAN', 'OM', 'OMN', 'Oman', 512),
(154, 'PAKISTAN', 'PK', 'PAK', 'Pakistan', 586),
(155, 'PALAU', 'PW', 'PLW', 'Palau', 585),
(156, 'PANAMA', 'PA', 'PAN', 'Panama', 591),
(157, 'PAPUA NEW GUINEA', 'PG', 'PNG', 'Papua New Guinea', 598),
(158, 'PARAGUAY', 'PY', 'PRY', 'Paraguay', 600),
(159, 'PERU', 'PE', 'PER', 'Peru', 604),
(160, 'PHILIPPINES', 'PH', 'PHL', 'Philippines', 608),
(161, 'PITCAIRN', 'PN', 'PCN', 'Pitcairn', 612),
(162, 'POLAND', 'PL', 'POL', 'Poland', 616),
(163, 'PORTUGAL', 'PT', 'PRT', 'Portugal', 620),
(164, 'PUERTO RICO', 'PR', 'PRI', 'Puerto Rico', 630),
(165, 'QATAR', 'QA', 'QAT', 'Qatar', 634),
(166, 'REUNION', 'RE', 'REU', 'Reunion', 638),
(167, 'ROMANIA', 'RO', 'ROM', 'Romania', 642),
(168, 'RUSSIAN FEDERATION', 'RU', 'RUS', 'Russian Federation', 643),
(169, 'RWANDA', 'RW', 'RWA', 'Rwanda', 646),
(170, 'SAINT HELENA', 'SH', 'SHN', 'Saint Helena', 654),
(171, 'SAINT KITTS AND NEVIS', 'KN', 'KNA', 'Saint Kitts and Nevis', 659),
(172, 'SAINT LUCIA', 'LC', 'LCA', 'Saint Lucia', 662),
(173, 'SAINT PIERRE AND MIQUELON', 'PM', 'SPM', 'Saint Pierre and Miquelon', 666),
(174, 'SAINT VINCENT AND THE GRENADINES', 'VC', 'VCT', 'Saint Vincent and the Grenadines', 670),
(175, 'SAMOA', 'WS', 'WSM', 'Samoa', 882),
(176, 'SAN MARINO', 'SM', 'SMR', 'San Marino', 674),
(177, 'SAO TOME AND PRINCIPE', 'ST', 'STP', 'Sao Tome and Principe', 678),
(178, 'SAUDI ARABIA', 'SA', 'SAU', 'Saudi Arabia', 682),
(179, 'SENEGAL', 'SN', 'SEN', 'Senegal', 686),
(180, 'SEYCHELLES', 'SC', 'SYC', 'Seychelles', 690),
(181, 'SIERRA LEONE', 'SL', 'SLE', 'Sierra Leone', 694),
(182, 'SINGAPORE', 'SG', 'SGP', 'Singapore', 702),
(183, 'SLOVAKIA', 'SK', 'SVK', 'Slovakia', 703),
(184, 'SLOVENIA', 'SI', 'SVN', 'Slovenia', 705),
(185, 'SOLOMON ISLANDS', 'SB', 'SLB', 'Solomon Islands', 90),
(186, 'SOMALIA', 'SO', 'SOM', 'Somalia', 706),
(187, 'SOUTH AFRICA', 'ZA', 'ZAF', 'South Africa', 710),
(188, 'SPAIN', 'ES', 'ESP', 'Spain', 724),
(189, 'SRI LANKA', 'LK', 'LKA', 'Sri Lanka', 144),
(190, 'SUDAN', 'SD', 'SDN', 'Sudan', 736),
(191, 'SURINAME', 'SR', 'SUR', 'Suriname', 740),
(192, 'SVALBARD AND JAN MAYEN', 'SJ', 'SJM', 'Svalbard and Jan Mayen', 744),
(193, 'SWAZILAND', 'SZ', 'SWZ', 'Swaziland', 748),
(194, 'SWEDEN', 'SE', 'SWE', 'Sweden', 752),
(195, 'SWITZERLAND', 'CH', 'CHE', 'Switzerland', 756),
(196, 'SYRIAN ARAB REPUBLIC', 'SY', 'SYR', 'Syrian Arab Republic', 760),
(197, 'TAIWAN, PROVINCE OF CHINA', 'TW', 'TWN', 'Taiwan', 158),
(198, 'TAJIKISTAN', 'TJ', 'TJK', 'Tajikistan', 762),
(199, 'TANZANIA, UNITED REPUBLIC OF', 'TZ', 'TZA', 'Tanzania, United Republic of', 834),
(200, 'THAILAND', 'TH', 'THA', 'Thailand', 764),
(201, 'TOGO', 'TG', 'TGO', 'Togo', 768),
(202, 'TOKELAU', 'TK', 'TKL', 'Tokelau', 772),
(203, 'TONGA', 'TO', 'TON', 'Tonga', 776),
(204, 'TRINIDAD AND TOBAGO', 'TT', 'TTO', 'Trinidad and Tobago', 780),
(205, 'TUNISIA', 'TN', 'TUN', 'Tunisia', 788),
(206, 'TURKEY', 'TR', 'TUR', 'Turkey', 792),
(207, 'TURKMENISTAN', 'TM', 'TKM', 'Turkmenistan', 795),
(208, 'TURKS AND CAICOS ISLANDS', 'TC', 'TCA', 'Turks and Caicos Islands', 796),
(209, 'TUVALU', 'TV', 'TUV', 'Tuvalu', 798),
(210, 'UGANDA', 'UG', 'UGA', 'Uganda', 800),
(211, 'UKRAINE', 'UA', 'UKR', 'Ukraine', 804),
(212, 'UNITED ARAB EMIRATES', 'AE', 'ARE', 'United Arab Emirates', 784),
(213, 'UNITED KINGDOM', 'GB', 'GBR', 'United Kingdom', 826),
(214, 'UNITED STATES', 'US', 'USA', 'United States', 840),
(215, 'URUGUAY', 'UY', 'URY', 'Uruguay', 858),
(216, 'UZBEKISTAN', 'UZ', 'UZB', 'Uzbekistan', 860),
(217, 'VANUATU', 'VU', 'VUT', 'Vanuatu', 548),
(218, 'VENEZUELA', 'VE', 'VEN', 'Venezuela', 862),
(219, 'VIET NAM', 'VN', 'VNM', 'Viet Nam', 704),
(220, 'VIRGIN ISLANDS, BRITISH', 'VG', 'VGB', 'Virgin Islands, British', 92),
(221, 'VIRGIN ISLANDS, U.S.', 'VI', 'VIR', 'Virgin Islands, U.S.', 850),
(222, 'WALLIS AND FUTUNA', 'WF', 'WLF', 'Wallis and Futuna', 876),
(223, 'WESTERN SAHARA', 'EH', 'ESH', 'Western Sahara', 732),
(224, 'YEMEN', 'YE', 'YEM', 'Yemen', 887),
(225, 'ZAMBIA', 'ZM', 'ZMB', 'Zambia', 894),
(226, 'ZIMBABWE', 'ZW', 'ZWE', 'Zimbabwe', 716);

-- --------------------------------------------------------

--
-- Table structure for table `spree_creditcards`
--

CREATE TABLE IF NOT EXISTS `spree_creditcards` (
  `id` int(11) NOT NULL auto_increment,
  `month` varchar(255) default NULL,
  `year` varchar(255) default NULL,
  `cc_type` varchar(255) default NULL,
  `last_digits` varchar(255) default NULL,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `start_month` varchar(255) default NULL,
  `start_year` varchar(255) default NULL,
  `issue_number` varchar(255) default NULL,
  `address_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `gateway_customer_profile_id` varchar(255) default NULL,
  `gateway_payment_profile_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `spree_creditcards`
--

INSERT INTO `spree_creditcards` (`id`, `month`, `year`, `cc_type`, `last_digits`, `first_name`, `last_name`, `start_month`, `start_year`, `issue_number`, `address_id`, `created_at`, `updated_at`, `gateway_customer_profile_id`, `gateway_payment_profile_id`) VALUES
(1, '4', '2014', 'visa', '0679', 'Isaac', 'Wooten', NULL, NULL, NULL, NULL, '2012-08-03 01:49:33', '2012-08-03 01:49:33', NULL, NULL),
(2, '4', '2014', 'visa', '0679', 'Isaac', 'Wooten', NULL, NULL, NULL, NULL, '2012-08-03 19:33:56', '2012-08-03 19:33:56', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `spree_gateways`
--

CREATE TABLE IF NOT EXISTS `spree_gateways` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `description` text,
  `active` tinyint(1) default '1',
  `environment` varchar(255) default 'development',
  `server` varchar(255) default 'test',
  `test_mode` tinyint(1) default '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_inventory_units`
--

CREATE TABLE IF NOT EXISTS `spree_inventory_units` (
  `id` int(11) NOT NULL auto_increment,
  `lock_version` int(11) default '0',
  `state` varchar(255) default NULL,
  `variant_id` int(11) default NULL,
  `order_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `shipment_id` int(11) default NULL,
  `return_authorization_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_inventory_units_on_variant_id` (`variant_id`),
  KEY `index_inventory_units_on_order_id` (`order_id`),
  KEY `index_inventory_units_on_shipment_id` (`shipment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `spree_inventory_units`
--

INSERT INTO `spree_inventory_units` (`id`, `lock_version`, `state`, `variant_id`, `order_id`, `created_at`, `updated_at`, `shipment_id`, `return_authorization_id`) VALUES
(1, 0, 'sold', 6, 1, '2012-08-03 01:49:35', '2012-08-03 01:49:35', 1, NULL),
(2, 0, 'sold', 12, 1, '2012-08-03 01:49:35', '2012-08-03 01:49:35', 1, NULL),
(3, 0, 'sold', 11, 1, '2012-08-03 01:49:35', '2012-08-03 01:49:35', 1, NULL),
(4, 0, 'sold', 13, 1, '2012-08-03 01:49:35', '2012-08-03 01:49:35', 1, NULL),
(5, 0, 'sold', 10, 4, '2012-08-03 19:33:58', '2012-08-03 19:33:58', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `spree_line_items`
--

CREATE TABLE IF NOT EXISTS `spree_line_items` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` int(11) default NULL,
  `variant_id` int(11) default NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `index_line_items_on_order_id` (`order_id`),
  KEY `index_line_items_on_variant_id` (`variant_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `spree_line_items`
--

INSERT INTO `spree_line_items` (`id`, `order_id`, `variant_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(5, 1, 6, 1, '0.01', '2012-08-03 00:47:02', '2012-08-03 00:47:02'),
(6, 1, 12, 1, '0.01', '2012-08-03 01:37:53', '2012-08-03 01:37:53'),
(7, 1, 11, 1, '0.01', '2012-08-03 01:38:02', '2012-08-03 01:38:02'),
(8, 1, 13, 1, '0.01', '2012-08-03 01:38:09', '2012-08-03 01:38:09'),
(9, 3, 10, 1, '0.01', '2012-08-03 09:24:58', '2012-08-03 09:24:58'),
(10, 4, 10, 1, '0.01', '2012-08-03 19:32:51', '2012-08-03 19:32:51'),
(12, 6, 1, 1, '0.01', '2012-10-03 04:21:21', '2012-10-03 04:21:21'),
(18, 12, 23, 4, '2199.00', '2012-10-10 22:11:39', '2012-10-10 22:11:39'),
(19, 14, 20, 1, '1999.99', '2012-10-29 08:36:28', '2012-10-29 08:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `spree_log_entries`
--

CREATE TABLE IF NOT EXISTS `spree_log_entries` (
  `id` int(11) NOT NULL auto_increment,
  `source_id` int(11) default NULL,
  `source_type` varchar(255) default NULL,
  `details` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `spree_log_entries`
--

INSERT INTO `spree_log_entries` (`id`, `source_id`, `source_type`, `details`, `created_at`, `updated_at`) VALUES
(1, 1, 'Spree::Payment', '--- !ruby/object:ActiveMerchant::Billing::Response\nparams:\n  response_code: 1\n  response_reason_code: ''1''\n  response_reason_text: This transaction has been approved.\n  avs_result_code: Y\n  transaction_id: ''4550360672''\n  card_code: M\nmessage: This transaction has been approved\nsuccess: true\ntest: false\nauthorization: ''4550360672''\nfraud_review: false\navs_result:\n  code: Y\n  message: Street address and 5-digit postal code match.\n  street_match: Y\n  postal_match: Y\ncvv_result:\n  code: M\n  message: Match\n', '2012-08-03 01:49:35', '2012-08-03 01:49:35'),
(2, 2, 'Spree::Payment', '--- !ruby/object:ActiveMerchant::Billing::Response\nparams:\n  response_code: 1\n  response_reason_code: ''1''\n  response_reason_text: This transaction has been approved.\n  avs_result_code: Y\n  transaction_id: ''4552177844''\n  card_code: M\nmessage: This transaction has been approved\nsuccess: true\ntest: false\nauthorization: ''4552177844''\nfraud_review: false\navs_result:\n  code: Y\n  message: Street address and 5-digit postal code match.\n  street_match: Y\n  postal_match: Y\ncvv_result:\n  code: M\n  message: Match\n', '2012-08-03 19:33:58', '2012-08-03 19:33:58');

-- --------------------------------------------------------

--
-- Table structure for table `spree_mail_methods`
--

CREATE TABLE IF NOT EXISTS `spree_mail_methods` (
  `id` int(11) NOT NULL auto_increment,
  `environment` varchar(255) default NULL,
  `active` tinyint(1) default '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_option_types`
--

CREATE TABLE IF NOT EXISTS `spree_option_types` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `presentation` varchar(100) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `spree_option_types`
--

INSERT INTO `spree_option_types` (`id`, `name`, `presentation`, `created_at`, `updated_at`, `position`) VALUES
(1, 'Size', 'Size', '2012-08-03 00:35:24', '2012-10-08 18:40:00', 0),
(3, 'Bolt Pattern', 'Bolt Pattern', '2012-10-08 19:02:44', '2012-10-08 19:02:44', 0);

-- --------------------------------------------------------

--
-- Table structure for table `spree_option_types_prototypes`
--

CREATE TABLE IF NOT EXISTS `spree_option_types_prototypes` (
  `prototype_id` int(11) default NULL,
  `option_type_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spree_option_types_prototypes`
--

INSERT INTO `spree_option_types_prototypes` (`prototype_id`, `option_type_id`) VALUES
(1, 1),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `spree_option_values`
--

CREATE TABLE IF NOT EXISTS `spree_option_values` (
  `id` int(11) NOT NULL auto_increment,
  `position` int(11) default NULL,
  `name` varchar(255) default NULL,
  `presentation` varchar(255) default NULL,
  `option_type_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `spree_option_values`
--

INSERT INTO `spree_option_values` (`id`, `position`, `name`, `presentation`, `option_type_id`, `created_at`, `updated_at`) VALUES
(1, 1, '22 x 9', '22 x 9', 1, '2012-08-03 00:38:10', '2012-10-08 18:45:15'),
(2, 2, '22 x 10.5', '22 x 10.5', 1, '2012-08-03 00:38:20', '2012-10-08 18:45:15'),
(7, 3, '24 x 9', '24 x 9', 1, '2012-10-08 18:45:15', '2012-10-08 18:45:15'),
(8, 4, '24 x 10.5', '24 x 10.5', 1, '2012-10-08 18:45:15', '2012-10-08 18:45:15'),
(9, 1, '5', '5', 3, '2012-10-08 19:03:03', '2012-10-08 19:03:03'),
(10, 2, '6', '6', 3, '2012-10-08 19:03:03', '2012-10-08 19:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `spree_option_values_variants`
--

CREATE TABLE IF NOT EXISTS `spree_option_values_variants` (
  `variant_id` int(11) default NULL,
  `option_value_id` int(11) default NULL,
  KEY `index_option_values_variants_on_variant_id` (`variant_id`),
  KEY `index_option_values_variants_on_variant_id_and_option_value_id` (`variant_id`,`option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spree_option_values_variants`
--

INSERT INTO `spree_option_values_variants` (`variant_id`, `option_value_id`) VALUES
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 2),
(9, 2),
(10, 1),
(11, 2),
(14, 1),
(17, 1),
(18, 1),
(19, 2),
(20, 1),
(23, 1),
(24, 2),
(25, 7),
(26, 8),
(28, 1),
(28, 9),
(29, 2),
(29, 9),
(30, 7),
(30, 9),
(31, 8),
(31, 9),
(32, 1),
(32, 10),
(33, 2),
(33, 10),
(34, 7),
(34, 10),
(35, 8),
(35, 10),
(41, 1),
(41, 9),
(42, 2),
(42, 9),
(43, 7),
(43, 9),
(44, 8),
(44, 9),
(45, 1),
(45, 10),
(46, 2),
(46, 10),
(47, 7),
(47, 10),
(48, 8),
(48, 10),
(51, 1),
(51, 9),
(52, 2),
(52, 9),
(53, 7),
(53, 9),
(54, 8),
(54, 9),
(55, 1),
(55, 10),
(56, 2),
(56, 10),
(57, 7),
(57, 10),
(58, 8),
(58, 10);

-- --------------------------------------------------------

--
-- Table structure for table `spree_orders`
--

CREATE TABLE IF NOT EXISTS `spree_orders` (
  `id` int(11) NOT NULL auto_increment,
  `number` varchar(15) default NULL,
  `item_total` decimal(8,2) NOT NULL default '0.00',
  `total` decimal(8,2) NOT NULL default '0.00',
  `state` varchar(255) default NULL,
  `adjustment_total` decimal(8,2) NOT NULL default '0.00',
  `credit_total` decimal(8,2) NOT NULL default '0.00',
  `user_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `completed_at` datetime default NULL,
  `bill_address_id` int(11) default NULL,
  `ship_address_id` int(11) default NULL,
  `payment_total` decimal(8,2) default '0.00',
  `shipping_method_id` int(11) default NULL,
  `shipment_state` varchar(255) default NULL,
  `payment_state` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `special_instructions` text,
  PRIMARY KEY  (`id`),
  KEY `index_orders_on_number` (`number`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `spree_orders`
--

INSERT INTO `spree_orders` (`id`, `number`, `item_total`, `total`, `state`, `adjustment_total`, `credit_total`, `user_id`, `created_at`, `updated_at`, `completed_at`, `bill_address_id`, `ship_address_id`, `payment_total`, `shipping_method_id`, `shipment_state`, `payment_state`, `email`, `special_instructions`) VALUES
(1, 'R763067177', '0.04', '0.04', 'complete', '0.00', '0.00', 1, '2012-08-03 00:32:57', '2012-08-03 01:49:35', '2012-08-03 01:49:35', 1, 2, '0.00', 1, 'pending', 'balance_due', 'i.wooten@gmail.com', NULL),
(3, 'R886801600', '0.01', '0.01', 'payment', '0.00', '0.00', 4, '2012-08-03 09:24:58', '2012-08-03 09:26:30', NULL, 3, 4, '0.00', 1, 'pending', 'balance_due', 'i.wooten@gmail.com', NULL),
(4, 'R686105762', '0.01', '0.01', 'complete', '0.00', '0.00', 5, '2012-08-03 19:32:51', '2012-08-03 19:33:58', '2012-08-03 19:33:58', 5, 6, '0.00', 1, 'pending', 'balance_due', 'isaac@levid.com', NULL),
(5, 'R415608063', '0.00', '0.00', 'cart', '0.00', '0.00', 1, '2012-08-03 19:34:26', '2012-08-03 19:34:26', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, 'i.wooten@gmail.com', NULL),
(6, 'R886205626', '0.01', '0.01', 'cart', '0.00', '0.00', 6, '2012-10-03 04:21:20', '2012-10-03 04:21:20', NULL, NULL, NULL, '0.00', NULL, NULL, 'balance_due', NULL, NULL),
(7, 'R181535538', '0.00', '0.00', 'cart', '0.00', '0.00', 2, '2012-10-03 08:10:05', '2012-10-05 05:42:24', NULL, NULL, NULL, '0.00', NULL, NULL, 'paid', 'amar@mindctrl.com', NULL),
(8, 'R527026662', '0.00', '0.00', 'cart', '0.00', '0.00', 8, '2012-10-04 22:09:43', '2012-10-04 22:09:43', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, NULL),
(9, 'R713482456', '0.00', '0.00', 'cart', '0.00', '0.00', 9, '2012-10-06 02:17:36', '2012-10-06 02:17:36', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, NULL),
(10, 'R148231836', '0.00', '0.00', 'cart', '0.00', '0.00', 10, '2012-10-07 00:07:37', '2012-10-07 00:07:37', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, NULL),
(11, 'R237238450', '0.00', '0.00', 'cart', '0.00', '0.00', 11, '2012-10-09 07:13:29', '2012-10-09 07:13:29', NULL, NULL, NULL, '0.00', NULL, NULL, 'balance_due', NULL, NULL),
(12, 'R760527080', '8796.00', '8796.00', 'cart', '0.00', '0.00', 12, '2012-10-10 22:11:38', '2012-10-10 22:11:38', NULL, NULL, NULL, '0.00', NULL, NULL, 'balance_due', NULL, NULL),
(13, 'R330157626', '0.00', '0.00', 'cart', '0.00', '0.00', 13, '2012-10-10 23:32:25', '2012-10-10 23:32:25', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, NULL),
(14, 'R584848885', '1999.99', '1999.99', 'cart', '0.00', '0.00', 14, '2012-10-29 08:36:28', '2012-10-29 08:36:28', NULL, NULL, NULL, '0.00', NULL, NULL, 'balance_due', NULL, NULL),
(15, 'R704043084', '0.00', '0.00', 'cart', '0.00', '0.00', 15, '2012-10-29 09:06:48', '2012-10-29 09:06:48', NULL, NULL, NULL, '0.00', NULL, NULL, NULL, 'aman@dubleds.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `spree_payments`
--

CREATE TABLE IF NOT EXISTS `spree_payments` (
  `id` int(11) NOT NULL auto_increment,
  `amount` decimal(8,2) NOT NULL default '0.00',
  `order_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `source_id` int(11) default NULL,
  `source_type` varchar(255) default NULL,
  `payment_method_id` int(11) default NULL,
  `state` varchar(255) default NULL,
  `response_code` varchar(255) default NULL,
  `avs_response` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `spree_payments`
--

INSERT INTO `spree_payments` (`id`, `amount`, `order_id`, `created_at`, `updated_at`, `source_id`, `source_type`, `payment_method_id`, `state`, `response_code`, `avs_response`) VALUES
(1, '0.04', 1, '2012-08-03 01:49:33', '2012-08-03 01:49:35', 1, 'Spree::Creditcard', 1, 'pending', '4550360672', 'Y'),
(2, '0.01', 4, '2012-08-03 19:33:56', '2012-08-03 19:33:58', 2, 'Spree::Creditcard', 1, 'pending', '4552177844', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `spree_payment_methods`
--

CREATE TABLE IF NOT EXISTS `spree_payment_methods` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `description` text,
  `active` tinyint(1) default '1',
  `environment` varchar(255) default 'development',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime default NULL,
  `display_on` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `spree_payment_methods`
--

INSERT INTO `spree_payment_methods` (`id`, `type`, `name`, `description`, `active`, `environment`, `created_at`, `updated_at`, `deleted_at`, `display_on`) VALUES
(1, 'Spree::Gateway::AuthorizeNet', 'Credit Card Payment', 'Authorize.net', 1, 'production', '2012-08-03 00:44:11', '2012-08-03 00:44:11', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `spree_pending_promotions`
--

CREATE TABLE IF NOT EXISTS `spree_pending_promotions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `promotion_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_spree_pending_promotions_on_user_id` (`user_id`),
  KEY `index_spree_pending_promotions_on_promotion_id` (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_preferences`
--

CREATE TABLE IF NOT EXISTS `spree_preferences` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `owner_id` int(11) default NULL,
  `owner_type` varchar(255) default NULL,
  `value` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `key` varchar(255) default NULL,
  `value_type` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_spree_preferences_on_key` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `spree_preferences`
--

INSERT INTO `spree_preferences` (`id`, `name`, `owner_id`, `owner_type`, `value`, `created_at`, `updated_at`, `key`, `value_type`) VALUES
(1, NULL, NULL, NULL, 'LED Wheels, Inc', '2012-08-03 00:33:42', '2012-08-03 00:33:42', 'spree/app_configuration/site_name', 'string'),
(2, NULL, NULL, NULL, '', '2012-08-03 00:33:42', '2012-08-03 00:33:42', 'spree/app_configuration/default_seo_title', 'string'),
(3, NULL, NULL, NULL, 'led, wheels, rims, dub, dub leds, led wheels', '2012-08-03 00:33:42', '2012-08-03 00:33:42', 'spree/app_configuration/default_meta_keywords', 'string'),
(4, NULL, NULL, NULL, 'LED Wheels Store', '2012-08-03 00:33:42', '2012-08-03 00:33:42', 'spree/app_configuration/default_meta_description', 'string'),
(5, NULL, NULL, NULL, 'dubleds.com', '2012-08-03 00:33:42', '2012-08-03 00:33:42', 'spree/app_configuration/site_url', 'string'),
(6, NULL, NULL, NULL, '1', '2012-08-03 00:33:42', '2012-08-03 00:33:42', 'spree/app_configuration/allow_ssl_in_production', 'boolean'),
(7, NULL, NULL, NULL, '1', '2012-08-03 00:33:42', '2012-08-03 00:33:42', 'spree/app_configuration/allow_ssl_in_staging', 'boolean'),
(8, NULL, NULL, NULL, '1', '2012-08-03 00:33:42', '2012-08-03 00:33:42', 'spree/app_configuration/allow_ssl_in_development_and_test', 'boolean'),
(9, NULL, NULL, NULL, '1', '2012-08-03 00:33:42', '2012-08-03 00:33:42', 'spree/app_configuration/check_for_spree_alerts', 'boolean'),
(10, NULL, NULL, NULL, '9h9pHN4Gbs', '2012-08-03 00:44:14', '2012-08-03 00:44:14', 'spree/gateway/authorize_net/login/1', 'string'),
(11, NULL, NULL, NULL, '96b294Sn4qv4HsS6', '2012-08-03 00:44:14', '2012-08-03 00:44:14', 'spree/gateway/authorize_net/password/1', 'string'),
(12, NULL, NULL, NULL, 'live', '2012-08-03 00:44:14', '2012-08-03 00:44:14', 'spree/gateway/authorize_net/server/1', 'string'),
(13, NULL, NULL, NULL, '0', '2012-08-03 00:44:14', '2012-08-03 00:44:14', 'spree/gateway/authorize_net/test_mode/1', 'boolean'),
(14, NULL, NULL, NULL, '2012-10-29T03:18:19-07:00', '2012-08-03 00:56:17', '2012-10-29 10:18:19', 'spree/app_configuration/last_check_for_spree_alerts', 'string'),
(15, NULL, NULL, NULL, '13009', '2012-08-03 00:56:37', '2012-08-03 00:56:37', 'spree/dash_configuration/app_id', 'string'),
(16, NULL, NULL, NULL, '309a7a4b555d5d67b7eedcb806543e79', '2012-08-03 00:56:37', '2012-08-03 00:56:37', 'spree/dash_configuration/app_token', 'string'),
(17, NULL, NULL, NULL, '52612', '2012-08-03 00:56:37', '2012-08-03 00:56:37', 'spree/dash_configuration/site_id', 'string'),
(18, NULL, NULL, NULL, '7e81f7f41b7cd2cf6e79e6a8ff112b8d', '2012-08-03 00:56:37', '2012-08-03 00:56:37', 'spree/dash_configuration/token', 'string'),
(19, NULL, NULL, NULL, '{"mini":"100x100>","small":"200x200>","product":"350x350>","large":"600x600>"}', '2012-10-08 18:54:18', '2012-10-08 18:54:18', 'spree/app_configuration/attachment_styles', 'string'),
(20, NULL, NULL, NULL, ':rails_root/public/spree/products/:id/:style/:basename.:extension', '2012-10-08 18:54:18', '2012-10-08 18:54:18', 'spree/app_configuration/attachment_path', 'string'),
(21, NULL, NULL, NULL, '/spree/products/:id/:style/:basename.:extension', '2012-10-08 18:54:18', '2012-10-08 18:54:18', 'spree/app_configuration/attachment_default_url', 'string'),
(22, NULL, NULL, NULL, 'product', '2012-10-08 18:54:18', '2012-10-08 18:54:18', 'spree/app_configuration/attachment_default_style', 'string'),
(23, NULL, NULL, NULL, '0', '2012-10-08 18:54:18', '2012-10-08 18:54:18', 'spree/app_configuration/use_s3', 'boolean'),
(24, NULL, NULL, NULL, '', '2012-10-08 18:54:18', '2012-10-08 18:54:18', 'spree/app_configuration/s3_access_key', 'string'),
(25, NULL, NULL, NULL, '', '2012-10-08 18:54:18', '2012-10-08 18:54:18', 'spree/app_configuration/s3_secret', 'string'),
(26, NULL, NULL, NULL, '', '2012-10-08 18:54:18', '2012-10-08 18:54:18', 'spree/app_configuration/s3_bucket', 'string'),
(27, NULL, NULL, NULL, '', '2012-10-08 18:54:18', '2012-10-08 18:54:18', 'spree/app_configuration/s3_protocol', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `spree_products`
--

CREATE TABLE IF NOT EXISTS `spree_products` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text,
  `available_on` datetime default NULL,
  `deleted_at` datetime default NULL,
  `permalink` varchar(255) default NULL,
  `meta_description` varchar(255) default NULL,
  `meta_keywords` varchar(255) default NULL,
  `tax_category_id` int(11) default NULL,
  `shipping_category_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `count_on_hand` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `index_products_on_available_on` (`available_on`),
  KEY `index_products_on_deleted_at` (`deleted_at`),
  KEY `index_products_on_name` (`name`),
  KEY `index_products_on_permalink` (`permalink`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `spree_products`
--

INSERT INTO `spree_products` (`id`, `name`, `description`, `available_on`, `deleted_at`, `permalink`, `meta_description`, `meta_keywords`, `tax_category_id`, `shipping_category_id`, `created_at`, `updated_at`, `count_on_hand`) VALUES
(1, 'Chrome', 'Classic Chrome Series', '2012-10-07 00:00:00', '2012-10-08 17:59:30', 'chrome343434', 'chrome, dub, leds, visual, lights, rims, spinners', 'chrome, dub, leds, visual, lights, rims, spinners', NULL, 1, '2012-08-03 00:31:24', '2012-10-08 21:48:21', 100),
(2, 'Rim 2', 'Rim 2 Store Description goes here...', '2012-07-01 00:00:00', '2012-10-08 17:38:27', 'rim-2', '', '', NULL, 1, '2012-08-03 00:31:24', '2012-08-03 01:35:34', 5),
(3, 'Chrome', '', '2012-10-29 00:00:00', '2012-10-29 10:22:30', 'chrome', '', '', NULL, NULL, '2012-10-08 17:57:15', '2012-10-29 10:49:00', 100),
(4, 'COPY OF Chrome', 'Classic Chrome Series', '2012-10-07 00:00:00', '2012-10-08 18:38:53', 'chrome-1-2', 'chrome, dub, leds, visual, lights, rims, spinners', 'chrome, dub, leds, visual, lights, rims, spinners', NULL, 1, '2012-10-08 18:38:31', '2012-10-08 18:38:32', 100),
(5, 'COPY OF Chrome', 'Classic Chrome Series', '2012-10-07 00:00:00', '2012-10-08 18:47:36', 'chrome-1-3', 'chrome, dub, leds, visual, lights, rims, spinners', 'chrome, dub, leds, visual, lights, rims, spinners', NULL, 1, '2012-10-08 18:47:23', '2012-10-08 18:47:23', 100),
(6, 'Matte Black', '', '2012-10-29 00:00:00', '2012-10-29 10:31:08', 'matte-black', '', '', NULL, NULL, '2012-10-08 18:48:18', '2012-10-29 10:45:53', 100),
(7, 'Matte Black 2', NULL, '2012-10-07 00:00:00', '2012-10-08 19:07:48', 'matte-black-2', NULL, NULL, NULL, NULL, '2012-10-08 19:05:08', '2012-10-08 19:05:08', 0),
(8, 'COPY OF Matte Black', '', '2012-10-07 00:00:00', '2012-10-29 10:18:42', 'matte-black-3', '', '', NULL, NULL, '2012-10-08 21:29:02', '2012-10-12 17:58:21', 0),
(9, 'COPY OF Matte Black', '', '2012-10-07 00:00:00', '2012-10-29 10:18:44', 'matte-black-4', '', '', NULL, NULL, '2012-10-08 21:29:17', '2012-10-12 17:58:28', 0),
(10, 'COPY OF Matte Black', '', '2012-10-07 00:00:00', '2012-10-29 10:18:47', 'matte-black-5', '', '', NULL, NULL, '2012-10-08 21:29:51', '2012-10-12 17:58:36', 0),
(11, 'COPY OF Chrome', 'Classic Chrome Series', '2012-10-07 00:00:00', '2012-10-29 10:31:05', 'chrome-4', 'chrome, dub, leds, visual, lights, rims, spinners', 'chrome, dub, leds, visual, lights, rims, spinners', NULL, 1, '2012-10-29 10:20:03', '2012-10-29 10:20:03', 100),
(12, 'Chrome', NULL, '2012-10-29 00:00:00', NULL, 'chrome-5', NULL, NULL, NULL, NULL, '2012-10-29 10:31:49', '2012-10-29 10:37:21', 0),
(13, 'COPY OF Chrome', NULL, '2012-10-29 00:00:00', '2012-10-29 10:39:21', 'chrome-5-6', NULL, NULL, NULL, NULL, '2012-10-29 10:38:13', '2012-10-29 10:38:13', 0),
(14, 'Matte Black', NULL, '2012-10-29 00:00:00', NULL, 'matte-black-6', NULL, NULL, NULL, NULL, '2012-10-29 10:39:47', '2012-10-29 10:39:48', 0);

-- --------------------------------------------------------

--
-- Table structure for table `spree_products_promotion_rules`
--

CREATE TABLE IF NOT EXISTS `spree_products_promotion_rules` (
  `product_id` int(11) default NULL,
  `promotion_rule_id` int(11) default NULL,
  KEY `index_products_promotion_rules_on_product_id` (`product_id`),
  KEY `index_products_promotion_rules_on_promotion_rule_id` (`promotion_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `spree_products_taxons`
--

CREATE TABLE IF NOT EXISTS `spree_products_taxons` (
  `product_id` int(11) default NULL,
  `taxon_id` int(11) default NULL,
  KEY `index_products_taxons_on_product_id` (`product_id`),
  KEY `index_products_taxons_on_taxon_id` (`taxon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `spree_product_option_types`
--

CREATE TABLE IF NOT EXISTS `spree_product_option_types` (
  `id` int(11) NOT NULL auto_increment,
  `position` int(11) default NULL,
  `product_id` int(11) default NULL,
  `option_type_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `spree_product_option_types`
--

INSERT INTO `spree_product_option_types` (`id`, `position`, `product_id`, `option_type_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '2012-08-03 00:35:38', '2012-08-03 00:35:38'),
(2, 1, 1, 1, '2012-10-08 17:53:13', '2012-10-08 17:53:13'),
(5, 1, 3, 1, '2012-10-08 18:46:14', '2012-10-08 18:46:14'),
(6, 1, 5, 1, '2012-10-08 18:47:23', '2012-10-08 18:47:23'),
(7, 1, 6, 1, '2012-10-08 18:48:18', '2012-10-08 18:48:18'),
(8, 1, 7, 3, '2012-10-08 19:05:08', '2012-10-08 19:05:08'),
(9, 2, 7, 1, '2012-10-08 19:05:08', '2012-10-08 19:05:08'),
(10, 1, 8, 1, '2012-10-08 21:29:02', '2012-10-08 21:29:02'),
(11, 1, 9, 1, '2012-10-08 21:29:17', '2012-10-08 21:29:17'),
(12, 1, 10, 1, '2012-10-08 21:29:51', '2012-10-08 21:29:51'),
(13, 1, 11, 1, '2012-10-29 10:20:03', '2012-10-29 10:20:03'),
(14, 1, 12, 3, '2012-10-29 10:31:49', '2012-10-29 10:31:49'),
(15, 2, 12, 1, '2012-10-29 10:31:49', '2012-10-29 10:31:49'),
(16, 1, 13, 1, '2012-10-29 10:38:13', '2012-10-29 10:38:13'),
(17, 2, 13, 3, '2012-10-29 10:38:13', '2012-10-29 10:38:13'),
(18, 1, 14, 3, '2012-10-29 10:39:47', '2012-10-29 10:39:47'),
(19, 2, 14, 1, '2012-10-29 10:39:47', '2012-10-29 10:39:47'),
(20, 2, 6, 3, '2012-10-29 10:42:38', '2012-10-29 10:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `spree_product_properties`
--

CREATE TABLE IF NOT EXISTS `spree_product_properties` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(255) default NULL,
  `product_id` int(11) default NULL,
  `property_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `index_product_properties_on_product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `spree_product_properties`
--

INSERT INTO `spree_product_properties` (`id`, `value`, `product_id`, `property_id`, `created_at`, `updated_at`) VALUES
(3, '', 3, 2, '2012-10-08 18:46:58', '2012-10-08 18:46:58'),
(4, '', 5, 2, '2012-10-08 18:47:23', '2012-10-08 18:47:23'),
(6, NULL, 7, 2, '2012-10-08 19:05:08', '2012-10-08 19:05:08'),
(7, NULL, 8, 2, '2012-10-08 21:29:02', '2012-10-08 21:29:02'),
(8, NULL, 9, 2, '2012-10-08 21:29:17', '2012-10-08 21:29:17'),
(9, NULL, 10, 2, '2012-10-08 21:29:51', '2012-10-08 21:29:51'),
(10, '', 11, 2, '2012-10-29 10:20:03', '2012-10-29 10:20:03'),
(11, NULL, 12, 2, '2012-10-29 10:31:49', '2012-10-29 10:31:49'),
(12, NULL, 13, 2, '2012-10-29 10:38:13', '2012-10-29 10:38:13'),
(13, NULL, 14, 2, '2012-10-29 10:39:47', '2012-10-29 10:39:47');

-- --------------------------------------------------------

--
-- Table structure for table `spree_promotion_actions`
--

CREATE TABLE IF NOT EXISTS `spree_promotion_actions` (
  `id` int(11) NOT NULL auto_increment,
  `activator_id` int(11) default NULL,
  `position` int(11) default NULL,
  `type` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_promotion_action_line_items`
--

CREATE TABLE IF NOT EXISTS `spree_promotion_action_line_items` (
  `id` int(11) NOT NULL auto_increment,
  `promotion_action_id` int(11) default NULL,
  `variant_id` int(11) default NULL,
  `quantity` int(11) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_promotion_rules`
--

CREATE TABLE IF NOT EXISTS `spree_promotion_rules` (
  `id` int(11) NOT NULL auto_increment,
  `activator_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `product_group_id` int(11) default NULL,
  `type` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `index_promotion_rules_on_product_group_id` (`product_group_id`),
  KEY `index_promotion_rules_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_promotion_rules_users`
--

CREATE TABLE IF NOT EXISTS `spree_promotion_rules_users` (
  `user_id` int(11) default NULL,
  `promotion_rule_id` int(11) default NULL,
  KEY `index_promotion_rules_users_on_user_id` (`user_id`),
  KEY `index_promotion_rules_users_on_promotion_rule_id` (`promotion_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `spree_properties`
--

CREATE TABLE IF NOT EXISTS `spree_properties` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `presentation` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `spree_properties`
--

INSERT INTO `spree_properties` (`id`, `name`, `presentation`, `created_at`, `updated_at`) VALUES
(2, 'Color', 'Chrome', '2012-10-08 18:45:34', '2012-10-08 18:45:34');

-- --------------------------------------------------------

--
-- Table structure for table `spree_properties_prototypes`
--

CREATE TABLE IF NOT EXISTS `spree_properties_prototypes` (
  `prototype_id` int(11) default NULL,
  `property_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spree_properties_prototypes`
--

INSERT INTO `spree_properties_prototypes` (`prototype_id`, `property_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `spree_prototypes`
--

CREATE TABLE IF NOT EXISTS `spree_prototypes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `spree_prototypes`
--

INSERT INTO `spree_prototypes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Rims', '2012-10-08 18:32:20', '2012-10-08 18:32:20');

-- --------------------------------------------------------

--
-- Table structure for table `spree_return_authorizations`
--

CREATE TABLE IF NOT EXISTS `spree_return_authorizations` (
  `id` int(11) NOT NULL auto_increment,
  `number` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  `amount` decimal(8,2) NOT NULL default '0.00',
  `order_id` int(11) default NULL,
  `reason` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_roles`
--

CREATE TABLE IF NOT EXISTS `spree_roles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=930089100 ;

--
-- Dumping data for table `spree_roles`
--

INSERT INTO `spree_roles` (`id`, `name`) VALUES
(1, 'admin'),
(770229923, 'user'),
(930089099, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `spree_roles_users`
--

CREATE TABLE IF NOT EXISTS `spree_roles_users` (
  `role_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  KEY `index_roles_users_on_role_id` (`role_id`),
  KEY `index_roles_users_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spree_roles_users`
--

INSERT INTO `spree_roles_users` (`role_id`, `user_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `spree_shipments`
--

CREATE TABLE IF NOT EXISTS `spree_shipments` (
  `id` int(11) NOT NULL auto_increment,
  `tracking` varchar(255) default NULL,
  `number` varchar(255) default NULL,
  `cost` decimal(8,2) default NULL,
  `shipped_at` datetime default NULL,
  `order_id` int(11) default NULL,
  `shipping_method_id` int(11) default NULL,
  `address_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `state` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_shipments_on_number` (`number`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `spree_shipments`
--

INSERT INTO `spree_shipments` (`id`, `tracking`, `number`, `cost`, `shipped_at`, `order_id`, `shipping_method_id`, `address_id`, `created_at`, `updated_at`, `state`) VALUES
(1, NULL, 'H74373107617', NULL, NULL, 1, 1, 2, '2012-08-03 01:49:14', '2012-08-03 01:49:14', 'pending'),
(2, NULL, 'H05303172664', NULL, NULL, 3, 1, 4, '2012-08-03 09:26:30', '2012-08-03 09:26:30', 'pending'),
(3, NULL, 'H76832511080', NULL, NULL, 4, 1, 6, '2012-08-03 19:33:41', '2012-08-03 19:33:41', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `spree_shipping_categories`
--

CREATE TABLE IF NOT EXISTS `spree_shipping_categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `spree_shipping_categories`
--

INSERT INTO `spree_shipping_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'UPS', '2012-08-03 00:33:57', '2012-08-03 00:33:57'),
(2, 'Fed EX', '2012-08-03 00:34:02', '2012-08-03 00:34:02');

-- --------------------------------------------------------

--
-- Table structure for table `spree_shipping_methods`
--

CREATE TABLE IF NOT EXISTS `spree_shipping_methods` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `zone_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `display_on` varchar(255) default NULL,
  `shipping_category_id` int(11) default NULL,
  `match_none` tinyint(1) default NULL,
  `match_all` tinyint(1) default NULL,
  `match_one` tinyint(1) default NULL,
  `deleted_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `spree_shipping_methods`
--

INSERT INTO `spree_shipping_methods` (`id`, `name`, `zone_id`, `created_at`, `updated_at`, `display_on`, `shipping_category_id`, `match_none`, `match_all`, `match_one`, `deleted_at`) VALUES
(1, 'UPS Ground', 2, '2012-08-03 00:34:15', '2012-08-03 00:34:15', '', 1, 0, 1, 0, NULL),
(2, 'Fed EX Ground', 2, '2012-08-03 00:34:28', '2012-08-03 00:34:28', '', 2, 0, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `spree_skrill_transactions`
--

CREATE TABLE IF NOT EXISTS `spree_skrill_transactions` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) default NULL,
  `amount` float default NULL,
  `currency` varchar(255) default NULL,
  `transaction_id` int(11) default NULL,
  `customer_id` int(11) default NULL,
  `payment_type` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_states`
--

CREATE TABLE IF NOT EXISTS `spree_states` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `abbr` varchar(255) default NULL,
  `country_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1061493586 ;

--
-- Dumping data for table `spree_states`
--

INSERT INTO `spree_states` (`id`, `name`, `abbr`, `country_id`) VALUES
(6764998, 'District of Columbia', 'DC', 214),
(17199670, 'Utah', 'UT', 214),
(37199952, 'Louisiana', 'LA', 214),
(41111624, 'Virginia', 'VA', 214),
(51943165, 'North Dakota', 'ND', 214),
(66390489, 'Wyoming', 'WY', 214),
(69729944, 'New Mexico', 'NM', 214),
(69870734, 'Connecticut', 'CT', 214),
(91367981, 'West Virginia', 'WV', 214),
(103680699, 'Wisconsin', 'WI', 214),
(177087202, 'North Carolina', 'NC', 214),
(179539703, 'Nevada', 'NV', 214),
(199950338, 'Hawaii', 'HI', 214),
(248548169, 'Oklahoma', 'OK', 214),
(267271847, 'Florida', 'FL', 214),
(276110813, 'California', 'CA', 214),
(298914262, 'Oregon', 'OR', 214),
(308473843, 'Kentucky', 'KY', 214),
(385551075, 'Massachusetts', 'MA', 214),
(403740659, 'Alaska', 'AK', 214),
(414569975, 'Washington', 'WA', 214),
(426832442, 'New Hampshire', 'NH', 214),
(471470972, 'Arkansas', 'AR', 214),
(471711976, 'Pennsylvania', 'PA', 214),
(474001862, 'Rhode Island', 'RI', 214),
(480368357, 'Maryland', 'MD', 214),
(485193526, 'Ohio', 'OH', 214),
(525212995, 'Texas', 'TX', 214),
(532363768, 'Mississippi', 'MS', 214),
(536031023, 'Colorado', 'CO', 214),
(597434151, 'South Carolina', 'SC', 214),
(615306087, 'South Dakota', 'SD', 214),
(625629523, 'Illinois', 'IL', 214),
(653576146, 'Missouri', 'MO', 214),
(673350891, 'Nebraska', 'NE', 214),
(721598219, 'Delaware', 'DE', 214),
(726305632, 'Tennessee', 'TN', 214),
(750950030, 'New Jersey', 'NJ', 214),
(769938586, 'Indiana', 'IN', 214),
(825306985, 'Iowa', 'IA', 214),
(876916760, 'Georgia', 'GA', 214),
(889445952, 'New York', 'NY', 214),
(931624400, 'Michigan', 'MI', 214),
(948208802, 'Arizona', 'AZ', 214),
(969722173, 'Kansas', 'KS', 214),
(982433740, 'Idaho', 'ID', 214),
(989115415, 'Vermont', 'VT', 214),
(999156632, 'Montana', 'MT', 214),
(1032288924, 'Minnesota', 'MN', 214),
(1055056709, 'Maine', 'ME', 214),
(1061493585, 'Alabama', 'AL', 214);

-- --------------------------------------------------------

--
-- Table structure for table `spree_state_changes`
--

CREATE TABLE IF NOT EXISTS `spree_state_changes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `previous_state` varchar(255) default NULL,
  `stateful_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `stateful_type` varchar(255) default NULL,
  `next_state` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `spree_state_changes`
--

INSERT INTO `spree_state_changes` (`id`, `name`, `previous_state`, `stateful_id`, `user_id`, `created_at`, `updated_at`, `stateful_type`, `next_state`) VALUES
(1, 'order', 'cart', 1, 1, '2012-08-03 01:49:38', '2012-08-03 01:49:38', 'Spree::Order', 'complete'),
(2, 'order', 'cart', 4, 5, '2012-08-03 19:34:02', '2012-08-03 19:34:02', 'Spree::Order', 'complete'),
(3, 'payment', 'balance_due', 7, 2, '2012-10-29 10:37:52', '2012-10-29 10:37:52', 'Spree::Order', 'paid'),
(4, 'payment', 'balance_due', 7, 2, '2012-10-29 10:37:52', '2012-10-29 10:37:52', 'Spree::Order', 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `spree_taxonomies`
--

CREATE TABLE IF NOT EXISTS `spree_taxonomies` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_taxons`
--

CREATE TABLE IF NOT EXISTS `spree_taxons` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `position` int(11) default '0',
  `name` varchar(255) NOT NULL,
  `permalink` varchar(255) default NULL,
  `taxonomy_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `lft` int(11) default NULL,
  `rgt` int(11) default NULL,
  `icon_file_name` varchar(255) default NULL,
  `icon_content_type` varchar(255) default NULL,
  `icon_file_size` int(11) default NULL,
  `icon_updated_at` datetime default NULL,
  `description` text,
  PRIMARY KEY  (`id`),
  KEY `index_taxons_on_permalink` (`permalink`),
  KEY `index_taxons_on_parent_id` (`parent_id`),
  KEY `index_taxons_on_taxonomy_id` (`taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_tax_categories`
--

CREATE TABLE IF NOT EXISTS `spree_tax_categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_default` tinyint(1) default '0',
  `deleted_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_tax_rates`
--

CREATE TABLE IF NOT EXISTS `spree_tax_rates` (
  `id` int(11) NOT NULL auto_increment,
  `amount` decimal(8,5) default NULL,
  `zone_id` int(11) default NULL,
  `tax_category_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `included_in_price` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_tokenized_permissions`
--

CREATE TABLE IF NOT EXISTS `spree_tokenized_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `permissable_id` int(11) default NULL,
  `permissable_type` varchar(255) default NULL,
  `token` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `index_tokenized_name_and_type` (`permissable_id`,`permissable_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `spree_tokenized_permissions`
--

INSERT INTO `spree_tokenized_permissions` (`id`, `permissable_id`, `permissable_type`, `token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Spree::Order', 'da8fb65dfa34c43e', '2012-08-03 00:32:57', '2012-08-03 00:32:57'),
(2, 2, 'Spree::Order', '0fefe7599348e095', '2012-08-03 00:35:25', '2012-08-03 00:35:25'),
(3, 3, 'Spree::Order', 'e4daeceb76bfb87a', '2012-08-03 09:24:58', '2012-08-03 09:24:58'),
(4, 4, 'Spree::Order', '5432b766950780d9', '2012-08-03 19:32:51', '2012-08-03 19:32:51'),
(5, 5, 'Spree::Order', '57277967fe0e23cf', '2012-08-03 19:34:26', '2012-08-03 19:34:26'),
(6, 6, 'Spree::Order', 'a99d443e9b1cc373', '2012-10-03 04:21:21', '2012-10-03 04:21:21'),
(7, 7, 'Spree::Order', '277c333487631afa', '2012-10-03 08:10:05', '2012-10-03 08:10:05'),
(8, 8, 'Spree::Order', '1db12b31c4efb164', '2012-10-04 22:09:44', '2012-10-04 22:09:44'),
(9, 9, 'Spree::Order', '6867cd869b62db2d', '2012-10-06 02:17:36', '2012-10-06 02:17:36'),
(10, 10, 'Spree::Order', 'd52e01ca4faf8104', '2012-10-07 00:07:37', '2012-10-07 00:07:37'),
(11, 11, 'Spree::Order', '8fababcf856cdd02', '2012-10-09 07:13:29', '2012-10-09 07:13:29'),
(12, 12, 'Spree::Order', 'a99a2db6e1b99775', '2012-10-10 22:11:38', '2012-10-10 22:11:38'),
(13, 13, 'Spree::Order', '526fc1096693c669', '2012-10-10 23:32:25', '2012-10-10 23:32:25'),
(14, 14, 'Spree::Order', '0aba142f25ce5128', '2012-10-29 08:36:28', '2012-10-29 08:36:28'),
(15, 15, 'Spree::Order', 'a6345824606dfe28', '2012-10-29 09:06:49', '2012-10-29 09:06:49');

-- --------------------------------------------------------

--
-- Table structure for table `spree_trackers`
--

CREATE TABLE IF NOT EXISTS `spree_trackers` (
  `id` int(11) NOT NULL auto_increment,
  `environment` varchar(255) default NULL,
  `analytics_id` varchar(255) default NULL,
  `active` tinyint(1) default '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spree_users`
--

CREATE TABLE IF NOT EXISTS `spree_users` (
  `id` int(11) NOT NULL auto_increment,
  `encrypted_password` varchar(255) default NULL,
  `password_salt` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `remember_token` varchar(255) default NULL,
  `persistence_token` varchar(255) default NULL,
  `reset_password_token` varchar(255) default NULL,
  `perishable_token` varchar(255) default NULL,
  `sign_in_count` int(11) NOT NULL default '0',
  `failed_attempts` int(11) NOT NULL default '0',
  `last_request_at` datetime default NULL,
  `current_sign_in_at` datetime default NULL,
  `last_sign_in_at` datetime default NULL,
  `current_sign_in_ip` varchar(255) default NULL,
  `last_sign_in_ip` varchar(255) default NULL,
  `login` varchar(255) default NULL,
  `ship_address_id` int(11) default NULL,
  `bill_address_id` int(11) default NULL,
  `username` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `authentication_token` varchar(255) default NULL,
  `unlock_token` varchar(255) default NULL,
  `locked_at` datetime default NULL,
  `remember_created_at` datetime default NULL,
  `reset_password_sent_at` datetime default NULL,
  `api_key` varchar(48) default NULL,
  `generator_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `email_idx_unique` (`email`),
  KEY `index_users_on_persistence_token` (`persistence_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `spree_users`
--

INSERT INTO `spree_users` (`id`, `encrypted_password`, `password_salt`, `email`, `remember_token`, `persistence_token`, `reset_password_token`, `perishable_token`, `sign_in_count`, `failed_attempts`, `last_request_at`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `login`, `ship_address_id`, `bill_address_id`, `username`, `name`, `created_at`, `updated_at`, `authentication_token`, `unlock_token`, `locked_at`, `remember_created_at`, `reset_password_sent_at`, `api_key`, `generator_id`) VALUES
(1, '398d4cb0a7b32e62c75f36fcdf89a57da61d381e03b857e20decac4fbf5cc71d5595db5e650446eb44e80c83404b3345a4779700428287545b39b41819888ac4', 'yqRt7TT9sFZZVEek6xSg', 'i.wooten@gmail.com', NULL, NULL, NULL, NULL, 3, 0, NULL, '2012-10-03 04:10:19', '2012-08-03 19:34:26', '76.169.1.175', '100.42.98.5', 'i.wooten@gmail.com', NULL, NULL, 'levid', 'Isaac Wooten', '2012-08-03 00:30:55', '2012-10-03 04:10:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'eb70c3a82003b57be962b9b7108b964df193948ba5a34ade93d447ace45b677ab5b3789a03762a966fca7ad5d85dc0b0dfc5740720f4cfaf57cca8254c58e1fb', '2dSM7yY8yEfV7YhxBnkk', 'amar@mindctrl.com', NULL, NULL, NULL, NULL, 6, 0, NULL, '2012-10-29 08:26:37', '2012-10-10 04:32:18', '69.162.16.18', '76.170.117.49', 'amar@mindctrl.com', NULL, NULL, NULL, NULL, '2012-08-03 00:31:47', '2012-10-29 08:26:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '7a4a9e59c6efe9cf61a57a15d7c7b01a571d1dc8ebf033e359b17a230f71653f0f83ae6309f9aafd938d1a7f1f3684648afa7c8ac5d7edf89e88f78434f0f599', 'kAxGkpXqBcCoKsszze7z', '8UVe6D79-9UWhTB34j8J@example.net', NULL, '8UVe6D79-9UWhTB34j8J', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '8UVe6D79-9UWhTB34j8J@example.net', NULL, NULL, NULL, NULL, '2012-08-03 19:32:51', '2012-08-03 19:32:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'ef8c06d36fff49cc1eb8a9e2713c0c6eb08b6eee16dbc1ce4579308d9be35a61f8ad3a12f4fe78dec5ce8a552d13f60e329116f2fdae232197fd9e7fe626ca5c', 'MPnQ1uwspoqHmVrENVxD', 'b2LQRtbGbruj_wItguMl@example.net', NULL, 'b2LQRtbGbruj_wItguMl', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'b2LQRtbGbruj_wItguMl@example.net', NULL, NULL, NULL, NULL, '2012-10-03 04:21:20', '2012-10-03 04:21:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '9ee5598f550bb2f8aae30174377c15bed805620e75721781f6e2fce3601f1649d14c98d75285fd7460d1680882422a5f297feb08af9ca6c8a217fabaf12b9b5c', '9gxmbLzK37fjaz1EQqcH', 'D_IQEmL8D-4UByFeInG5@example.net', NULL, 'D_IQEmL8D-4UByFeInG5', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'D_IQEmL8D-4UByFeInG5@example.net', NULL, NULL, NULL, NULL, '2012-10-03 08:10:05', '2012-10-03 08:10:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '80c6fe36a78758f1064aeb78a87e0680d109a96bba69299d7a3a3bc6bec9cc72c0e737799266b106b5cba24753f96eae47963f537b37e81bc7cf1fb08382a430', '2nCUiwCdryWigkiq4Nuh', 'iqMOu6UwtWFFWa7FKyy-@example.net', NULL, 'iqMOu6UwtWFFWa7FKyy-', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'iqMOu6UwtWFFWa7FKyy-@example.net', NULL, NULL, NULL, NULL, '2012-10-04 22:09:43', '2012-10-04 22:09:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'dcc226b556029c6731b74b08f6f7eb7a409601504ab209ffb2cf7df183bb50518e68f20181a008795658ac7da22f0970c719f5477bf0e61426639df9098b18bc', 'ZYxQcPEwXcDhENqiwQKS', '2hnGVHtdsQv5u4O6qT1j@example.net', NULL, '2hnGVHtdsQv5u4O6qT1j', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2hnGVHtdsQv5u4O6qT1j@example.net', NULL, NULL, NULL, NULL, '2012-10-06 02:17:36', '2012-10-06 02:17:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '5ba64119f6423895d6079fac2bb5ce31a6455793b8781540bfe9e88c700c854835421085b9c4df7b1cb06b43b985f47ec1d7d0089c262db8854b8ccf205efe4f', 'T8TSY8Yps6RphybwcfRa', 'ou0jyH7orYSVTHQV4f7w@example.net', NULL, 'ou0jyH7orYSVTHQV4f7w', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'ou0jyH7orYSVTHQV4f7w@example.net', NULL, NULL, NULL, NULL, '2012-10-07 00:07:36', '2012-10-07 00:07:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '47d09706bab8342a3147584d4007a59e1d902473ff57141e3727dc42e3c0af1c826d6050dadb79ae46a56d8479374f4459c2b781012ba4e4919b42ce986bf71d', 'um4brJkDxnHPx4BR6yhn', 'WxDVzovUudhxdjoD46y-@example.net', NULL, 'WxDVzovUudhxdjoD46y-', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'WxDVzovUudhxdjoD46y-@example.net', NULL, NULL, NULL, NULL, '2012-10-09 07:13:29', '2012-10-09 07:13:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '6491014b8080e903d661a7e0927827d21b85340984af61af069c707003a5728b616a054fe48bdf03750804596a0775dff5b044ce77125008a32d6feec09f41b4', 'e5EBTeQKCHsangENanbg', 'qopXB3u9tA771t9dPIzM@example.net', NULL, 'qopXB3u9tA771t9dPIzM', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'qopXB3u9tA771t9dPIzM@example.net', NULL, NULL, NULL, NULL, '2012-10-10 22:11:38', '2012-10-10 22:11:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'c605f6f84255d11ec9080cebb818d0875977ce35f68d86a70009918a7ba44b4b7b11c87e1dfa507b5790222167c34dd2b01bfcd2854507447b65f2e8d5dea54a', '3dFpVLPjxjR6cwXF6H6R', 'z8Cip4OLFTszdLxJoad7@example.net', NULL, 'z8Cip4OLFTszdLxJoad7', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'z8Cip4OLFTszdLxJoad7@example.net', NULL, NULL, NULL, NULL, '2012-10-10 23:32:25', '2012-10-10 23:32:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2e76085e32fefbfaf47be01941fd269270544186fdb3a22040e95aa00163e2734689178ee6fff92cbe43451bace6bb2716b96efd6b4012e36502fb8e47dfedf0', 'vYLGxpo3RPkVBuvKVvvi', 'R4vz5CsWi4MIM2hxoACF@example.net', NULL, 'R4vz5CsWi4MIM2hxoACF', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'R4vz5CsWi4MIM2hxoACF@example.net', NULL, NULL, NULL, NULL, '2012-10-29 08:36:28', '2012-10-29 08:36:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '55bae9fcb2746ae1f7330d582c3c942d3caddc8abf8f0aa2c3f915f631e38580ff50681e65098aa246f3f247c5861cb283be120c43acc600befc8f16020cbad5', 'FmfYz4ydwXdZRmrXjMVx', 'aman@dubleds.com', NULL, NULL, NULL, NULL, 2, 0, NULL, '2012-10-29 09:07:48', '2012-10-29 09:06:48', '69.162.16.19', '69.162.16.19', 'aman@dubleds.com', NULL, NULL, 'aman', 'Aman', '2012-10-29 09:06:48', '2012-10-29 09:07:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `spree_variants`
--

CREATE TABLE IF NOT EXISTS `spree_variants` (
  `id` int(11) NOT NULL auto_increment,
  `sku` varchar(255) NOT NULL default '',
  `price` decimal(8,2) NOT NULL,
  `weight` decimal(8,2) default NULL,
  `height` decimal(8,2) default NULL,
  `width` decimal(8,2) default NULL,
  `depth` decimal(8,2) default NULL,
  `deleted_at` datetime default NULL,
  `is_master` tinyint(1) default '0',
  `product_id` int(11) default NULL,
  `count_on_hand` int(11) NOT NULL default '0',
  `cost_price` decimal(8,2) default NULL,
  `position` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_variants_on_product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `spree_variants`
--

INSERT INTO `spree_variants` (`id`, `sku`, `price`, `weight`, `height`, `width`, `depth`, `deleted_at`, `is_master`, `product_id`, `count_on_hand`, `cost_price`, `position`) VALUES
(1, 'DL1001', '1999.99', NULL, NULL, NULL, NULL, '2012-10-08 17:59:30', 1, 1, 100, NULL, NULL),
(2, '123', '0.01', NULL, NULL, NULL, NULL, '2012-10-08 17:38:27', 1, 2, 5, '0.01', NULL),
(3, '123', '0.01', '10.00', '22.00', '22.00', '8.50', '2012-08-03 00:40:43', 0, 2, 5, '0.01', NULL),
(4, '1234', '0.01', '10.00', '22.00', '22.00', '9.50', '2012-08-03 00:40:42', 0, 2, 2, '0.01', NULL),
(5, '123125', '0.01', '10.00', '24.00', '24.00', '8.50', '2012-08-03 00:40:40', 0, 2, 10, '0.01', NULL),
(6, '123', '0.01', '10.00', '22.00', '22.00', '8.50', '2012-08-03 01:00:41', 0, 2, 4, '0.01', NULL),
(7, '12134', '0.01', '10.00', '22.00', '22.00', '9.50', '2012-08-03 01:00:46', 0, 2, 10, '0.01', NULL),
(8, '1234', '0.01', '10.00', '24.00', '24.00', '8.50', '2012-08-03 01:00:45', 0, 2, 10, '0.01', NULL),
(9, '1245125', '0.01', '10.00', '24.00', '24.00', '9.50', '2012-08-03 01:00:43', 0, 2, 10, '0.01', NULL),
(10, '123', '0.01', '5.00', '22.00', '22.00', '8.50', '2012-10-08 17:38:27', 0, 2, 4, '0.01', NULL),
(11, '122434', '0.01', '5.00', '22.00', '22.00', '9.50', '2012-10-08 17:38:27', 0, 2, 4, '0.01', NULL),
(12, '12314', '0.01', '5.00', '24.00', '24.00', '8.50', '2012-10-08 17:38:27', 0, 2, 4, '0.01', NULL),
(13, '124124142', '0.01', '5.00', '24.00', '24.00', '9.50', '2012-10-08 17:38:27', 0, 2, 4, '0.01', NULL),
(14, 'DL1002285', '2499.99', NULL, NULL, NULL, NULL, '2012-10-08 17:59:30', 0, 1, 100, NULL, NULL),
(15, 'DLCHR100', '2950.00', NULL, NULL, NULL, NULL, '2012-10-29 10:22:30', 1, 3, 100, '1.00', NULL),
(16, 'COPY OF DL100229', '1999.99', NULL, NULL, NULL, NULL, '2012-10-08 18:38:53', 1, 4, 100, NULL, NULL),
(17, 'DL100229', '1999.99', NULL, NULL, NULL, NULL, '2012-10-08 18:46:07', 0, 3, 100, NULL, NULL),
(18, 'DL10022105', '1999.99', NULL, NULL, NULL, NULL, '2012-10-08 18:44:11', 0, 3, 100, NULL, NULL),
(19, 'DL100249', '1999.99', NULL, NULL, NULL, NULL, '2012-10-08 18:43:51', 0, 3, 100, NULL, NULL),
(20, 'DL100229', '1999.99', NULL, NULL, NULL, NULL, '2012-10-29 10:22:30', 0, 3, 100, NULL, NULL),
(21, 'COPY OF DL100229', '1999.99', NULL, NULL, NULL, NULL, '2012-10-08 18:47:36', 1, 5, 100, NULL, NULL),
(22, 'DLBLK100', '3250.00', NULL, NULL, NULL, NULL, '2012-10-29 10:31:08', 1, 6, 100, NULL, NULL),
(23, '', '2199.00', NULL, NULL, NULL, NULL, '2012-10-29 10:31:08', 0, 6, 0, NULL, NULL),
(24, '', '2199.00', NULL, NULL, NULL, NULL, '2012-10-29 10:31:08', 0, 6, 0, NULL, NULL),
(25, '', '2199.00', NULL, NULL, NULL, NULL, '2012-10-29 10:31:08', 0, 6, 0, NULL, NULL),
(26, '', '2199.00', NULL, NULL, NULL, NULL, '2012-10-29 10:31:08', 0, 6, 0, NULL, NULL),
(27, 'DL300229', '2499.99', NULL, NULL, NULL, NULL, '2012-10-08 19:07:48', 1, 7, 0, NULL, NULL),
(28, '', '2499.99', NULL, NULL, NULL, NULL, '2012-10-08 19:07:48', 0, 7, 0, NULL, NULL),
(29, '', '2499.99', NULL, NULL, NULL, NULL, '2012-10-08 19:07:48', 0, 7, 0, NULL, NULL),
(30, '', '2499.99', NULL, NULL, NULL, NULL, '2012-10-08 19:07:48', 0, 7, 0, NULL, NULL),
(31, '', '2499.99', NULL, NULL, NULL, NULL, '2012-10-08 19:07:48', 0, 7, 0, NULL, NULL),
(32, '', '2499.99', NULL, NULL, NULL, NULL, '2012-10-08 19:07:48', 0, 7, 0, NULL, NULL),
(33, '', '2499.99', NULL, NULL, NULL, NULL, '2012-10-08 19:07:48', 0, 7, 0, NULL, NULL),
(34, '', '2499.99', NULL, NULL, NULL, NULL, '2012-10-08 19:07:48', 0, 7, 0, NULL, NULL),
(35, '', '2499.99', NULL, NULL, NULL, NULL, '2012-10-08 19:07:48', 0, 7, 0, NULL, NULL),
(36, 'COPY OF DL200229', '0.01', NULL, NULL, NULL, NULL, '2012-10-29 10:18:42', 1, 8, 0, NULL, NULL),
(37, 'COPY OF DL200229', '0.01', NULL, NULL, NULL, NULL, '2012-10-29 10:18:44', 1, 9, 0, NULL, NULL),
(38, 'COPY OF DL200229', '0.01', NULL, NULL, NULL, NULL, '2012-10-29 10:18:47', 1, 10, 0, NULL, NULL),
(39, 'COPY OF DL100229', '0.01', NULL, NULL, NULL, NULL, '2012-10-29 10:31:05', 1, 11, 100, NULL, NULL),
(40, 'DLCHR100', '2950.00', NULL, NULL, NULL, NULL, NULL, 1, 12, 0, NULL, NULL),
(41, '', '2950.00', NULL, NULL, NULL, NULL, NULL, 0, 12, 0, NULL, NULL),
(42, '', '2950.00', NULL, NULL, NULL, NULL, NULL, 0, 12, 0, NULL, NULL),
(43, '', '3450.00', NULL, NULL, NULL, NULL, NULL, 0, 12, 0, NULL, NULL),
(44, '', '3550.00', NULL, NULL, NULL, NULL, NULL, 0, 12, 0, NULL, NULL),
(45, '', '2950.00', NULL, NULL, NULL, NULL, NULL, 0, 12, 0, NULL, NULL),
(46, '', '2950.00', NULL, NULL, NULL, NULL, NULL, 0, 12, 0, NULL, NULL),
(47, '', '3450.00', NULL, NULL, NULL, NULL, NULL, 0, 12, 0, NULL, NULL),
(48, '', '3550.00', NULL, NULL, NULL, NULL, NULL, 0, 12, 0, NULL, NULL),
(49, 'COPY OF DLCHR100', '2950.00', NULL, NULL, NULL, NULL, '2012-10-29 10:39:21', 1, 13, 0, NULL, NULL),
(50, 'DLBLK100', '3250.00', NULL, NULL, NULL, NULL, NULL, 1, 14, 0, NULL, NULL),
(51, '', '3250.00', NULL, NULL, NULL, NULL, NULL, 0, 14, 0, NULL, NULL),
(52, '', '3250.00', NULL, NULL, NULL, NULL, NULL, 0, 14, 0, NULL, NULL),
(53, '', '3250.00', NULL, NULL, NULL, NULL, NULL, 0, 14, 0, NULL, NULL),
(54, '', '3250.00', NULL, NULL, NULL, NULL, NULL, 0, 14, 0, NULL, NULL),
(55, '', '3250.00', NULL, NULL, NULL, NULL, NULL, 0, 14, 0, NULL, NULL),
(56, '', '3250.00', NULL, NULL, NULL, NULL, NULL, 0, 14, 0, NULL, NULL),
(57, '', '3250.00', NULL, NULL, NULL, NULL, NULL, 0, 14, 0, NULL, NULL),
(58, '', '3250.00', NULL, NULL, NULL, NULL, NULL, 0, 14, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `spree_zones`
--

CREATE TABLE IF NOT EXISTS `spree_zones` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `default_tax` tinyint(1) default '0',
  `zone_members_count` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `spree_zones`
--

INSERT INTO `spree_zones` (`id`, `name`, `description`, `created_at`, `updated_at`, `default_tax`, `zone_members_count`) VALUES
(1, 'EU_VAT', 'Countries that make up the EU VAT zone.', '2009-06-04 17:22:26', '2009-06-04 17:22:26', 0, 0),
(2, 'North America', 'USA + Canada', '2009-06-04 17:22:41', '2009-06-04 17:22:41', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `spree_zone_members`
--

CREATE TABLE IF NOT EXISTS `spree_zone_members` (
  `id` int(11) NOT NULL auto_increment,
  `zoneable_id` int(11) default NULL,
  `zoneable_type` varchar(255) default NULL,
  `zone_id` int(11) default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1017582645 ;

--
-- Dumping data for table `spree_zone_members`
--

INSERT INTO `spree_zone_members` (`id`, `zoneable_id`, `zoneable_type`, `zone_id`, `created_at`, `updated_at`) VALUES
(4914820, 13, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(5807739, 96, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(35022990, 188, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(91991191, 163, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(120011419, 52, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(120937060, 117, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(195044517, 214, 'Spree::Country', 2, '2009-06-04 17:22:41', '2009-06-04 17:22:41'),
(244414130, 68, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(394938353, 162, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(423866172, 20, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(424792003, 90, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(477297967, 184, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(506358563, 53, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(507251676, 116, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(546142054, 142, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(690576312, 62, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(691747661, 110, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(729140670, 183, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(739772837, 213, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(776249265, 30, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(777453396, 74, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(807406092, 51, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(808610553, 125, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(847027202, 167, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(890329113, 194, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(929017584, 98, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(966149671, 67, 'Spree::Country', 1, '2009-06-04 13:22:26', '2009-06-04 13:22:26'),
(1017582644, 35, 'Spree::Country', 2, '2009-06-04 17:22:41', '2009-06-04 17:22:41');

-- --------------------------------------------------------

--
-- Table structure for table `technologies`
--

CREATE TABLE IF NOT EXISTS `technologies` (
  `id` int(11) NOT NULL auto_increment,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
