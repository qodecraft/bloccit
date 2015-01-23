require 'rails_helper'

describe Post do
  describe "Vote Methods" do
    
    before do
      @post = Post.create( title: 'post title', body: 'Post body has to be longer')
      3.times { @post.votes.create(value: 1) }
      2.times { @post.votes.create(value: -1) }
    end
    
    describe '#up_votes' do
      it "Counts the number of upvotes with value = 1" do
        expect( @post.up_votes ).to eq(3)
      end
    end
    
    describe '#down_votes' do
      it "counts the number of upvotes with value = -1" do
        expect( @post.down_votes ).to eq(2)
      end
    end
  
    describe '#points' do
      it "Adds the upvotes and downvotes" do
        expect( @post.points ).to eq(1)
      end
    end
  end
end