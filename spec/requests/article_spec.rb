require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET /articles' do
    it 'User gets access to article list' do
      get articles_path
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /article/:id' do
    it 'User gets access to article page' do
      article = create(:article)
      get article_path(article.id)
      expect(response.status).to eq(200)
    end
  end
end
