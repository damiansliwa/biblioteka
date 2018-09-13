# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  author     :string
#  ISBN       :string
#  item_type  :integer          default("book")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  cover      :string
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
	@item = Item.new(name: "Zemsta", author: "Aleksander Fredro",
									ISBN: "978-83-060-3367-0", item_type: "0")
  end

  test "should be valid" do
  	assert @item.valid?
  end

  test "name should be present" do
    @item.name = "     "
    assert_not @item.valid?
  end

  test "name should not be too long" do
    @item.name = "a" * 151
    assert_not @item.valid?
  end

  test "ISBN should have correct length" do
    @item.ISBN = "a" * 18
    assert_not @item.valid?
  end
end
