RSpec.shared_examples 'unauthenticated' do
  context 'unauthenticated' do
    scenario 'redirect to login path' do
      visit path

      expect(current_path).to eql(new_profile_session_path)
    end
  end
end
