require 'rails_helper'

describe Book  do
  context "validations" do
     it { should validate_presence_of(:title) }
     it { should validate_presence_of(:description) }
     it { should validate_presence_of(:cover_url) }
  end
end
