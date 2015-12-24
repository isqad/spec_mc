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

  def teamleader?
    Time.now >= Time.new(2015, 3, 30)
  end

  def first_rollback_at
    Time.new(2015, 11, 12)
  end

  def barmen?
    true
  end

  def duty_bachelor
    true
  end

  def customer_cart_to_db
    true
  end

  def a_lot_awesome_code
    [true, true]
  end

  def best?
    true
  end

  def tasks_count
    300
  end

  def merged_pull_requests_count
    2500
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

    describe "stay tunde..." do
      context "from 30/03/2015" do
        before { Timecop.travel(Time.new(2015, 3, 30)) }

        it { expect(michail).to be_teamleader }

        after { Timecop.return }
      end

      context "when 12/11/2015" do
        it "was his first rollback" do
          expect(michail.first_rollback_at.to_i).to eq Time.new(2015, 11, 12).to_i
        end
      end

      it "releases barmen project" do
        expect(michail).to be_barmen
      end

      it "releases customer cart to db" do
        expect(michail.customer_cart_to_db).to eq true
      end

      it "releases duty bachelor" do
        expect(michail.duty_bachelor).to eq true
      end

      it "completes so much awesome code" do
        expect(michail.a_lot_awesome_code).to eq [true, true]
      end
    end
  end

  describe "statistics" do
    it "300 tasks count" do
      expect(michail.tasks_count).to eq 300
    end

    it "2500 merged PR's" do
      expect(michail.merged_pull_requests_count).to eq 2500
    end
  end

  describe "Thank you!" do
    it "best friend" do
      expect(michail).to be_best
    end
  end
end
