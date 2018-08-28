require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
	@item = Item.new(name: "Zemsta", author: "Aleksander Fredro",
									ISBN: "9788386581788", item_type: "0")
  end

  test "should be valid" do
  	assert @item.valid?
  end
end
