module Admei::EncryptedSettings
  def decrypt_settings(encrypted_settings)
    return {} if encrypted_settings.nil?
    JSON.parse(encrypted_settings.unpack('m').first.decrypt)
  end

  def encrypt_settings(settings)
    [JSON.dump(settings).encrypt].pack('m')
  end
end
