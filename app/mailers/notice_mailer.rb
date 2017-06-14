class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_foto.subject
  #
  def sendmail_foto(foto)
    @foto = foto

    mail to: "fumilein23@yahoo.co.jp",
    subject: '【Slowgram】Slowgramが投稿されました'
  end
end
