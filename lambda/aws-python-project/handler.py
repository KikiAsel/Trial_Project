import json
import ssl
import socket
import datetime

def hello(event, context):
    body = {
        "message": "Go Serverless v3.0! Your function executed successfully!",
        "input": event,
    }

    return {"statusCode": 200, "body": json.dumps(body)}

def ssl_expiry_datetime(host, port=443):
    ssl_date_fmt = r'%b %d %H:%M:%S %Y %Z'

    context = ssl.create_default_context()
    conn = context.wrap_socket(
        socket.socket(socket.AF_INET),
        server_hostname=host,
    )
    # 3 second timeout because Lambda has runtime limitations
    conn.settimeout(3.0)
    conn.connect((host, port))
    ssl_info = conn.getpeercert()
    print(ssl_info)
    # parse the string from the certificate into a Python datetime object
    res = datetime.datetime.strptime(ssl_info['notAfter'], ssl_date_fmt)
    return res

print(ssl_expiry_datetime("google.com"))
