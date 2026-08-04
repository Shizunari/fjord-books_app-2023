# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本の一覧'
  end

  test 'should create book' do
    visit books_url
    click_on '新しい本を登録'

    fill_in '本に対するコメント', with: @book.memo
    fill_in 'タイトル', with: @book.title
    click_on '本を登録'

    assert_text '本を登録しました。'
    click_on '一覧ページに戻る'
  end

  test 'should update Book' do
    visit book_url(@book)
    click_on 'この本の情報を編集', match: :first

    fill_in '本に対するコメント', with: @book.memo
    fill_in 'タイトル', with: @book.title
    click_on '本の情報を更新'

    assert_text '本の情報を更新しました。'
    click_on '一覧ページに戻る'
  end

  test 'should destroy Book' do
    visit book_url(@book)
    click_on 'この本の情報を削除', match: :first

    assert_text '本を削除しました。'
  end

  test 'should switch language' do
    visit books_url
    click_on 'Switch language to English'

    assert_selector 'h1', text: 'Books'
  end
end
