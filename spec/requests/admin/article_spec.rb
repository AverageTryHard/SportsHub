require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  let(:category) { create(:category) }
  let(:admin) { create(:confirmed_admin) }

  describe 'GET admin/articles' do
    it 'Admin gets access to article list' do
      sign_in admin
      get admin_articles_path('category' => category.id)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET admin/articles/:id/edit' do
    it 'Admin gets access to article edit form' do
      sign_in admin
      article = create(:article)
      get edit_admin_article_path(id: article.id)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET admin/articles/new' do
    it 'Admin gets access to new article form' do
      sign_in admin
      get new_admin_article_path('category' => category.id)
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE admin/articles/:id' do
    it 'Admin delete article' do
      sign_in admin
      article = create(:article)
      delete admin_article_path(id: article.id)
      expect(response.status).to eq(302)
    end
  end

  describe 'GET admin/article/:id' do
    it 'Admin gets access to article page' do
      sign_in admin
      test_article = create(:article)
      get article_path(test_article.id)
      expect(response.status).to eq(200)
    end
  end
end
