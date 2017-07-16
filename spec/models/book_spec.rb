require 'rails_helper'

RSpec.describe Book, type: :model do
  context "validations" do
     it { should validate_presence_of(:title) }
     it { should validate_presence_of(:description) }
     it { should validate_presence_of(:cover_url) }

     it { should validate_length_of(:title).is_at_most(80)  }
     it { should validate_length_of(:description).is_at_most(500) }
     it { should validate_length_of(:cover_url).is_at_most(120) }
  end
end
