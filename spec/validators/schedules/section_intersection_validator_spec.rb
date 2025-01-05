require 'rails_helper'

RSpec.describe Schedules::SectionIntersectionValidator do
  describe 'valid?' do
    subject { described_class.new(student, section).valid? }

    let(:student) { create(:student) }
    let(:section) do
      create(
        :section,
        days_of_week: [ 1, 2 ],
        start_at: Time.new(2000, 1, 1, 10, 0),
        end_at: Time.new(2000, 1, 1, 10, 50)
      )
    end

    it { is_expected.to be_truthy }

    context 'when already existing section' do
      before do
        existing_section = create(
          :section,
          days_of_week: days_of_week,
          start_at: start_at,
          end_at: end_at
        )
        create(:schedule, student: student, section: existing_section)
      end

      let(:days_of_week) { [ 2, 3 ] }
      let(:start_at) { Time.new(2000, 1, 1, 13, 0) }
      let(:end_at) { Time.new(2000, 1, 1, 13, 50) }

      it { is_expected.to be_truthy }

      context 'when days not intersection' do
        let(:days_of_week) { [ 3, 4 ] }
        let(:start_at) { Time.new(2000, 1, 1, 10, 0) }
        let(:end_at) { Time.new(2000, 1, 1, 10, 50) }

        it { is_expected.to be_truthy }
      end

      context 'existing section before passing section' do
        let(:start_at) { Time.new(2000, 1, 1, 9, 0) }
        let(:end_at) { Time.new(2000, 1, 1, 9, 50) }

        it { is_expected.to be_truthy }
      end

      context 'existing section after passing section' do
        let(:start_at) { Time.new(2000, 1, 1, 13, 0) }
        let(:end_at) { Time.new(2000, 1, 1, 13, 50) }

        it { is_expected.to be_truthy }
      end

      context 'start_at existing section less than start_at passing section' do
        let(:start_at) { Time.new(2000, 1, 1, 9, 0) }
        let(:end_at) { Time.new(2000, 1, 1, 10, 15) }

        it { is_expected.to be_falsey }
      end

      context 'passing section has inside intersection with existing section' do
        let(:start_at) { Time.new(2000, 1, 1, 9, 0) }
        let(:end_at) { Time.new(2000, 1, 1, 11, 00) }

        it { is_expected.to be_falsey }
      end

      context 'existing section has inside intersection with passing section' do
        let(:start_at) { Time.new(2000, 1, 1, 10, 5) }
        let(:end_at) { Time.new(2000, 1, 1, 10, 20) }

        it { is_expected.to be_falsey }
      end

      context 'end_at existing section more than end_at passing section' do
        let(:start_at) { Time.new(2000, 1, 1, 10, 5) }
        let(:end_at) { Time.new(2000, 1, 1, 11, 0) }

        it { is_expected.to be_falsey }
      end
    end
  end
end
