require 'rails_helper'
#clear
# name age gender photo breed and location
RSpec.describe List, type: :model do	
  context 'Model validation tests' do
  	subject {
  		described_class.new(task: 'Prueba M', status: 'true')
  	}

    it "is valid with valid atributes" do
      expect(subject).to be_valid
    end


    it "no valid without task" do
    	subject.task= nil
    	expect(subject).to_not be_valid
    end

    it "no valid without status" do
    	subject.status = nil
    	expect(subject).to_not be_valid
    end


    context "status should be boolean" do
      it 'status type validation' do
      	expect(subject).to be_valid
        expect(subject.status).to be_in([true, false])
      end
    end
  end
end