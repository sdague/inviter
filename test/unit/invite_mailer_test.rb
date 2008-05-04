require File.dirname(__FILE__) + '/../test_helper'

class InviteMailerTest < ActionMailer::TestCase
  tests InviteMailer
  def test_invite
    @expected.subject = 'InviteMailer#invite'
    @expected.body    = read_fixture('invite')
    @expected.date    = Time.now

    assert_equal @expected.encoded, InviteMailer.create_invite(@expected.date).encoded
  end

  def test_remind
    @expected.subject = 'InviteMailer#remind'
    @expected.body    = read_fixture('remind')
    @expected.date    = Time.now

    assert_equal @expected.encoded, InviteMailer.create_remind(@expected.date).encoded
  end

end
