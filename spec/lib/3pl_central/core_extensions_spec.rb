require 'spec_helper'
# require '3pl_central'
describe 'ThreePLCentral' do
  describe 'CoreExtensions' do
    let(:core_ext) {Object.new.extend ThreePLCentral::CoreExtensions}
    let(:words) { %w{super fun classic brown test example bottle computer} }
    let(:word) {words.sample(1)[0]}
    let(:number) {rand(2..words.count)}
    describe '#camelize(string)' do
      let(:underscored_words) {words.sample(number).join("_")}

      context "when the string is multiple words, seperated by underscores" do
        it "should remove any underscores" do
          expect(core_ext.camelize(underscored_words)).to match /^((?!_).)*$/
        end

        it "should convert strings to UpperCamelCase" do
          expect(core_ext.camelize(underscored_words)).to match /^[A-Z][a-z]+[A-Za-z]+$/
        end
      end

      context "when the string is a single word" do
        it "should convert strings to UpperCamelCase" do
          expect(core_ext.camelize(word)).to match /^[A-Z][a-z]+[A-Za-z]+$/
        end
      end
    end

    describe '#underscore(string)' do
      context "when the words are in a UpperCamelCase string" do
        let(:camel_case_words) { words.sample(number).map(&:capitalize).join("") }
        it "should downcase all of the characters" do
          expect(core_ext.underscore(camel_case_words)).to match /^[a-z_]+$/
        end
      end
      context "when it is a single capitialized Word" do
        let(:camel_case_word) { words.sample(1)[0].capitalize }
        it "should downcase all of the characters" do
          expect(core_ext.underscore(camel_case_word)).to match /^[a-z_]+$/
        end
      end
    end

    describe '#constantize(string)' do
      context 'when the constant is defined' do
        it "should convert the string directly to a constant" do
          expect(core_ext.constantize("ThreePLCentral")).to eq ThreePLCentral
        end
        it "should handle namespaces appropriately" do
          expect(core_ext.constantize("ThreePLCentral::Order")).to eq ThreePLCentral::Order
        end
      end
      context "when the constant is not defined" do
        it "should raise a NameError" do
          expect{core_ext.constantize("SomeUndefinedConstant")}.to raise_error(NameError)
        end
      end
    end
  end
end
