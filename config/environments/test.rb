Rails.application.configure do
  # Test ortamı sadece testlerin çalıştırılması içindir.
  # Test veritabanı her test koşusunda sıfırlanır.

  # Dosya değişikliklerini izleme devre dışı, testlerde gerek yok.
  config.enable_reloading = false

  # Sürekli entegrasyon (CI) varsa tüm uygulamayı eager load et.
  config.eager_load = ENV["CI"].present?

  # Testlerde public dosyaları cache'le (performans için).
  config.public_file_server.headers = { "Cache-Control" => "public, max-age=3600" }

  # Hatalarda detaylı geri bildirim göster.
  config.consider_all_requests_local = true

  # Cache'i tamamen kapat (null_store).
  config.cache_store = :null_store

  # Hata yakalamada özel exception sayfası göster, diğerlerini yükselt.
  config.action_dispatch.show_exceptions = :rescuable

  # CSRF korumasını test ortamında kapat.
  config.action_controller.allow_forgery_protection = false

  # ActiveStorage dosyalarını local ve geçici dizinde sakla.
  config.active_storage.service = :test

  # E-postalar gerçek gönderilmez, ActionMailer test modunda.
  config.action_mailer.delivery_method = :test

  # Mailer'daki linklerde kullanılacak host.
  config.action_mailer.default_url_options = { host: "example.com" }

  # Deprecation uyarılarını standart hata çıkışına yaz.
  config.active_support.deprecation = :stderr

  # Eksik çeviri varsa hata fırlatma (gerekirse aktif et).
  # config.i18n.raise_on_missing_translations = true

  # Render edilen view dosyalarının adlarını yorum olarak ekle (gerekirse).
  # config.action_view.annotate_rendered_view_with_filenames = true

  # before_action'da olmayan aksiyon referanslarına hata fırlat.
  config.action_controller.raise_on_missing_callback_actions = true
end
