dir=/home/ubuntu/web-automation

cp -u ${dir}/keys.json config/
mkdir -p config/third-party/google/analytics/ && cp -u ${dir}/google/analytics/client_secrets.json config/third-party/google/analytics/
mkdir -p config/third-party/google/analytics/credentials && cp -u ${dir}/google/analytics/credentials/StoredCredential config/third-party/google/analytics/credentials
mkdir -p config/third-party/google/mail/ && cp -u ${dir}/google/mail/credentials.json config/third-party/google/mail/
mkdir -p config/third-party/google/mail/tokens/ && cp -u ${dir}/google/mail/tokens/StoredCredential config/third-party/google/mail/tokens

mkdir -p config/env/ && cp ${dir}/application.properties config/env
