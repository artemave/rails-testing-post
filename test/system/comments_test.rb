require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit post_url(posts(:one))

    assert_text 'Stuff'
    assert_text 'More stuff'
  end

  test 'commenting on a post' do
    visit post_url(posts(:one))
    click_on 'Add Comment'

    fill_in 'Body', with: 'Bananas'
    click_on 'Create Comment'

    assert_text 'Comment was successfully created'
    assert_text 'Bananas'
  end

  test 'replying to a comment' do
    post = posts(:one)
    comment = post.comments.first

    visit post_url(post)

    within "#comment_#{comment.id}" do
      click_link 'Reply'
    end
    fill_in 'Body', with: 'Bananas'
    click_on 'Create Comment'

    assert_text 'Comment was successfully created' unless js?
    within "#comment_#{comment.id}" do
      assert_text 'Bananas'
    end
  end
end
