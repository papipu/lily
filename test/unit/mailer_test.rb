require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "send" do
    @expected.subject = 'Mailer#send'
    @expected.body    = read_fixture('send')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Mailer.create_send(@expected.date).encoded
  end

end
