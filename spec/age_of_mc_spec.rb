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

  def gems
    gem_list = []
    current_date = Time.now

    gem_list << 'apress-traits' if  current_date >= Time.new(2014, 9, 4)
    gem_list << 'apress-trait_companies' if current_date >= Time.new(2014, 10, 24)
    gem_list << 'apress-trait_rubrics' if current_date >= Time.new(2015, 2, 13)
    gem_list << 'apress-traits-product_rubric' if current_date >= Time.new(2015, 2, 19)
    gem_list << 'apress-traits-company_rubric' if current_date >= Time.new(2015, 2, 19)
    gem_list << 'apress-trait_products' if current_date >= Time.new(2015, 1, 3)

    gem_list
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

    describe "his gems" do
      context "when 2014-09-04" do
        before { Timecop.travel(Time.new(2014, 9, 4)) }

        it { expect(michail.gems).to match_array ['apress-traits'] }
      end

      context "when 2014-10-24" do
        before { Timecop.travel(Time.new(2014, 10, 24)) }

        it { expect(michail.gems).to match_array ['apress-traits', 'apress-trait_companies'] }
      end

      context "when 2015-01-03" do
        before { Timecop.travel(Time.new(2015, 1, 3)) }

        it { expect(michail.gems).to match_array ['apress-traits', 'apress-trait_companies', 'apress-trait_products'] }
      end

      context "when 2015-02-19" do
        before { Timecop.travel(Time.new(2015, 2, 19)) }

        it do
          expect(michail.gems).to(
            match_array(
              [
                'apress-traits',
                'apress-trait_companies',
                'apress-trait_products',
                'apress-traits-product_rubric',
                'apress-traits-company_rubric',
                'apress-trait_rubrics'
              ]
            )
          )
        end
      end

      after { Timecop.return }
    end
  end
end
