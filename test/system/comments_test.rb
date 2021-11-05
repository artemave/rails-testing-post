require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit post_path(posts(:one))

    assert_text 'Stuff'
    assert_text 'More stuff'
  end

test 'commenting on a post' do
  visit post_path(posts(:one))
  click_on 'Add Comment'

  fill_in 'Body', with: 'Bananas'
  click_on 'Create Comment'

  assert_text 'Comment was successfully created' unless js?
  assert_text 'Bananas'
end

test 'replying to a comment' do
  post = posts(:one)

  visit post_path(post)

  click_link 'Reply', match: :first
  fill_in 'Body', with: 'Bananas'
  click_on 'Create Comment'

  assert_text 'Comment was successfully created' unless js?
  assert_text 'Bananas'
end
end
