module Spree
  class ShippingCategory < ActiveRecord::Base
    attr_accessible :name
    validates :name, :presence => true
    has_many :products
    has_many :shipping_methods
  end
end
