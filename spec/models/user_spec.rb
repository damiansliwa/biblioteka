require 'rails_helper'

RSpec.describe User, type: :model do
  context 'db columns' do
  	it { should have_db_column(:name).of_type(:string) }
  	it { should have_db_column(:surname).of_type(:string) }
  	it { should have_db_column(:email).of_type(:string) }
  	it { should have_db_column(:encrypted_password).of_type(:string) }
  end
end
