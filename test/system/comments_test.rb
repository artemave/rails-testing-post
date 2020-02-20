require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit post_url(posts(:one))

    assert_text 'Stuff'
    assert_text 'More stuff'
  end

  test 'creating a Comment' do
    visit post_url(posts(:one))
    click_on 'Add Comment'

    fill_in 'Body', with: 'Bananas'
    click_on 'Create Comment'

    assert_text 'Comment was successfully created' unless self.class.js?
    assert_text 'Bananas'
  end
end
