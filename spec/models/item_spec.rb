require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'db columns' do
  	it { should have_db_column(:name).of_type(:string) }
  	it { should have_db_column(:author).of_type(:string) }
  	it { should have_db_column(:ISBN).of_type(:string) }
  	it { should have_db_column(:item_type).of_type(:integer) }
    it { should define_enum_for(:item_type) }
    it { should belong_to(:user) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(150) }
    it { should validate_length_of(:ISBN).is_equal_to(17) }
  end
end
