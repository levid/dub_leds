Deface::Override.new(:virtual_path => "shared/_store_menu",
                      :name => "cart-icon",
                      :original => "<%= link_to_cart %>",
                      :replace_contents => "#link-to-cart[data-hook]",
                      :partial => "shared/cart_icon")