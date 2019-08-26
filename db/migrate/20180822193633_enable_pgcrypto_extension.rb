class EnablePgcryptoExtension < ActiveRecord::Migration[5.1]
  def change
    # enable_extension 'uuid-ossp'
    # enable_extension 'pgcrypto'
    execute('CREATE extension if NOT EXISTS pgcrypto;')
  end
end
