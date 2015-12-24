require 'attr_extras'
require 'timecop'
require 'rspec'

class MichailSogomonyan
  rattr_initialize :start_date

  def first_projects
    %w(knife knocker)
  end

  def gem_ninja?
    Time.now.year == 2014
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

  describe "as blizko developer" do
    context "when was 2014" do
      before { Timecop.travel(Time.new(2014, 1, 1)) }

      it "became gem ninja!" do
        expect(michail).to be_gem_ninja
      end

      after { Timecop.return }
    end
  end
end
