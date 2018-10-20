require_relative '../app/models/task'

RSpec.describe Task do 
    describe '#completed?' do
        it 'the task was completed' do
            task = Task.new
            result = task.completed?
            expect(result).to eq true
        end
    end
end