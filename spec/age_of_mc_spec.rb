require 'rspec'

class MichailSogomonyan
  attr_reader :start_date

  def initialize(start_date)
    @start_date = start_date
  end

  def first_projects
    %w(knife knocker)
  end
end

RSpec.describe MichailSogomonyan do
  let(:michail) { described_class.new('05/09/2013') }

  describe "A long time ago in a galaxy far, far away" do
    context "When 05/09/2013" do
      it "starts work in blizko" do
        expect(michail.start_date).to eq '05/09/2013'
      end
    end
  end

  describe "first projects" do
    it "are \"knife\" and \"knocker\"" do
      expect(michail.first_projects).to match_array ['knife', 'knocker']
    end
  end
end
