require "rails_helper"

RSpec.describe User, type: :model do
  describe '#from_omniauth' do
    let(:auth) {
      Class.new {
        class << self
          def provider
            "twitter"
          end

          def uid
            "UID9999"
          end

          def info
            Class.new {
              def self.email
                "test@sample.com"
              end
            }
          end
        end
      }
    }

    subject { User.from_omniauth(auth) }

    it 'does something' do
      expect(subject.provider).to eq "twitter"
      expect(subject.uid).to eq "UID9999"
      expect(subject.email).to eq "test@sample.com"
    end
  end
end
