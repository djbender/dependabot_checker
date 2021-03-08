RSpec.describe DependabotScanner do
  it 'has a version number' do
    expect(DependabotScanner::VERSION).not_to be nil
  end

  describe DependabotScanner::Core do
    subject { DependabotScanner::Core.new(owner) }
    let(:owner) { :"djbender-test-org" }

    it { is_expected.to be_instance_of DependabotScanner::Core }

    describe '#client' do
      it { expect(subject.client).to be_instance_of Octokit::Client }
    end

    describe '#owner' do
      it { expect(subject.owner).to eq owner.to_s }
    end

    describe '#repos_with_dependabot' do
      it { expect(subject.repos_with_dependabot).to be_empty }
    end
  end
end
