class NoticeMailer < ApplicationMailer

  def sendmail_topic(topic)
    @topic = topic

    mail to: "ikebright@gmail.com",
         subject: 'Topicが投稿されました'
  end
end
