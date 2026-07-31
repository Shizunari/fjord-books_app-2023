# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: I18n.t('.books.index.html_title')
  end

  test 'should create book' do
    visit books_url
    click_on I18n.t('.books.index.new_book')

    fill_in I18n.t('.activerecord.attributes.book.memo'), with: @book.memo
    fill_in I18n.t('.activerecord.attributes.book.title'), with: @book.title
    click_on I18n.t('.helpers.submit.create', model: I18n.t('.activerecord.models.book'))

    assert_text I18n.t('.flash.books.create.notice')
    click_on I18n.t('.books.new.link_index')
  end

  test 'should update Book' do
    visit book_url(@book)
    click_on I18n.t('.books.show.link_edit'), match: :first

    fill_in I18n.t('.activerecord.attributes.book.memo'), with: @book.memo
    fill_in I18n.t('.activerecord.attributes.book.title'), with: @book.title
    click_on I18n.t('.helpers.submit.update', model: I18n.t('.activerecord.models.book'))

    assert_text I18n.t('.flash.books.update.notice')
    click_on I18n.t('.books.new.link_index')
  end

  test 'should destroy Book' do
    visit book_url(@book)
    click_on I18n.t('.books.show.delete_book'), match: :first

    assert_text I18n.t('.flash.books.destroy.notice')
  end

  test 'should switch language' do
    visit books_url
    click_on I18n.t('.links.language_switch')

    test_locale = I18n.locale == :ja ? :en : :ja
    assert_selector 'h1', text: I18n.t('.books.index.html_title', locale: test_locale)
  end
end
