# Main Module: generate / interpret Relay IDs
class IdEncoder
  # Helper (do not reference directly): makes sure that things are URL safe
  module URLSafeEncoder
    def self.encode(str)
      Base64.urlsafe_encode64(str)
    end

    def self.decode(str)
      Base64.urlsafe_decode64(str)
    end
  end

  def self.encode(tenant, type_name, id)
    salt = Digest::MD5.hexdigest("#{tenant}/#{type_name}/#{id}")[0,5] # prevent https://en.wikipedia.org/wiki/Known-plaintext_attack
    URLSafeEncoder.encode("#{tenant}/#{type_name}/#{id}/#{salt}")
  end

  def self.decode(uuid)
    return [nil, uuid] if uuid.is_a?(Integer)
    return unless uuid
    tenant, type, id = URLSafeEncoder.decode(uuid).split("/").first(3) # exclude salt
    return [tenant, type, id.to_i] # coerce ID back to integer, otherwise it will be a string
  end
end
