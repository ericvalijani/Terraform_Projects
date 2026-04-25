server {
  listen ${ listen_port } ssl;
  server_name repo.salehmiri.ir;

  ssl_certificate /etc/ssl/certs/nexus-security.pem;
  ssl_certificate_key  /etc/ssl/private/nexus-security.key;

  client_max_body_size 640M;

  location / {
    proxy_set_header Host $host:$server_port;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto "https";
    proxy_pass http://127.0.0.1:${ proxy_port };
  }
}
