Tenant.create(subdomain: 'demo') if Tenant.where(subdomain: 'demo').count == 0
