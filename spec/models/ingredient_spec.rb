require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:ingredient ){create :ingredient}

  describe "ActiveRecord associations" do
    context "For case valid validation" do
      before {
        ingredient
      }

      it "should be valid" do
        expect(ingredient).to be_valid
      end
    end

    context "For case in-valid validation" do
      before {
        ingredient
      }

      it "should be in-valid" do
        ingredient.uses = nil
        expect(ingredient).not_to be_valid
      end

      it "should validate uses can't be blank" do
        ingredient.uses = nil
        expect(ingredient.errors.messages[:uses].include?("can't be blank"))
      end

      it "should validate contraindications can't be blank" do
        ingredient.contraindications = nil
        expect(ingredient.errors.messages[:contraindications].include?("can't be blank"))
      end

    end
  end
end
