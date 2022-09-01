import ssl
import OpenSSL.SSL

def get_SSL_Expiry_Date(host, port):
    cert = ssl.get_server_certificate((host, port))
    x509 = OpenSSL.crypto.load_certificate(OpenSSL.crypto.FILETYPE_PEM, cert)
    print(x509.get_notAfter())

get_SSL_Expiry_Date("google.com", 443)